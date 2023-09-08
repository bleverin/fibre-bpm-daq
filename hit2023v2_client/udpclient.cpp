#include "udpclient.h"

UdpClient::UdpClient(QObject *parent) : QObject(parent)
{
    // Create a UDP socket
 //   udpSocket.bind(QHostAddress::Any, 12345); // Bind to any available port
    udpSocket.bind(QHostAddress("10.0.7.1"), 0); // Use the desired host address and let the OS choose an available port

    // Set up a signal-slot connection to handle incoming data
    connect(&udpSocket, &QUdpSocket::readyRead, this, &UdpClient::processPendingDatagrams);
}

void UdpClient::startClient()
{
    qDebug() << "UDP Client is listening for data...";

    // You can add additional client-specific logic here if needed.
}

void UdpClient::processPendingDatagrams()
{
    while (udpSocket.hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(udpSocket.pendingDatagramSize());
        QHostAddress sender;
        quint16 senderPort;

        udpSocket.readDatagram(datagram.data(), datagram.size(), &sender, &senderPort);

        // Parse and display the received data
        QString receivedData = QString::fromUtf8(datagram);
        QStringList dataList = receivedData.split(',');
        if (dataList.size() == 3) {
            double intensity = dataList[0].toDouble();
            double position = dataList[1].toDouble();
            double focus = dataList[2].toDouble();

            qDebug() << "Received data - Intensity:" << intensity << "Position:" << position << "Focus:" << focus;
        }
    }
}
