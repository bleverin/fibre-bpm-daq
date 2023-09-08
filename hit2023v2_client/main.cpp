#include <QCoreApplication>
#include <signal.h> // Include the signal header for signal handling
#include "udpclient.h"

// Declare a pointer to the UDP client to ensure it's not destroyed prematurely
UdpClient* udpClient = nullptr;

// Signal handler for Ctrl+C (SIGINT)
void handleSignal(int signal)
{
    Q_UNUSED(signal);

    // Stop the UDP client gracefully
    if (udpClient)
        udpClient->stopClient();

    // Exit the application
    QCoreApplication::exit(0);
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Create an instance of the UdpClient class
    udpClient = new UdpClient;

    // Connect the startClient slot to start the client
    QObject::connect(udpClient, &UdpClient::startClient, &a, &QCoreApplication::quit);

    // Start the UDP client
    udpClient->startClient();

    // Set up a signal handler for Ctrl+C (SIGINT)
    signal(SIGINT, handleSignal);

    return a.exec();
}
