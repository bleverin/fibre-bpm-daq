#include "display.h"
#include "ui_display.h"
#include <QMessageBox>
#include <QFileDialog>
#include <QCheckBox>

Display::Display(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::display)
{
    ui->setupUi(this);


    // Copy/Create and initialize radio buttons
    radioButtonFixedScale = ui->radioButtonFixedScale;//new QRadioButton("Fixed Scale", this);
    radioButtonAutoscale = ui->radioButtonAutoscale;//new QRadioButton("Autoscale", this);

    // Copy/Create and initialize the button group
    buttonGroup = ui->buttonGroup;//new QButtonGroup(this);
    buttonGroup->setExclusive(true); // Ensure exclusivity

    // Add radio buttons to the button group
    buttonGroup->addButton(ui->radioButtonFixedScale);
    buttonGroup->addButton(ui->radioButtonAutoscale);
    buttonGroup->addButton(ui->radioButtonMaxScale);

    // Connect the buttonClicked signal of the button group
    connect(buttonGroup, SIGNAL(buttonClicked(QAbstractButton*)), this, SLOT(onButtonClicked(QAbstractButton*)));

    connect(ui->pushButton_savebkg, &QPushButton::clicked, this, &Display::onSaveBackgroundClicked);
    connect(ui->pushButton_loadbkg, &QPushButton::clicked, this, &Display::onLoadBackgroundClicked);
    connect(ui->checkBox_subbkg, &QCheckBox::stateChanged, this, &Display::onCheckBoxStateChanged);
    connect(ui->pushButton_savecalib, &QPushButton::clicked, this, &Display::onSaveCalibrationClicked);
    connect(ui->pushButton_loadcalib, &QPushButton::clicked, this, &Display::onLoadCalibrationClicked);
    connect(ui->checkBox_expertmode, &QCheckBox::stateChanged, this, &Display::onExpertModeStateChanged);

    // Enable or disable the "Save Background" and "Save Calib" buttons accordingly
    ui->pushButton_savebkg->setEnabled(expertModeEnabled);
    ui->pushButton_savecalib->setEnabled(expertModeEnabled);
    // Gray out the buttons when they are disabled
    ui->pushButton_savebkg->setStyleSheet(expertModeEnabled ? "" : "background-color: gray;");
    ui->pushButton_savecalib->setStyleSheet(expertModeEnabled ? "" : "background-color: gray;");



}

Display::~Display()
{
    delete ui;
}

void Display::showEvent(QShowEvent * event)
{
    if (!event->spontaneous())
    {
       ui->plot->addGraph();

    }
    QDialog::showEvent(event);
}

//***********************************************

void Display::plot(const QVector<signed short> &data)
{
        //resize data vectors and fill X values - only if needed
    if (data.length() != nrPoints)
    {
        nrPoints = data.length();
        dataX.clear();
        dataY.clear();
        dataX.resize(nrPoints);
        dataY.resize(nrPoints);

        ui->plot->xAxis->setRange(0,nrPoints-1);
        //ui->plot->yAxis->setRange(-1000,66000);

        for (int i = 0; i < nrPoints; i++)
            dataX[i] = i;
    }

        //fill Y values
    double min = 65535;
    double max = 0;
    for (int i = 0; i < nrPoints; i++)
    {
        dataY[i] = /*65535 -*/ data[i];
        if (dataY[i] < min)
            min = dataY[i];
        if (dataY[i] > max)
            max = dataY[i];
    }

    QString planeName = ui->lineTitle->text();
    planeName.remove(QChar(' '));

    if (subtractBackground && ui->checkBox_subbkg->isChecked()) {
        // Check if background subtraction is enabled and the checkbox is checked
        // Check if background data exists for this plane
        if (backgroundDataMap.contains(planeName)) {
            const QVector<signed short> &backgroundData = backgroundDataMap[planeName];

            // Subtract background data from the current data
            for (int i = 0; i < nrPoints; ++i) {
                dataY[i] -= backgroundData[i];
            }
        }
    }

    if (applyCalibration && ui->checkBox_enablecalib->isChecked()) {
        // Check if calibration is enabled and the checkbox is checked
        // Check if calibration data exists
        if (calibrationDataMap.contains(planeName) ){
            const QVector<signed short> &calibrationData = calibrationDataMap[planeName];

            // Apply calibration to the current data
            for (int i = 0; i < nrPoints; ++i) {
                dataY[i] = dataY[i] / calibrationData[i];
            }
        }

    }

        //set Y range

    if (ui->radioButtonAutoscale->isChecked())
        ui->plot->yAxis->setRange(min-0.05*(max-min),max+0.05*(max-min));
    else if (ui->radioButtonFixedScale ->isChecked())
        ui->plot->yAxis->setRange(ui->spinBox_fixedmin->value(), ui->spinBox_fixedmax->value());
    else
        ui->plot->yAxis->setRange(-1000,66000);

        //feed plotter
    ui->plot->graph(0)->setData(dataX, dataY);

        //plot
    ui->plot->replot();
}

void Display::plot()
{
    plot(buffer);
}

void Display::setTitle(QString title)
{
    ui->lineTitle->setText(title);
}

// Slot to handle button clicks
void Display::onButtonClicked(QAbstractButton *button)
{
    // Handle button clicks here
    if (button == radioButtonFixedScale)
    {
        // Fixed Scale radio button clicked
        // Handle the Fixed Scale selection
        // Perform actions when Fixed Scale is selected
        radioButtonFixedScale->setChecked(true); // Enable relevant controls
        radioButtonAutoscale->setChecked(false); // Disable other controls
    }//
    else if (button == radioButtonAutoscale)
    {
        // Autoscale radio button clicked
        // Handle the Autoscale selection
        // Perform actions when Autoscale is selected
        ui->radioButtonFixedScale->setChecked(false); // Disable relevant controls
        ui->radioButtonAutoscale->setChecked(true); // setEnabled(true); // Enable other controls
    }
}

void Display::onSaveBackgroundClicked()
{
    // Check if there is data to save
    if (buffer.isEmpty()) {
        // No data to save
        return;
    }

    // Get the plane's name (you might need to adjust how you retrieve it)
    QString planeName = ui->lineTitle->text();

    // Remove invalid characters from the plane name (e.g., spaces)
    planeName.remove(QChar(' '));

    // Generate the filename with the plane name appended
    QString filename = QString("bkg/background_%1.txt").arg(planeName);

    // Open the file for writing
    QFile file(filename);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream stream(&file);

        // Write the data to the file
        for (int i = 0; i < buffer.size(); ++i) {
            stream << QString::number(buffer[i]) << "\n";
        }

        // Close the file
        file.close();

        // Notify the user that the data has been saved
        qInfo() << "Data saved to" << filename;
    } else {
        // Failed to open the file
        qWarning() << "Error: Failed to open" << filename << "for writing";
    }
}

void Display::onLoadBackgroundClicked()
{
    // Get the plane's name (you might need to adjust how you retrieve it)
    QString planeName = ui->lineTitle->text();

    // Remove invalid characters from the plane name (e.g., spaces)
    planeName.remove(QChar(' '));

    // Generate the filename with the plane name appended
    QString filename = QString("bkg/background_%1.txt").arg(planeName);

    // Open the file for reading
    QFile file(filename);
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);

        // Read the data from the file and store it in the map
        QVector<signed short> backgroundData;
        while (!stream.atEnd()) {
            QString line = stream.readLine();
            signed short value = line.toShort();
            backgroundData.append(value);
        }

        // Close the file
        file.close();

        // Store the background data in the map
        backgroundDataMap[planeName] = backgroundData;

        // Notify the user that the data has been loaded
        qInfo() << "Background data loaded for" << planeName;
    } else {
        // Failed to open the file
        qWarning() << "Error: Failed to open" << filename << "for reading";
    }
}

void Display::onCheckBoxStateChanged(int state)
{
    // The state argument will be Qt::Unchecked (0) or Qt::Checked (2)
    subtractBackground = (state == Qt::Checked);
}

void Display::onSaveCalibrationClicked()
{

    // Check if there is data to save
    if (buffer.isEmpty()) {
        // No data to save
        return;
    }

    // Get the plane's name (you might need to adjust how you retrieve it)
    QString planeName = ui->lineTitle->text();

    // Remove invalid characters from the plane name (e.g., spaces)
    planeName.remove(QChar(' '));

    // Generate the filename with the plane name appended
    QString filename = QString("calib/calibration_%1.txt").arg(planeName);

    // Open the file for writing
    QFile file(filename);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream stream(&file);

        // Write the data to the file
        for (int i = 0; i < buffer.size(); ++i) {
            stream << QString::number(buffer[i]) << "\n";
        }

        // Close the file
        file.close();

        // Notify the user that the data has been saved
        qInfo() << "Calibration data saved for" << planeName;
    } else {
        // Failed to open the file
        qWarning() << "Error: Failed to open" << filename << "for writing";
    }
}

void Display::onLoadCalibrationClicked()
{
    // Get the plane's name (you might need to adjust how you retrieve it)
    QString planeName = ui->lineTitle->text();

    // Remove invalid characters from the plane name (e.g., spaces)
    planeName.remove(QChar(' '));

    // Generate the filename with the plane name appended
    QString filename = QString("calib/calibration_%1.txt").arg(planeName);

    // Open the file for reading
    QFile file(filename);
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);

        // Read the data from the file and store it in a vector
        QVector<signed short> calibrationData;
        while (!stream.atEnd()) {
            QString line = stream.readLine();
            signed short value = line.toShort();
            calibrationData.append(value);
        }

        // Close the file
        file.close();

        // Normalize the calibration data to the median value of all values greater than zero
        QVector<signed short> normalizedCalibrationData = calibrationData; // Copy the data
        QVector<signed short> normalizedCalibrationData2 = calibrationData; // Copy the data again

        // Remove values less than 50 (noise or dead channels) before determining the median for live channels
        normalizedCalibrationData.erase(std::remove_if(normalizedCalibrationData.begin(), normalizedCalibrationData.end(), [](signed short value) {
                                            return value < 50;
                                        }), normalizedCalibrationData.end());
        std::sort(normalizedCalibrationData.begin(), normalizedCalibrationData.end()); // Sort the data

        int size = normalizedCalibrationData.size();
        signed short medianValue = 0;

        if (size % 2 == 0) {
            // If the size is even, take the average of the two middle values
            medianValue = (normalizedCalibrationData[size / 2 - 1] + normalizedCalibrationData[size / 2]) / 2;
        } else {
            // If the size is odd, take the middle value
            medianValue = normalizedCalibrationData[size / 2];
        }

        //use the second copy to return the scaled calibration values.
        for (signed short &value : normalizedCalibrationData2) {
            if (value > 50) {
                value /= medianValue;
            }
            else
            {
                value = 0;
            }
        }

        // Store the normalized calibration data in the map
        calibrationDataMap[planeName] = normalizedCalibrationData2;

        // Notify the user that the data has been loaded and normalized
        qInfo() << "Calibration data loaded and normalized for" << planeName;
    } else {
        // Failed to open the file
        qWarning() << "Error: Failed to open" << filename << "for reading";
    }
}

void Display::onCalibrationCheckBoxChanged(int state) {
    // Check the state and update the subtractCalibration flag accordingly
    applyCalibration = (state == Qt::Checked);
}


// Slot to handle the state change of the "Expert Mode" checkbox
void Display::onExpertModeStateChanged(int state)
{
    // Check if the checkbox is checked (Expert Mode enabled)
    expertModeEnabled = (state == Qt::Checked);

    // Enable or disable the "Save Background" and "Save Calib" buttons accordingly
    ui->pushButton_savebkg->setEnabled(expertModeEnabled);
    ui->pushButton_savecalib->setEnabled(expertModeEnabled);
    // Gray out the buttons when they are disabled
    ui->pushButton_savebkg->setStyleSheet(expertModeEnabled ? "" : "background-color: gray;");
    ui->pushButton_savecalib->setStyleSheet(expertModeEnabled ? "" : "background-color: gray;");

}