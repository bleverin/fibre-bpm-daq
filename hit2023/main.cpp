#include "mainwindow.h"
#include <QApplication>
#include <QFile>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    // Create and show your main window(s) or other windows here

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

    qDebug() << "Stylesheet applied:" << qApp->styleSheet(); // Add this line

    MainWindow w;
    w.show();

    return a.exec();
}
