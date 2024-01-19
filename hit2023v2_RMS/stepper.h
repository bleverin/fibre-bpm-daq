#ifndef STEPPER_H
#define STEPPER_H

#include <QObject>
#include <QtSerialPort/QtSerialPort>
#include <QSerialPortInfo>
#include <QSerialPort>

#define STEPPER_OK              0
#define STEPPER_ERROR_NOREPLY   -1
#define STEPPER_ERROR_CHECKSUM  -2

#define STEPPER_MVP_ABSOLUTE    0
#define STEPPER_MVP_RELATIVE    1
#define STEPPER_SAP_TARGET_POSITION         0
#define STEPPER_SAP_ACTUAL_POSITION         1
#define STEPPER_SAP_TARGET_SPEED            2
#define STEPPER_SAP_ACTUAL_SPEED            3
#define STEPPER_SAP_MAXIMUM_SPEED           4
#define STEPPER_SAP_MAXIMUM_ACCELERATION    5
#define STEPPER_SAP_MAXIMUM_CURRENT         6
#define STEPPER_SAP_STANDBY_CURRENT         7
#define STEPPER_SAP_RIGHT_SWITCH_DISABLE    12
#define STEPPER_SAP_LEFT_SWITCH_DISABLE     13
#define STEPPER_SAP_MINIMUM_SPEED           130
#define STEPPER_SAP_RAMP_MODE               138
#define STEPPER_SAP_MICROSTEP_RESOLUTION    140 //0(full step) to 6 (/64 microstep)
//there are many others...

class Stepper : public QObject
{
    Q_OBJECT
public:
    explicit Stepper(QObject *parent = 0);
    ~Stepper();
    int command(int command, int type, unsigned int parameter, unsigned int *param_out = NULL);
    int connect(int address);
    void disconnect();
    int command_ROL(int speed);                         //rotate left
    int command_ROR(int speed);                         //rotate right
    int command_MST();                                  //motor stop
    int command_MVP(int ref_type, int position);        //move to position; ref_type: STEPPER_MVP_ABSOLUTE or STEPPER_MVP_RELATIVE
    int command_SAP(int parameter_number, int value);   //Set axis parameter. See defines.
    int command_GAP(int parameter_number, int *value);  //Get axis parameter. See defines for SAP.


    int moduleAddress;
    int isOpen;
    QString portName;
    QSerialPort serialPort;

signals:

public slots:

protected:
};

#endif // STEPPER_H
