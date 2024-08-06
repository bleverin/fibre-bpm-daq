#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "dialoglogsettings.h"
#include "dialoghostip.h"
#include "dialogtriggersettings.h"
#include "dialogdevices.h"
#include "dialoglinearity.h"
#include "dialogtiscan.h"
#include "dialogprofiler.h"
#include "dialogbeta.h"
#include "helpers.h"

#include <QShowEvent>
#include <QMessageBox>
#include <QFileDialog>


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    debugStream = new Q_DebugStream(std::cout, ui->logWindow); //Redirect Console output to QTextEdit
    Q_DebugStream::registerQDebugMessageHandler(); //Redirect qDebug() output to QTextEdit

    deviceSettings = new QSettings("./device_config.ini", QSettings::IniFormat);
    theHW = new HW;
    theDisplay = new DisplayServer;
    theKeithley = new keithley_thr;
    theStepper = new Stepper;

//    connect(&timer, QTimer::timeout, this, on_timer);
    connect(&timer, &QTimer::timeout, this, &MainWindow::on_timer);

 //   connect(theKeithley, keithley_thr::esig_newCurrentReadout, this, MainWindow::on_newCurrentReadout);
    connect(theKeithley, &keithley_thr::esig_newCurrentReadout, this, &MainWindow::on_newCurrentReadout);



}

MainWindow::~MainWindow()
{
    delete ui;
    delete deviceSettings;
    delete theHW;
    delete theDisplay;
    delete theKeithley;

}

//***************** Initialization ******************

void MainWindow::showEvent(QShowEvent * event)
{
    if (!event->spontaneous())
    {
        status1.setReadOnly(true);
        statusBar()->addWidget(&status1,2);
        statusKeithley.setReadOnly(true);
        statusBar()->addWidget(&statusKeithley,1);
        statusKeithley.setText("Keithley disconnected");

        std::cout << "Hello, World!" << std::endl;
        std::cout << "Everyone likes log windows!" << std::endl;
        log_separator();

        timer.start(100);

        setupDeviceList();
        setupHardware();
    }
    QMainWindow::showEvent(event);
}

void MainWindow::closeEvent(QCloseEvent * event)
{
    stopDisplay();
    theKeithley->disconnect();
    QMainWindow::closeEvent(event);
}

//******************** Debug window *************************

//put horizontal line
void MainWindow::log_separator()
{
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
}


//******************** Helpers *************************

void MainWindow::setupHardware()
{
    qInfo("Setting up hardware...");

    DeviceConfig dc;
    unsigned char ip[4];

    top(deviceSettings);
    deviceSettings->beginGroup("Global");
    int nr_devices = deviceSettings->value("NrDevices").toInt();
    ip2num(deviceSettings->value("HostIp").toString(), ip);
    for (int i = 0; i < 4; i++)
        dc.own_ip[i] = ip[i];

    dc.eth_bunch = 1;   //must be left as is for v2
    dc.dma_bunch = 1;   //must be left as is for v2

    top(deviceSettings);
    deviceSettings->beginGroup("Trigger");

    int period_v1 = deviceSettings->value("Period").toInt();
    int tint_v1 = deviceSettings->value("Tint").toInt();
    int gain_v1 = deviceSettings->value("Gain").toInt();
    int period_v2 = deviceSettings->value("Period_v2").toInt();
    int tint_v2 = deviceSettings->value("Tint_v2").toInt();
    int gain_v2 = deviceSettings->value("Gain_v2").toInt();
    // Retrieve device-specific settings from DialogDevices
    DialogDevices dlg;
    dlg.deviceSettings = deviceSettings;
    QVector<QVector<int>> allCalibrationFactors = dlg.getAllCalibrationFactors();

    for (int dev_nr = 0; dev_nr < nr_devices; dev_nr++)
    {
        top(deviceSettings);
        QString group_label = QString("Device%1").arg(dev_nr);
        deviceSettings->beginGroup(group_label);
        dc.device_id = dev_nr;
        dc.hardware_ver = deviceSettings->value("HardwareVer").toInt();
        ip2num(deviceSettings->value("IP").toString(), ip);
        for (int i = 0; i < 4; i++)//4 bytes
            dc.device_ip[i] = ip[i];
        dc.master = deviceSettings->value("Master").toInt();
        dc.plane = deviceSettings->value("Plane").toInt();
        dc.position = deviceSettings->value("Position").toInt();
        dc.nr_sensors = deviceSettings->value("Sensors").toInt();
        dc.master_delay = deviceSettings->value("MasterDelay").toInt();
        dc.slave_delay = deviceSettings->value("SlaveDelay").toInt();
        dc.threshold = deviceSettings->value("Threshold").toInt();
        dc.clustersize = deviceSettings->value("ClusterSize").toInt();
/*
        // Get calibration factors for this device
        QVector<int> calibFactors = allCalibrationFactors[dev_nr];
        for (int i = 0; i < 320; i++) {
            if (i < calibFactors.size() && calibFactors[i] >= 0 && calibFactors[i] <= 65535) {
                dc.calibrationFactor[i] = calibFactors[i];
            } else {
                dc.calibrationFactor[i] = 8192; // Default value if not set or invalid
            }
        }
*/
        switch (dc.hardware_ver)
        {
            case 1:
                dc.period = period_v1;
                dc.tint = tint_v1;
                dc.gain = gain_v1;
                break;
            case 2:
                dc.period = period_v2;
                dc.tint = tint_v2;
                dc.gain = gain_v2;
                break;
            default:
                qCritical("Unsupported hardware version!");
            break;
        }

        theHW->configureDevice(dev_nr, dc); //configure the device and an entry in base address table in the event builder
    }


    dc.threshold = deviceSettings->value("Threshold").toInt();
    dc.clustersize = deviceSettings->value("ClusterSize").toInt();
/*
    // Assume calibration factors are stored as a list or comma-separated string
    QString calibFactorsStr = deviceSettings->value("CalibFactors").toString();
    QStringList calibFactorList = calibFactorsStr.split(',', Qt::SkipEmptyParts);

    // Clear any existing calibration data
    for (int i = 0; i < 320; i++) {
        dc.calibrationFactor[i] = 0; // Initialize to 0 or some default
    }

    // Load calibration factors
    int index = 0;
    for (const QString& factor : calibFactorList) {
        if (index >= 320) break; // Ensure we do not overflow the array
        bool ok;
        int value = factor.toInt(&ok);
        if (ok) {
            dc.calibrationFactor[index] = value;
            index++;
        } else {
            qWarning() << "Invalid calibration factor:" << factor;
        }
    }
*/

    //theDisplay.setup(&theHW);
}


void MainWindow::setupDeviceList()
{
    qInfo("Setting up device list...");
    ui->pushRun->setEnabled(false);

    theHW->removeDevices();

    top(deviceSettings);
    deviceSettings->beginGroup("Global");

    theHW->addDevices(deviceSettings->value("NrDevices", (int)1).toInt());
}

void MainWindow::run()
{
    if (running)
        stop();

    theHW->run();
    ui->pushRun->setText("Stop!");
    running = 1;
}

void MainWindow::stop()
{
    if (!running)
        return;

    theHW->stop();
    ui->pushRun->setText("Run!");
    running = 0;
}

void MainWindow::startLogging()
{
    if (logging)
        stopLogging();

    QString filename = QFileDialog::getSaveFileName(this, "Select file for saving data", "", tr("Binary log files (*.da2)"));

    if (filename.length())
    {
            //Make copy of current settings
        QString ini_filename = filename/*.left(filename.lastIndexOf(QString(".")))*/ + QString(".ini");
        QSettings* settings_copy = new QSettings(ini_filename,QSettings::IniFormat);
        copyQSettings (deviceSettings, settings_copy);
        settings_copy->sync();
        delete settings_copy;

            //Start logging
        theHW->eventBuilder.startLogging(filename);
        logging = 1;
        ui->pushLogging->setText("Stop logging!");
    }
}

void MainWindow::startAnalysing(){
    if (analysing)
        stopAnalysing();

    analysing = 1;

}

void MainWindow::stopAnalysing()
{
    analysing = 0;

}


void MainWindow::stopLogging()
{
    theHW->eventBuilder.stopLogging();
    logging = 0;
    ui->pushLogging->setText("Start logging!");
}

void MainWindow::startDisplay()
{
    ui->pushDisplay->setText("Hide display!");
    theDisplay->setup(theHW);
    theDisplay->show();
}

void MainWindow::stopDisplay()
{
    ui->pushDisplay->setText("Show display!");
    theDisplay->hide();
}



//******************** Slots *************************

void MainWindow::on_timer()
{
    status1.setText(theHW->report());
    if (theDisplay->isActive())
        theDisplay->plot();
}

void MainWindow::on_pushLogSettings_pressed()
{
    DialogLogSettings dlg;
    dlg.displayMask = debugStream->displayMask;
    dlg.detailsMask = debugStream->detailsMask;
    if (dlg.exec() == QDialog::Accepted)
    {
        debugStream->displayMask = dlg.displayMask;
        debugStream->detailsMask = dlg.detailsMask;
        std::cout << "(logger settings changed)" << std::endl;
    }
}

void MainWindow::on_actionConnect_triggered()
{
    stop();
    theHW->connectDevices();
    ui->pushRun->setEnabled(true);
}

void MainWindow::on_actionDisconnect_triggered()
{
    stop();
    theHW->disconnectDevices();
    ui->pushRun->setEnabled(false);
}

void MainWindow::on_actionHost_IP_triggered()
{
    DialogHostIp dlg;
    dlg.deviceSettings = deviceSettings;

    if (dlg.exec() == QDialog::Accepted)
    {
        stop();
        setupHardware();
    }
}

void MainWindow::on_actionTrigger_config_triggered()
{
    DialogTriggerSettings dlg;
    dlg.deviceSettings = deviceSettings;

    if (dlg.exec() == QDialog::Accepted)
    {
        stop();
        setupHardware();
    }
}

void MainWindow::on_actionDevices_triggered()
{
    DialogDevices dlg;
    dlg.deviceSettings = deviceSettings;

    if (dlg.exec() == QDialog::Accepted)
    {
        stop();
        if (theDisplay->isActive())
            stopDisplay();
        setupDeviceList();
        setupHardware();
    }
}

void MainWindow::on_pushRun_pressed()
{
    if (!running)
        run();
    else
        stop();
}

void MainWindow::on_pushLogging_pressed()
{
    if (!logging)
        startLogging();
    else
        stopLogging();
}

void MainWindow::on_pushAnalysing_pressed()
{
    if (!analysing)
        startAnalysing();
    else
        stopAnalysing();
}

void MainWindow::on_pushDisplay_pressed()
{
    if (theDisplay->isActive())
        stopDisplay();
    else
        startDisplay();
}

void MainWindow::on_actionLinearity_test_triggered()
{
    if (!theKeithley->isOpen)
    {
        qWarning("Keithley not connected! Aborting linearity test!");
        return;
    }
    if (!running)
    {
        qWarning("Run is stopped! Aborting linearity test!");
        return;
    }

    DialogLinearity dlg;
    dlg.theHW = theHW;
    dlg.theKeithley = theKeithley;
    dlg.exec();

}

void MainWindow::on_actionIntegration_time_scan_triggered()
{
    /*if (!theKeithley->isOpen)
    {
        qWarning("Keithley not connected! Aborting integration time scan!");
        return;
    }*/
    if (!ui->pushRun->isEnabled())
    {
        qWarning("Run cannot be started! Aborting integration time scan!");
        return;
    }

    int was_running = running;
    stop();

    DialogTiScan dlg;
    dlg.theHW = theHW;
    dlg.theKeithley = theKeithley;
    dlg.exec();

        //recover previous state
    setupHardware();
    if (was_running)
        run();
}




void MainWindow::on_actionProfile_viewer_triggered()
{
    if (!running)
    {
        qWarning("Run is stopped! Aborting profile viewer run!");
        return;
    }

    DialogProfiler dlg;
    dlg.theHW = theHW;
    dlg.theKeithley = theKeithley;
    dlg.exec();
}


void MainWindow::on_actionBeta_Scanner_triggered()
{
    if (!running)
    {
        qWarning("Run is stopped! Aborting beta scanner run!");
        return;
    }
    if (!theStepper->isOpen)
    {
        qWarning("Stepper controller not connected! Aborting beta scanner run!");
        return;
    }
    if (theHW->eventBuilder.isLogging())
    {
        qWarning("Data logging active! No raw data logging for the scan will be possible!");
    }

    DialogBeta dlg;
    dlg.theHW = theHW;
    dlg.theStepper = theStepper;
    dlg.deviceSettings = deviceSettings;
    dlg.exec();
}


//************** Keithley support *******************

//Qt5
/*void MainWindow::on_newCurrentReadout(const double currentReadout)
{
    QString text;
    text.sprintf("I=%1.8f nA", 1e+9*currentReadout);
    statusKeithley.setText(text);
}*/
//Qt6
void MainWindow::on_newCurrentReadout(const double currentReadout)
{
    QString text = QString("I=%1 nA").arg(1e+9 * currentReadout, 0, 'f', 8);
    statusKeithley.setText(text);
}



void MainWindow::on_actionConnect_Keithley_triggered()
{
    if (theKeithley->connect())
    {
        qInfo(qPrintable(QString("Keithley connected at port %1").arg(theKeithley->portName)));
    }
    else
    {
        qInfo("Keithley connection failed!");
    }
}

void MainWindow::on_actionDisconnect_Keithley_triggered()
{
    theKeithley->disconnect();
    qInfo("Keithley disconnected.");
    statusKeithley.setText("Keithley disconnected");
}


//***************** Stepper support *********************

void MainWindow::on_actionConnect_Stepper_triggered()
{
    theStepper->connect(1);
    if (theStepper->isOpen)
    {
        qInfo(qPrintable(QString("Stepper controller connected at port %1").arg(theStepper->portName)));
    }
    else
    {
        qInfo("Stepper connection failed!");
    }
}

void MainWindow::on_actionDisconnect_Stepper_triggered()
{
    theStepper->disconnect();
    qInfo("Stepper controller disconnected.");
}


void MainWindow::on_pushButton_exit_clicked()
{
    if(running) stop();
    theHW->stop();

    theHW->disconnectDevices();

    QApplication::exit(); //close the application;
}

