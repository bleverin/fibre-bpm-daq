// udpclient.h

#ifndef UDPCLIENT_H
#define UDPCLIENT_H

#include <QObject>
#include <QUdpSocket>
#include <QTime>

class UdpClient : public QObject
{
    Q_OBJECT
public:
    explicit UdpClient(QObject *parent = nullptr);
    void startClient();

private:
    QUdpSocket udpSocket;
    int messageCount = 0;
    int startTime=0;
    int elapsedTimeInmSeconds=0;
public slots:
    void receiveData();
    void processPendingDatagrams();

};

#endif // UDPCLIENT_H
