// udpclient.h

#ifndef UDPCLIENT_H
#define UDPCLIENT_H

#include <QObject>
#include <QUdpSocket>

class UdpClient : public QObject
{
    Q_OBJECT
public:
    explicit UdpClient(QObject *parent = nullptr);
    void startClient();

private:
    QUdpSocket udpSocket;

public slots:
    void receiveData();
    void processPendingDatagrams();

};

#endif // UDPCLIENT_H
