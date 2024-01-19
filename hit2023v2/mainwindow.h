#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSettings>
#include <QList>
#include <QVector>
#include <QTimer>
#include <QLineEdit>

#include "Q_DebugStream.h"
#include "device.h"
#include "hw.h"
#include "displayserver.h"
#include "keithley_thr.h"
#include "stepper.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    Q_DebugStream* debugStream;

    HW* theHW;
    DisplayServer* theDisplay;
    keithley_thr* theKeithley;
    Stepper* theStepper;
    QSettings* deviceSettings;
    int running = 0;
    int logging = 0;

    void run();
    void stop();
    void startLogging();
    void stopLogging();
    void startDisplay();
    void stopDisplay();
public slots:
    void showEvent(QShowEvent *event);
    void closeEvent(QCloseEvent *event);
    void on_timer();
    void on_newCurrentReadout(const double currentReadout);
protected:
    void log_separator();
    void setupHardware();
    void setupDeviceList();
    QTimer timer;
    QLineEdit status1;
    QLineEdit statusKeithley;

private slots:

    void on_pushLogSettings_pressed();
    void on_actionConnect_triggered();
    void on_actionDisconnect_triggered();
    void on_actionHost_IP_triggered();
    void on_actionTrigger_config_triggered();
    void on_actionDevices_triggered();
    void on_pushRun_pressed();
    void on_pushLogging_pressed();
    void on_pushDisplay_pressed();
    void on_actionConnect_Keithley_triggered();
    void on_actionDisconnect_Keithley_triggered();
    void on_actionLinearity_test_triggered();
    void on_actionIntegration_time_scan_triggered();
    void on_actionProfile_viewer_triggered();
    void on_actionConnect_Stepper_triggered();
    void on_actionDisconnect_Stepper_triggered();
    void on_actionBeta_Scanner_triggered();
    void on_pushButton_exit_clicked();

private:
    Ui::MainWindow *ui;

};

#endif // MAINWINDOW_H
