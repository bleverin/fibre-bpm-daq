#ifndef KEITHLEY_THR_H
#define KEITHLEY_THR_H

//THIS IS KEITHLEY 6487 (PICOAMMETER) RS-232 LIBRARY!

#include <QtCore>
#include <QObject>
#include <QThread>
#include <QTimer>
#include "keithley.h"


class keithleyWorker : public QObject
{
    Q_OBJECT

public:
    keithleyWorker();
    keithley theKeithley;
    QTimer timer;

    double lastCurrentReadout;
    int readoutDelay = 100;

public slots:
    void on(const int state);

    void setVoltage(const double voltage);
    void reset();
    void timerEvent();
    void runTimer(const int state);
    void connect();
    void disconnect();
signals:
    //void resultReady(const QString &result);
    void sig_currentReadout(const double value);
    void sig_isOpen(const int state, const QString portName);
};


class keithley_thr : public QObject
{
    Q_OBJECT
public:
    keithley_thr();
    ~keithley_thr();

    //keithley theKeithley;

    int isOpen;
    int connect();
    void disconnect();
    void ps_printf(const char *fmt...);
    int ps_read(char *dest, int maxSize);
    void setVoltage(double voltage);
    void on(int state);
    void reset();
    double getCurrent();
    void ps_flush();

    QThread udpThread;

    double lastCurrentReadout;
    QString portName;

    int recognizeSpillState(double current);
public slots:
    void on_currentReadout(const double value);
    int on_isOpen(const int state, const QString givenPortName);
signals:
    void sig_connect();
    void sig_disconnect(void);
    void sig_on(const int);
    void sig_setVoltage(const double);
    void sig_reset(void);
    void sig_runTimer(const int);
    void esig_newCurrentReadout(const double);

};

#endif // KEITHLEY_THR_H
