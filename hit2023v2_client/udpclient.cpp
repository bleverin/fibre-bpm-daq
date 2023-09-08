// udpclient.cpp

#include "udpclient.h"

UdpClient::UdpClient(QObject *parent) : QObject(parent)
{
    // Create a QHostAddress for the server's IP address
    QHostAddress serverAddress("10.0.7.1");

    // Bind the UDP socket to a specific port for receiving data (replace with your desired port)
    udpSocket.bind(QHostAddress::Any, 12345); // Replace 12345 with your desired port

    // Connect the UDP socket's readyRead signal to the receiveData slot
    connect(&udpSocket, &QUdpSocket::readyRead, this, &UdpClient::receiveData);

    // Set the server's address and port for sending data
    udpSocket.connectToHost(serverAddress, 12345); // Replace 12345 with the server's port
}

void UdpClient::startClient()
{
    // Start any client functionality here
    // This method can be used to initialize the client if needed.
        qDebug() << "UDP Client is listening for data...";
}

void UdpClient::receiveData()
{
    // Process pending datagrams
    processPendingDatagrams();
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
