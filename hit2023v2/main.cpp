#include "mainwindow.h"
#include <QApplication>
#include "udpserver.h"        // Include udpserver header
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    // Create and start the UDP server
    UdpServer udpServer; // Assuming your UdpServer class is properly defined
    udpServer.startServer();

    // Apply the stylesheet to each display
    qDebug() << "App path : " << qApp->applicationDirPath();
    qApp->setStyleSheet("");
    QString stylesheetPath  =  qApp->applicationDirPath()+"/styles/Medize.qss";
    // Load and apply the new stylesheet
    QFile styleFile(stylesheetPath);
    if (styleFile.open(QFile::ReadOnly | QFile::Text)) {
        QString style = QTextStream(&styleFile).readAll();
        qApp->setStyleSheet(style);
        styleFile.close();
    } else {
        qWarning("Failed to open stylesheet file: %s", qPrintable(stylesheetPath));
    }


    MainWindow w;
    w.show();

    return a.exec();
}
