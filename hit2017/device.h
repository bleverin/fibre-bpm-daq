#ifndef DEVICE_H
#define DEVICE_H

#include <QObject>
#include <QTcpSocket>
#include <QUdpSocket>
#include <QVector>
#include <QThread>
#include <QMutex>

#include "datareceiver.h"

#define DEV_CTRL_READ_TIMEOUT   500
#define DEV_CTRL_ERROR          -1
#define DEV_CTRL_OK             0

#define DEV_BASE_DATA_PORT      4000

typedef struct
{
    unsigned char own_ip[4] = {10,0,7,1};
    unsigned char device_ip[4] = {10,0,7,2};
    int device_id = 0;
    int master = 1;
    int plane = 0;          //for ex. X may be 0 and Y may be 1
    int position = 0;       //physical position within plane
    int nr_sensors = 2;     //a device may be equipped with only one sensor
    int period = 60000;
    int tint = 5000;
    int master_delay = 22;  //trigger delay values to synchronize boards
    int slave_delay = 1;
    int gain;               //0 (low) or 1 (high); TO BE DONE
    int dma_bunch = 1;
    int eth_bunch = 1;
} DeviceConfig;


class Device : public QObject
{
    Q_OBJECT
public:
    explicit Device(QObject *parent = 0);
    ~Device();

    void connectDevice();
    void disconnectDevice();

    void configure(DeviceConfig &cfg);
    void startAcq();
    void stopAcq();
    void leds(int leds_enable, int debug_led);
    int getFrameRate();

    DeviceConfig deviceConfig;
    DataReceiver dataReceiver;

signals:


protected:
    int connected = 0;


    QTcpSocket controlSocket;
    //QThread receiverThread;

    int sendCtrl(unsigned short command, QVector<unsigned short> &data);
    int receiveCtrl(unsigned short &command, QVector<unsigned short> &data);
    int queryCtrl(unsigned short command, QVector<unsigned short> &txdata, QVector<unsigned short> &rxdata);

    int ctrlPing();
    int ctrlDebugLed(int state);
    int ctrlLeds(int en);
    int ctrlTrigger(int en);
    int ctrlMaster(int en);
    int ctrlSetPeriod(int period);
    int ctrlSetTint(int tint);
    int ctrlDaq(int en);
    int ctrlResetCounters();
    int ctrlFlushData();
    int ctrlConfigPeer(unsigned short *ip, unsigned short port);
    int ctrlSetGain(int val);
    int ctrlConfigBunch(int dma, int eth);
    int ctrlSetMasterDelay(int tint);
    int ctrlSetSlaveDelay(int tint);
protected slots:
    void onConnected();
    void onSocketError(QAbstractSocket::SocketError socketError);
    void onDisconnected();

};

#endif // DEVICE_H
