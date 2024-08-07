#include "dialogdevices.h"
#include "ui_dialogdevices.h"
#include "helpers.h"
#include <QFileDialog>
#include <QMessageBox>
#include <QFile>
#include <QTextStream>
#include <QVector>
#include <QPushButton> // Include QPushButton header for button creation

DialogDevices::DialogDevices(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogDevices)
{
    ui->setupUi(this);
    deviceSettings = new QSettings("./device_config.ini", QSettings::IniFormat);

}



DialogDevices::~DialogDevices()
{
    delete ui;
}

//***************** Initialization ******************


//***************** Processing ******************

void DialogDevices::accept()
{
//    qInfo("Accepted!");

    if (validateAndSave())
        QDialog::accept();
}




void DialogDevices::applyCalibrationDataToDevice(int dev_nr, const QVector<unsigned short>& data)
{
    // Implementation for applying the calibration data to the specific device
    // For example, updating device settings or performing calculations
    // Example: Set the calibration data in your application logic
    // deviceSettings->setValue("Device%1/CalibrationData", data); // if storing in settings
    // Check if device number is valid
    if (dev_nr < 0 || dev_nr >= deviceCalibrationData.size()) {
        QMessageBox::warning(this, "Invalid Device", "The device number is out of range.");
        return;
    }

    // Check if the provided data is valid
    if (data.size() != 320) {
        QMessageBox::warning(this, "Invalid Data", "The calibration data must contain exactly 320 values.");
        return;
    }

    // Apply the calibration data to the specified device
    deviceCalibrationData[dev_nr] = data;
}


// Load calibration factors from a file and store them
void DialogDevices::selectCalibrationFile(int dev_nr)
{
    QString filename = QFileDialog::getOpenFileName(this, "Select Calibration File", "", "Text Files (*.txt);;All Files (*)");

    if (filename.isEmpty()) {
        return; // User canceled the dialog
    }

    QVector<unsigned short> calibrationFactors(320, 8192); // Initialize with default value 8192
    QFile file(filename);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QMessageBox::critical(this, "Error", "Could not open calibration file: " + filename);
        return;
    }

    QTextStream in(&file);
    int index = 0;
    while (!in.atEnd() && index < 320) {
        QString line = in.readLine().trimmed();
        bool ok;
        int value = line.toInt(&ok);

        // Validate value and ensure it is within the range of an unsigned short
        if (ok && value >= 0 && value <= 65535) {
            calibrationFactors[index] = value;
        } else {
            qWarning() << "Invalid calibration factor in file:" << line << "at index" << index;
            calibrationFactors[index] = 8192; // Use default if invalid
        }
        index++;
    }

    // Ensure remaining indices are filled with default values
    while (index < 320) {
        calibrationFactors[index++] = 8192;
    }

    file.close();

    // Store calibration factors for the device
    if (dev_nr < deviceCalibrationData.size()) {
        deviceCalibrationData[dev_nr] = calibrationFactors;
    } else {
        deviceCalibrationData.append(calibrationFactors);
    }


    // Save the calibration file path to QSettings
    top(deviceSettings);
    QString group_label = QString("Device%1").arg(dev_nr);
    deviceSettings->beginGroup(group_label);
    deviceSettings->setValue("CalibFile", filename); // Save the file path
    deviceSettings->endGroup();


    // Update the table display to show the file path (optional)
    QTableWidgetItem* calibFileItem = new QTableWidgetItem(filename);
    ui->tableDevices->setItem(dev_nr, 10, calibFileItem);
}

// Retrieve all calibration factors for each device
QVector<QVector<unsigned short>> DialogDevices::getAllCalibrationFactors() const
{
    return deviceCalibrationData;
}

void DialogDevices::showEvent(QShowEvent * event)
{
    if (!event->spontaneous())
    {

        if (deviceSettings != NULL)
        {
            top(deviceSettings);
            deviceSettings->beginGroup("Global");

            ui->spinNrDevices->setValue(deviceSettings->value("NrDevices", int(1)).toInt());

            ui->tableDevices->setColumnCount(12);
            QStringList h_header;
            h_header.append("IP Address");
            h_header.append("Hardware ver.");
            h_header.append("Layer");
            h_header.append("Position");
            h_header.append("Sensors");
            h_header.append("Master");
            h_header.append("Master dly");
            h_header.append("Slave dly");
            h_header.append("Threshold");
            h_header.append("ClusterSize");
            h_header.append("CalibFile"); // Column for showing file path
            h_header.append("Select Calib File"); // New column for the button


            ui->tableDevices->setHorizontalHeaderLabels(h_header);

            importSettings();
        }
        initialized = 1;
    }

    QDialog::showEvent(event);
}

void DialogDevices::importSettings()
{
    int nr_devices = ui->spinNrDevices->value();
    ui->tableDevices->setRowCount(nr_devices);

    // Ensure the device calibration data vector is initialized properly
    deviceCalibrationData.resize(nr_devices, QVector<unsigned short>(320, 8192));

    for (int dev_nr = 0; dev_nr < nr_devices; dev_nr++)
    {
        if (dev_nr >= last_nr_devices)  // Update only new rows!
        {
            top(deviceSettings);
            QString group_label = QString("Device%1").arg(dev_nr);
            deviceSettings->beginGroup(group_label);

            QTableWidgetItem* newItem;
            newItem = new QTableWidgetItem(deviceSettings->value("IP", "0.0.0.0").toString());
            ui->tableDevices->setItem(dev_nr, 0, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("HardwareVer", "1").toString());
            ui->tableDevices->setItem(dev_nr, 1, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("Plane", "0").toString());
            ui->tableDevices->setItem(dev_nr, 2, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("Position", "0").toString());
            ui->tableDevices->setItem(dev_nr, 3, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("Sensors", "2").toString());
            ui->tableDevices->setItem(dev_nr, 4, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("Master", "0").toString());
            ui->tableDevices->setItem(dev_nr, 5, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("MasterDelay", "22").toString());
            ui->tableDevices->setItem(dev_nr, 6, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("SlaveDelay", "1").toString());
            ui->tableDevices->setItem(dev_nr, 7, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("Threshold", "10").toString());
            ui->tableDevices->setItem(dev_nr, 8, newItem);
            newItem = new QTableWidgetItem(deviceSettings->value("ClusterSize", "4").toString());
            ui->tableDevices->setItem(dev_nr, 9, newItem);

            // Load calibration file path and update table
            QString calibFilePath = deviceSettings->value("CalibFile", "").toString();
            newItem = new QTableWidgetItem(calibFilePath);
            ui->tableDevices->setItem(dev_nr, 10, newItem);

            // If the calibration file exists, load the factors
            if (!calibFilePath.isEmpty()) {
                QVector<unsigned short> calibrationFactors(320, 8192);
                if (loadCalibrationFactorsFromFile(calibFilePath, calibrationFactors)) {
                    deviceCalibrationData[dev_nr] = calibrationFactors;
                    applyCalibrationDataToDevice(dev_nr, calibrationFactors);
                }
            }


            // Add a button for selecting calibration files
            QPushButton* calibButton = new QPushButton("Select File");
            ui->tableDevices->setCellWidget(dev_nr, 11, calibButton);

            // Connect the button to the slot
            connect(calibButton, &QPushButton::clicked, this, [this, dev_nr]() { selectCalibrationFile(dev_nr); });
        }
    }

    last_nr_devices = nr_devices;
}

int DialogDevices::validateAndSave()
{
    if (deviceSettings == NULL)
        return 0;

    int nr_devices = ui->spinNrDevices->value();
    int data_ok = 1;

        //check each table row
    for (int dev_nr = 0; dev_nr < nr_devices; dev_nr++)
    {
            //first the IP
        QString user_data = ui->tableDevices->item(dev_nr,0)->text();
        QString generated = ip2num(user_data);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,0)->setText(generated);

            //hardware version
        user_data = ui->tableDevices->item(dev_nr,1)->text();
        int num_hw = user_data.toInt();
        if (num_hw < 1)
            num_hw = 1;
        if (num_hw > 2)
            num_hw = 2;
        generated = QString("%1").arg(num_hw);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,1)->setText(generated);

            //now the plane
        user_data = ui->tableDevices->item(dev_nr,2)->text();
        int num_value = user_data.toInt();
        if (num_value < 0)
            num_value = 0;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,2)->setText(generated);

            //now physical position
        user_data = ui->tableDevices->item(dev_nr,3)->text();
        num_value = user_data.toInt();
        if (num_value < 0)
            num_value = 0;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,3)->setText(generated);

            //now number of sensors
        user_data = ui->tableDevices->item(dev_nr,4)->text();
        num_value = user_data.toInt();
        int max_sensors = (num_hw == 1) ? 2 : 5;
        if (num_value < 1)
            num_value = 1;
        if (num_value > max_sensors)
            num_value = max_sensors;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,4)->setText(generated);

            //now master selector
        user_data = ui->tableDevices->item(dev_nr,5)->text();
        num_value = user_data.toInt();
        if (num_value < 0)
            num_value = 0;
        if (num_value > 1)
            num_value = 1;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,5)->setText(generated);

            //now master delay
        user_data = ui->tableDevices->item(dev_nr,6)->text();
        num_value = user_data.toInt();
        if (num_value < 1)
            num_value = 1;
        if (num_value > 255)
            num_value = 255;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,6)->setText(generated);

            //now slave delay
        user_data = ui->tableDevices->item(dev_nr,7)->text();
        num_value = user_data.toInt();
        if (num_value < 1)
            num_value = 1;
        if (num_value > 255)
            num_value = 255;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,7)->setText(generated);

        //now cluster threshold
        user_data = ui->tableDevices->item(dev_nr,8)->text();
        num_value = user_data.toInt();
        if (num_value < 1)
            num_value = 1;
        if (num_value > 65535)
            num_value = 65535;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,8)->setText(generated);

        //now cluster size
        user_data = ui->tableDevices->item(dev_nr,9)->text();
        num_value = user_data.toInt();
        if (num_value < 1)
            num_value = 1;
        if (num_value > 320)
            num_value = 320;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,9)->setText(generated);


        // Calibration file path
        user_data = ui->tableDevices->item(dev_nr, 10)->text();
        if (user_data.isEmpty()) {
            // Set default calibration factors if the path is empty
            QVector<unsigned short> defaultCalibration(320, 8192);
            deviceCalibrationData[dev_nr] = defaultCalibration;
            applyCalibrationDataToDevice(dev_nr, defaultCalibration);
        } else {
            deviceSettings->setValue("Device" + QString::number(dev_nr) + "/CalibFile", user_data); // Save the file path
        }
        // Save settings for each device
        top(deviceSettings);
        QString group_label = QString("Device%1").arg(dev_nr);
        deviceSettings->beginGroup(group_label);

        deviceSettings->setValue("IP", ui->tableDevices->item(dev_nr, 0)->text());
        deviceSettings->setValue("HardwareVer", ui->tableDevices->item(dev_nr, 1)->text());
        deviceSettings->setValue("Plane", ui->tableDevices->item(dev_nr, 2)->text());
        deviceSettings->setValue("Position", ui->tableDevices->item(dev_nr, 3)->text());
        deviceSettings->setValue("Sensors", ui->tableDevices->item(dev_nr, 4)->text());
        deviceSettings->setValue("Master", ui->tableDevices->item(dev_nr, 5)->text());
        deviceSettings->setValue("MasterDelay", ui->tableDevices->item(dev_nr, 6)->text());
        deviceSettings->setValue("SlaveDelay", ui->tableDevices->item(dev_nr, 7)->text());
        deviceSettings->setValue("Threshold", ui->tableDevices->item(dev_nr, 8)->text());
        deviceSettings->setValue("ClusterSize", ui->tableDevices->item(dev_nr, 9)->text());
        deviceSettings->setValue("CalibFile", ui->tableDevices->item(dev_nr, 10)->text());
        deviceSettings->endGroup();
    }


    // Store the global number of devices
    top(deviceSettings);
    deviceSettings->beginGroup("Global");
    deviceSettings->setValue("NrDevices", nr_devices);
    deviceSettings->endGroup();


    if (!data_ok) {
        QMessageBox::warning(this, "Invalid Data", "Some device settings were invalid and have been corrected. Please review the settings.");
    }



return data_ok;
}

// Function to load calibration factors from a file
bool DialogDevices::loadCalibrationFactorsFromFile(const QString& filePath, QVector<unsigned short>& calibrationFactors)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Could not open calibration file:" << filePath;
        return false;
    }

    QTextStream in(&file);
    int index = 0;
    while (!in.atEnd() && index < 320) {
        QString line = in.readLine().trimmed();
        bool ok;
        int value = line.toInt(&ok);

        // Validate value and ensure it is within the range of an unsigned short
        if (ok && value >= 0 && value <= 65535) {
            calibrationFactors[index] = static_cast<unsigned short>(value);
        } else {
            qWarning() << "Invalid calibration factor in file:" << line << "at index" << index;
            calibrationFactors[index] = 8192; // Use default if invalid
        }
        index++;
    }

    // Ensure remaining indices are filled with default values
    while (index < 320) {
        calibrationFactors[index++] = 8192;
    }

    file.close();
    return true;
}
void DialogDevices::on_spinNrDevices_valueChanged(int arg1)
{
    if (initialized)
        importSettings();
}

