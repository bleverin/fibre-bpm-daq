// udpclient.cpp

#include "udpclient.h"
#include <iostream>

quint16 serverPort = 1901;    // Port number for the UDP server

UdpClient::UdpClient(QObject *parent) : QObject(parent)
{

    // Create a QHostAddress for the server's IP address
    QHostAddress serverAddress("127.0.0.1");

    // Bind the UDP socket to a specific port for receiving data (replace with your desired port)
    udpSocket.bind(QHostAddress::Any, serverPort); // Replace 12345 with your desired port

    // Connect the UDP socket's readyRead signal to the receiveData slot
    connect(&udpSocket, &QUdpSocket::readyRead, this, &UdpClient::receiveData);

    // Set the server's address and port for sending data
    udpSocket.connectToHost(serverAddress, serverPort); // Replace 12345 with the server's port

}

void UdpClient::startClient()
{
    // Start any client functionality here
    // This method can be used to initialize the client if needed.
        qDebug() << "UDP Client is listening for data...";
    messageCount = 0;
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
        QTime currentTime = QTime::currentTime();


        if(udpSocket.readDatagram(datagram.data(), datagram.size(), &sender, &senderPort)){
  //          std::cerr << "found data" << std::endl;

        }

        // Parse and display the received data
        QString receivedData = QString::fromUtf8(datagram);
//                    std::cout << "Received Data: " << receivedData.toStdString() << std::endl;
        QStringList dataList = receivedData.split(',');

        if (dataList.size() == 9) {

            double intensity = dataList[0].toDouble();
            double position = dataList[1].toDouble();
            double focus = dataList[2].toDouble();
            double rSquare = dataList[3].toDouble();
            int msecTime = dataList[4].toInt();

         //   qDebug() << "Received data - Intensity: " << intensity << "  Position:" << position << " Focus:" << focus << "  rsquare:" << rSquare << "  msec:" << msecTime ;
        }
        else{
            qDebug() << "Data of unexpected size" << dataList.size() ;
        }
        messageCount++;
        if (messageCount==1) {
            startTime = currentTime.msecsSinceStartOfDay();
        }

        // Check if 1000 messages have been received
        if (messageCount % 1000 == 0 && messageCount >1) {
            QTime currentTime = QTime::currentTime();
            elapsedTimeInmSeconds = currentTime.msecsSinceStartOfDay();
            elapsedTimeInmSeconds-= startTime;

            // Calculate the rate in messages per second
//            double messageRate = static_cast<double>(messageCount) / elapsedTimeInmSeconds;

//            qInfo() << "Messages received: " << messageCount;
            qInfo() << "Message rate (msec/1k): " << elapsedTimeInmSeconds;;//   << 1000/(elapsedTimeInmSeconds/1000) << "kHz" ;


            // Reset the counters
            messageCount = 0;
            startTime = currentTime.msecsSinceStartOfDay();
        }
    }
}
