#ifndef UDPSERVER_H
#define UDPSERVER_H

#include <QObject>
#include <QUdpSocket>
#include <QTimer> // Add this line to include QTimer



class UdpServer : public QObject
{
    Q_OBJECT

public:
    explicit UdpServer(QObject *parent = nullptr);

public slots:
    void startServer();
    void stopServer();
    void sendData(QByteArray data); // New slot to send data with custom values

private:
    QUdpSocket udpSocket;
    QTimer timer;

};

// Declare the global UdpServer object as an external variable
extern UdpServer udpServer;

#endif // UDPSERVER_H
