#ifndef DATARECEIVER_H
#define DATARECEIVER_H

#include <QObject>
#include <QUdpSocket>
#include <QTimer>
#include <QThread>
#include <QSemaphore>

#include "cbuffer.h"

#define DATA_PACKET_HEADER_SIZE     6
#define DATA_SYNC_HEADER_SIZE       6
#define DATA_BYTES_PER_SAMPLE       2
#define DATA_SAMPLES_PER_SENSOR     64
#define DATA_SENSORS_PER_BOARD      2
#define DATA_MAX_BUNCH              16   //max. product of dmaBunch * ethBunch

#define DATA_BLOCK_SIZE             (DATA_SENSORS_PER_BOARD * DATA_SAMPLES_PER_SENSOR * DATA_BYTES_PER_SAMPLE)
#define DATA_MAX_PACKET_SIZE        ( DATA_MAX_BUNCH * (DATA_PACKET_HEADER_SIZE + DATA_SYNC_HEADER_SIZE + DATA_BLOCK_SIZE ) )

#define RECEIVER_BUFFER_SIZE        10000

#define RECEIVER_TIMER_PERIOD_MS    200 //The period of the timer to measure data rate. The measurement is always properly scaled.
#define RECEIVER_FRAMES_PER_SIG     100 //The DataReady signal is transmitted only every N frames, not to overload queued signals framework.

typedef struct
{
    //unsigned short channel_id;
    unsigned short local_ctr;
    unsigned short global_ctr;
    unsigned short sma_state;
        //these files are additional compared to STM side
    unsigned short dummy = 0xFFFF;  //for nice structure packing
    int device_nr;
    int data_ok;
} SyncFrame;

typedef struct
{
    SyncFrame sync_frame;
    unsigned short sensor_data[DATA_SENSORS_PER_BOARD * DATA_SAMPLES_PER_SENSOR];
} BufferData;

typedef CBuffer<BufferData> DataBuffer;

class DataReceiver : public QObject
{
    Q_OBJECT
public:
    explicit DataReceiver(QObject *parent = 0);
    ~DataReceiver();

    void configureEthSettings(QHostAddress address_to_set, quint16 port_to_set);
    void configureBunchSize(int dma, int eth);
    void outputEnable(int en);


    int frameRate = 0;
    int devNr = 0;

    DataBuffer dataBuffer;


signals:
    void sigInit();
    void sigDeinit();
    void sigConfigureEthSettings();
    void sigDataReady(DataReceiver* ptr);

public slots:

    void onTimer();
protected:
    void init();
    void deinit();
    QThread thread;
    QSemaphore initSemaphore;
    QTimer* timer = NULL;
    QUdpSocket* dataSocket = NULL;
    QHostAddress address;
    quint16 port;
    int outputEnabled = 0;
    int dmaBunch = 1;
    int ethBunch = 1;
    char tmpBuffer[DATA_MAX_PACKET_SIZE];
    int framesReceived = 0; //to calculate frame rate
    int framesFromLastSig = 0;

protected slots:
    void readData();
    void onInit();
    void onDeinit();
    void onConfigureEthSettings();
};

#endif // DATARECEIVER_H
