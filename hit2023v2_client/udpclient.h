#ifndef UDPCLIENT_H
#define UDPCLIENT_H

#include <QObject>
#include <QUdpSocket>
#include <signal.h> // Include the signal header for signal handling

class UdpClient : public QObject
{
    Q_OBJECT

public:
    explicit UdpClient(QObject *parent = nullptr);

public slots:
    void startClient();
    void stopClient(); // New slot to stop the client gracefully

private:
    QUdpSocket udpSocket;

private slots:
    void processPendingDatagrams();
};

#endif // UDPCLIENT_H

