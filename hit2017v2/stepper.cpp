#include "stepper.h"

Stepper::Stepper(QObject *parent) : QObject(parent)
{
    isOpen = 0;
}

Stepper::~Stepper()
{
    disconnect();
}

//******** Basic IO *******

int Stepper::command(int command, int type, unsigned int parameter, unsigned int* param_out)
{
        //1. Prepare data
    unsigned char buffer[9];
    buffer[0] = (unsigned char)moduleAddress;
    buffer[1] = (unsigned char)command;
    buffer[2] = (unsigned char)type;
    buffer[3] = 0;  //Motor/bank number
    for (int i = 0; i < 4; i++)
        buffer[4+i] = (unsigned char)(parameter >> (8*(3-i)));
    buffer[8] = 0;  //checksum
    for (int i = 0; i < 8; i++)
        buffer[8] += buffer[i]; //calculate checksum

        //2. Send data
    serialPort.write((const char*)buffer, 9);
    serialPort.waitForBytesWritten(500);

        //3. Read data
    int ptr = 0;
    while (1)
    {
        if (serialPort.read((char*)buffer+ptr,1) <= 0)
        {
            if (!serialPort.waitForReadyRead(500))
                break;                                  //no new data - break
        }
        else
        {
            ptr++;
            if (ptr >= 9)
                break;                                  //buffer full = break
        }
    }

        //4. Parse data
    if (ptr < 9)
        return STEPPER_ERROR_NOREPLY;  //no new data
    if (buffer[2] != 100)
        return STEPPER_ERROR_CHECKSUM;

    if (param_out != NULL)
    {
        *param_out = ( (unsigned int)buffer[4]<<24 ) |
                     ( (unsigned int)buffer[5]<<16 ) |
                     ( (unsigned int)buffer[6]<<8 ) |
                     ( (unsigned int)buffer[7]);
    }
    return STEPPER_OK;

}

//******** Commands *********

int Stepper::command_ROL(int speed)
{
    return command(2,0,speed);
}

int Stepper::command_ROR(int speed)
{
    return command(1,0,speed);
}

int Stepper::command_MST()
{
    return command(3,0,0);
}

int Stepper::command_MVP(int ref_type, int position)
{
    return command(4, ref_type, position);
}

int Stepper::command_SAP(int parameter_number, int value)
{
    return command(5, parameter_number, value);
}

int Stepper::command_GAP(int parameter_number, int* value)
{
    return command(6, parameter_number, 0, (unsigned int*)value);
}

//******** Connecting ***********

int Stepper::connect(int address)
{
    disconnect();   //just if we were connected

    moduleAddress = address;

    QList<QSerialPortInfo> list = QSerialPortInfo::availablePorts();

    if (list.size() == 0)
        return -1;      //no serial ports found

    for (int port = 0; port < list.size(); port++)
    {
        serialPort.setPort(list[port]);
        serialPort.setBaudRate(9600);
        if (serialPort.open(QIODevice::ReadWrite))
        {
            serialPort.setBaudRate(9600);

            if (command_MST() == STEPPER_OK)
            {                                       //gotta our PS!
                isOpen = 1;
                portName = list[port].portName();
                    //maybe configure something
                command_SAP(STEPPER_SAP_MAXIMUM_SPEED,1000);

                break;
            }
            serialPort.close();
        }
    }
    return isOpen;
}

void Stepper::disconnect()
{
    if (!isOpen)
        return;

    serialPort.close();
    isOpen = 0;
}
