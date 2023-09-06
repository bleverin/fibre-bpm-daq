#ifndef KEITHLEY_H
#define KEITHLEY_H

//THIS IS KEITHLEY 6487 (PICOAMMETER) RS-232 LIBRARY!

#include <QtSerialPort/QtSerialPort>
#include <QSerialPortInfo>
#include <QSerialPort>


class keithley
{
public:
    keithley();
    //QTcpSocket socket;
    int isOpen;
    QString portName;
    QSerialPort serialPort;
    int connect();
    void disconnect();
    void ps_printf(const char *fmt...);
    int ps_read(char* dest, int maxSize);
    void setVoltage(double voltage);
    void on(int state);
    void reset();
    double getCurrent();
    void ps_flush();
};

#endif // KEITHLEY_H
