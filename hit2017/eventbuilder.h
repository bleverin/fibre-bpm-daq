#ifndef EVENTBUILDER_H
#define EVENTBUILDER_H

#include <QObject>
#include <QVector>
#include <QList>
#include <QFile>
#include <QThread>
#include <QMutex>
#include <QMutexLocker>

//#include "hw.h"
#include "datareceiver.h"
#include "histogram.h"

    //The event builder will constantly keep some data in the buffers to enable synchronization of the devices. So:
#define EVB_MIN_BUFFER_OCCUPANCY    (RECEIVER_BUFFER_SIZE / 8)      //the EVB will wait until so much data is in each device buffer
#define EVB_MAX_BUFFER_OCCUPANCY    (RECEIVER_BUFFER_SIZE / 2)      //or so much in at least one



class EventBuilder : public QObject
{
    Q_OBJECT
public:
    explicit EventBuilder(QObject *parent = 0);
    ~EventBuilder();

    void addSource(DataReceiver *source);
    void deleteSources();
    void startLogging(QString filename);
    void stopLogging();
    int isLogging();
    void startTakingHistos(int sample_count);
    void stopTakingHistos();
    QVector<Histogram> &getHistos();
    QVector<BufferData> getLastFrame();
    QVector<BufferData> getNewFrame();  //as getLastFrame(), but ensures that the frame is new, i.e. no frame will be read twice
signals:
    void sigInit();
    void sigDeinit();
    void sigStartLogging();
    void sigStopLogging();
    void sigStartTakingHistos(int);
    void sigStopTakingHistos();

    void sigHistoCompleted();   //this is a public signal which can be used to notify user that the histo is ready

public slots:
    void onNewData(DataReceiver *receiver);
protected:
    int checkBufferOccupancies();
    int findLowestId();
    void logDataToFile();
    void init();    //run after moving to thread
    void deinit();

    QThread thread;
    QSemaphore initSemaphore;
    QVector<DataReceiver*> receivers;
    QVector<BufferData> currentFrame;
    QVector<BufferData> lastFrame;
    QVector<Histogram> histograms;
    int histogramSamplesToTake = 0;
    QMutex lastFrameMutex;
    QSemaphore newDataSemaphore;
    int nrReceivers;
    QString logFileName;
    QFile logFile;
    int loggingData = 0;
protected slots:
    void onInit();
    void onDeinit();
    void onStartLogging();
    void onStopLogging();
    void onStartTakingHistos(int sample_count);
    void onStopTakingHistos();
};

#endif // EVENTBUILDER_H
