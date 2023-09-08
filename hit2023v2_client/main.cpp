// main.cpp

#include <QCoreApplication>
#include "udpclient.h"
#include <signal.h> // Include the signal header for handling signals

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Create and use the UDP client
    UdpClient udpClient;
    udpClient.startClient();




    // Set up a signal handler for SIGINT (CTRL+C)
    signal(SIGINT, [](int) { QCoreApplication::quit(); });

    return a.exec();
}
