#include "udpserver.h"

UdpServer::UdpServer(QObject *parent) : QObject(parent)
{

    // Configure the timer for data updates
   // connect(&timer, &QTimer::timeout, this, &UdpServer::sendData);
  //  timer.setInterval(1); // 1 milliseconds (1 kHz)
    startServer();
}

void UdpServer::startServer()
{
    // Bind the UDP socket to a specific port (replace with your desired port)
//    udpSocket.bind(QHostAddress::Any, 12345); // Replace 12345 with your desired port
    udpSocket.bind(QHostAddress("10.0.7.1"), 12345); // Use the desired host address and port
//    udpSocket.bind(QHostAddress::LocalHost, 12345); // Use "localhost" (127.0.0.1) and port 12345
    // Start the timer for data updates
  //  timer.start();
}

void UdpServer::stopServer()
{
    // Stop the timer and close the UDP socket
 //   timer.stop();
    udpSocket.close();
}


void UdpServer::sendData(QByteArray data)
{
    // Prepare the data to be sent
   // QString dataString = QString::number(intensity) + ',' + QString::number(position) + ',' + QString::number(focus);
   // QByteArray data = dataString.toUtf8();
    // Send the data to all connected clients (broadcast to all on the same network)
    udpSocket.writeDatagram(data, QHostAddress::Broadcast, 12345); // Replace 12345 with your desired port
}
