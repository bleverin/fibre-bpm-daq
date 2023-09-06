#include "keithley.h"

//THIS IS KEITHLEY 6487 (PICOAMMETER) RS-232 LIBRARY!

keithley::keithley()
{
    isOpen = 0;
}

/*void keithley::ps_printf(const char* fmt, ...)
{
    QString result;
    va_list args;
    va_start(args, fmt);
    result.vsprintf(fmt, args);
    va_end(args);

    //char toWrite[result.length()+1];
    //strcpy(toWrite, qPrintable(result));
    //serialPort.write(toWrite, strlen(toWrite));
    socket.write(qPrintable(result), result.length());
    socket.waitForBytesWritten(500);
}

    //read a CR-LF terminated string from PS
int keithley::ps_read(char* dest, int maxSize)
{
    int ptr = 0;
    while (1)
    {
        if (socket.read(dest+ptr,1) <= 0)
        {
            if (!socket.waitForReadyRead(10))
                break;                              //no new data - break
        }
        else
            ptr++;
        if (dest[ptr-1] == '\n')
        {
            ptr--;
            break;                                  //newline found - delete and break
        }
        if (dest[ptr-1] == '\r')
            ptr--;                                  //CR found - delete it
        if (ptr >= (maxSize-1))
            break;                                  //buffer full = break

    }

    dest[ptr] = 0;
        //return number of read characters
    return ptr;
}*/
//Qt5
/*
void keithley::ps_printf(const char* fmt, ...)
{
    QString result;
    va_list args;
    va_start(args, fmt);
    result.vsprintf(fmt, args);
    va_end(args);

    //char toWrite[result.length()+1];
    //strcpy(toWrite, qPrintable(result));
    //serialPort.write(toWrite, strlen(toWrite));
    serialPort.write(qPrintable(result), result.length());
    serialPort.waitForBytesWritten(500);
}
*/
//Qt6
void keithley::ps_printf(const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    QString result = QString::vasprintf(fmt, args);
    va_end(args);

    serialPort.write(result.toUtf8());
    serialPort.waitForBytesWritten(500);
}

    //read a CR-LF terminated string from PS
int keithley::ps_read(char* dest, int maxSize)
{
    int ptr = 0;
    while (1)
    {
        if (serialPort.read(dest+ptr,1) <= 0)
        {
            if (!serialPort.waitForReadyRead(500))
                break;                                  //no new data - break
        }
        else
        {
            ptr++;
            if (dest[ptr-1] == '\n')
            {
                ptr--;
                break;                                  //newline found - delete and break
            }
            if (dest[ptr-1] == '\r')
            {
                ptr--;                                  //CR found - delete and break
                break;
            }
            if (ptr >= (maxSize-1))
                break;                                  //buffer full = break
        }
    }

    dest[ptr] = 0;
    return ptr;
}

void keithley::ps_flush()
{
    char buffer[32];
    while (ps_read(buffer, 32));
}

//**************************************************************************

int keithley::connect()
{
    /*disconnect();   //just if we were connected

    socket.connectToHost(hostName, port);
    if (socket.waitForConnected(5000))
    {
        isOpen = 1;
        return 1;
    }
    return 0;*/
    QList<QSerialPortInfo> list = QSerialPortInfo::availablePorts();

    disconnect();    //close port if it's open

    if (list.size() == 0)
        return -1;      //no serial ports found

    for (int port = 0; port < list.size(); port++)
    {
        serialPort.setPort(list[port]);
        serialPort.setBaudRate(57600);
        if (serialPort.open(QIODevice::ReadWrite))
        {
            serialPort.setBaudRate(57600);
            ps_printf("*IDN?\n");
            QThread::msleep(100);
            char buffer[128];
            ps_read(buffer,128);

            if (strstr(buffer, "KEITHLEY INSTRUMENTS INC.,MODEL 6487"))
            {                                       //gotta our PS!
                isOpen = 1;
                portName = list[port].portName();
                    //configure for measurement
                QThread::msleep(100);
                ps_printf("CONF\n");
                    //setup medium readout reate (Tint = 20 ms)
                QThread::msleep(100);
                ps_printf("NPLC 1\n");
                QThread::msleep(100);
                ps_printf("RANG:AUTO 0\n");
                QThread::msleep(100);
                ps_printf("RANG 2e-5\n");
                QThread::msleep(100);
                    //setup source
                ps_printf("SOUR:VOLT:RANG 10\n");
                QThread::msleep(100);
                ps_printf("SOUR:VOLT:ILIM 2.5e-2\n");
                QThread::msleep(100);

                break;
            }
            serialPort.close();
        }
    }
    return isOpen;
}

void keithley::disconnect()
{
    if (!isOpen)
        return;

    //socket.close();
    serialPort.close();
    isOpen = 0;
}

void keithley::setVoltage(double voltage)
{
    if (!isOpen)
        return;

    //ps_printf("smua.source.func=smua.OUTPUT_DCVOLTS\n");
    //ps_printf("smua.source.levelv=%1.2f\n", voltage);
    ps_printf("SOUR:VOLT %1.2f\n", voltage);
}

void keithley::on(int state)
{
    if (!isOpen)
        return;

    if (state)
    {
        //ps_printf("smua.source.output=smua.OUTPUT_ON\n");
        ps_printf("SOUR:VOLT:STAT ON\n");
    }
    else
    {
        //ps_printf("smua.source.output=smua.OUTPUT_OFF\n");
        ps_printf("SOUR:VOLT:STAT OFF\n");
    }
}

void keithley::reset()
{
    if (!isOpen)
        return;

     //ps_printf("smua.reset()\n");
    ps_printf("*RST\n");
}

double keithley::getCurrent()
{
    char reply[128];
    ps_flush();
    //ps_printf("print(smua.measure.i())\n");
    //ps_printf("MEAS?\n");
    ps_printf("READ?\n");
    //QThread::msleep(250);
    while (!ps_read(reply, 128));
    double result = atof(reply);
    return result;
}

