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
}

DialogDevices::~DialogDevices()
{
    delete ui;
}

//***************** Initialization ******************

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

//***************** Processing ******************

void DialogDevices::accept()
{
//    qInfo("Accepted!");

    if (validateAndSave())
        QDialog::accept();
}


void DialogDevices::selectCalibrationFile(int dev_nr)
{
    // Open a file dialog to select a calibration file
    QString filename = QFileDialog::getOpenFileName(this, "Select Calibration File", "", "Text Files (*.txt);;All Files (*)");

    if (filename.isEmpty())
    {
        return; // User canceled the dialog
    }

    // Set the file name in the table for the corresponding device
    QTableWidgetItem* calibItem = new QTableWidgetItem(filename);
    ui->tableDevices->setItem(dev_nr, 10, calibItem);

    // Load calibration data from the file
    QVector<unsigned short> calibrationData;
    QFile file(filename);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QMessageBox::critical(this, "Error", "Could not open file for reading");
        return;
    }

    QTextStream in(&file);
    while (!in.atEnd())
    {
        QString line = in.readLine();
        bool ok;
        unsigned short value = line.toUShort(&ok);

        if (ok)
        {
            calibrationData.append(value);
        }
        else
        {
            calibrationData.append(32768); // assume calibration range is 0 = and 1 = 65536
            QMessageBox::warning(this, "Warning", "Invalid data in file. Skipping line.");
        }
    }

    file.close();

    // Store the calibration data for the device
    applyCalibrationDataToDevice(dev_nr, calibrationData);
}

void DialogDevices::applyCalibrationDataToDevice(int dev_nr, const QVector<unsigned short>& data)
{
    // Implementation for applying the calibration data to the specific device
    // For example, updating device settings or performing calculations
    qDebug() << "Calibration data loaded for Device" << dev_nr << ":" << data;

    // Example: Set the calibration data in your application logic
    // deviceSettings->setValue("Device%1/CalibrationData", data); // if storing in settings
}


void DialogDevices::importSettings()
{
    int nr_devices = ui->spinNrDevices->value();

    ui->tableDevices->setRowCount(nr_devices);

    for (int dev_nr = 0; dev_nr < nr_devices; dev_nr++)
    {
        if (dev_nr >= last_nr_devices)  //update only new rows!
        {
            top(deviceSettings);
            QString group_label = QString("Device%1").arg(dev_nr);
            deviceSettings->beginGroup(group_label);

            QTableWidgetItem* newItem;
            newItem = new QTableWidgetItem(deviceSettings->value("IP","0.0.0.0").toString());
            ui->tableDevices->setItem(dev_nr, 0, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("HardwareVer","1").toString());
            ui->tableDevices->setItem(dev_nr, 1, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("Plane","0").toString());
            ui->tableDevices->setItem(dev_nr, 2, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("Position","0").toString());
            ui->tableDevices->setItem(dev_nr, 3, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("Sensors","2").toString());
            ui->tableDevices->setItem(dev_nr, 4, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("Master","0").toString());
            ui->tableDevices->setItem(dev_nr, 5, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("MasterDelay","22").toString());
            ui->tableDevices->setItem(dev_nr, 6, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("SlaveDelay","1").toString());
            ui->tableDevices->setItem(dev_nr, 7, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("ClusThresh","10").toString());
            ui->tableDevices->setItem(dev_nr, 8, newItem );
            newItem = new QTableWidgetItem(deviceSettings->value("ClusSize","4").toString());
            ui->tableDevices->setItem(dev_nr, 9, newItem );

            // Add an item for the calibration file path (optional, for display)
            newItem = new QTableWidgetItem(deviceSettings->value("CalibFile", "").toString());
            ui->tableDevices->setItem(dev_nr, 10, newItem);

            // Add a button for selecting calibration files
            QPushButton* calibButton = new QPushButton("Select File");
            ui->tableDevices->setCellWidget(dev_nr, 11, calibButton); // Column index 11 for button

            // Connect the button to a slot with the sensor index as a parameter
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
        if (num_value > 255)
            num_value = 255;
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
        if (num_value > 255)
            num_value = 255;
        generated = QString("%1").arg(num_value);
            //if the strings are identical, save the value and return 1
        if (generated.compare(user_data) != 0)
            data_ok = 0;
        ui->tableDevices->item(dev_nr,9)->setText(generated);

    }

        //now store the data
    if (!data_ok)
        return 0;

    top(deviceSettings);
    deviceSettings->beginGroup("Global");
    deviceSettings->setValue("NrDevices", nr_devices);

    for (int dev_nr = 0; dev_nr < nr_devices; dev_nr++)
    {
        top(deviceSettings);
        QString group_label = QString("Device%1").arg(dev_nr);
        deviceSettings->beginGroup(group_label);

        deviceSettings->setValue("IP", ui->tableDevices->item(dev_nr,0)->text());
        deviceSettings->setValue("HardwareVer", ui->tableDevices->item(dev_nr,1)->text());
        deviceSettings->setValue("Plane", ui->tableDevices->item(dev_nr,2)->text());
        deviceSettings->setValue("Position", ui->tableDevices->item(dev_nr,3)->text());
        deviceSettings->setValue("Sensors", ui->tableDevices->item(dev_nr,4)->text());
        deviceSettings->setValue("Master", ui->tableDevices->item(dev_nr,5)->text());
        deviceSettings->setValue("MasterDelay", ui->tableDevices->item(dev_nr,6)->text());
        deviceSettings->setValue("SlaveDelay", ui->tableDevices->item(dev_nr,7)->text());
        deviceSettings->setValue("Threshold", ui->tableDevices->item(dev_nr,8)->text());
        deviceSettings->setValue("ClusterSize", ui->tableDevices->item(dev_nr,9)->text());
        deviceSettings->setValue("CalibFile", ui->tableDevices->item(dev_nr, 10)->text());
    }

    return 1;
}


void DialogDevices::on_spinNrDevices_valueChanged(int arg1)
{
    if (initialized)
        importSettings();
}

QVector<QVector<int>> DialogDevices::getAllCalibrationFactors() const {
    QVector<QVector<int>> calibrationFactors;
    for (int row = 0; row < ui->tableDevices->rowCount(); ++row) {
        QVector<int> factors(320, 8192); // Initialize with default value of 8192
        QTableWidgetItem* item = ui->tableDevices->item(row, 10); // Assuming column 10 is for calibration factors
        if (item) {
            QStringList factorStrings = item->text().split(',', Qt::SkipEmptyParts);
            for (int i = 0; i < factorStrings.size() && i < 320; ++i) {
                bool ok;
                int factor = factorStrings[i].toInt(&ok);
                if (ok && factor >= 0 && factor <= 65535) {
                    factors[i] = factor;
                }
            }
        }
        calibrationFactors.append(factors);
    }
    return calibrationFactors;
}
