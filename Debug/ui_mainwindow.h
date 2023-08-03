/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionConnect;
    QAction *actionDisconnect;
    QAction *actionHost_IP;
    QAction *actionDevices;
    QAction *actionTrigger_config;
    QAction *actionRun;
    QAction *actionConnect_Keithley;
    QAction *actionDisconnect_Keithley;
    QAction *actionLinearity_test;
    QAction *actionIntegration_time_scan;
    QAction *actionProfile_viewer;
    QAction *actionConnect_Stepper;
    QAction *actionDisconnect_Stepper;
    QAction *actionBeta_Scanner;
    QWidget *centralWidget;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QTextBrowser *logWindow;
    QHBoxLayout *horizontalLayout;
    QPushButton *pushRun;
    QPushButton *pushLogging;
    QPushButton *pushDisplay;
    QSpacerItem *horizontalSpacer;
    QPushButton *pushLogSettings;
    QMenuBar *menuBar;
    QMenu *menuDevice;
    QMenu *menuSettings;
    QMenu *menuAuto;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(853, 601);
        actionConnect = new QAction(MainWindow);
        actionConnect->setObjectName(QStringLiteral("actionConnect"));
        actionDisconnect = new QAction(MainWindow);
        actionDisconnect->setObjectName(QStringLiteral("actionDisconnect"));
        actionHost_IP = new QAction(MainWindow);
        actionHost_IP->setObjectName(QStringLiteral("actionHost_IP"));
        actionDevices = new QAction(MainWindow);
        actionDevices->setObjectName(QStringLiteral("actionDevices"));
        actionTrigger_config = new QAction(MainWindow);
        actionTrigger_config->setObjectName(QStringLiteral("actionTrigger_config"));
        actionRun = new QAction(MainWindow);
        actionRun->setObjectName(QStringLiteral("actionRun"));
        actionConnect_Keithley = new QAction(MainWindow);
        actionConnect_Keithley->setObjectName(QStringLiteral("actionConnect_Keithley"));
        actionDisconnect_Keithley = new QAction(MainWindow);
        actionDisconnect_Keithley->setObjectName(QStringLiteral("actionDisconnect_Keithley"));
        actionLinearity_test = new QAction(MainWindow);
        actionLinearity_test->setObjectName(QStringLiteral("actionLinearity_test"));
        actionIntegration_time_scan = new QAction(MainWindow);
        actionIntegration_time_scan->setObjectName(QStringLiteral("actionIntegration_time_scan"));
        actionProfile_viewer = new QAction(MainWindow);
        actionProfile_viewer->setObjectName(QStringLiteral("actionProfile_viewer"));
        actionConnect_Stepper = new QAction(MainWindow);
        actionConnect_Stepper->setObjectName(QStringLiteral("actionConnect_Stepper"));
        actionDisconnect_Stepper = new QAction(MainWindow);
        actionDisconnect_Stepper->setObjectName(QStringLiteral("actionDisconnect_Stepper"));
        actionBeta_Scanner = new QAction(MainWindow);
        actionBeta_Scanner->setObjectName(QStringLiteral("actionBeta_Scanner"));
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        verticalLayoutWidget = new QWidget(centralWidget);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(10, 10, 831, 421));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        logWindow = new QTextBrowser(verticalLayoutWidget);
        logWindow->setObjectName(QStringLiteral("logWindow"));

        verticalLayout->addWidget(logWindow);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        pushRun = new QPushButton(verticalLayoutWidget);
        pushRun->setObjectName(QStringLiteral("pushRun"));
        pushRun->setEnabled(false);

        horizontalLayout->addWidget(pushRun);

        pushLogging = new QPushButton(verticalLayoutWidget);
        pushLogging->setObjectName(QStringLiteral("pushLogging"));
        pushLogging->setEnabled(true);

        horizontalLayout->addWidget(pushLogging);

        pushDisplay = new QPushButton(verticalLayoutWidget);
        pushDisplay->setObjectName(QStringLiteral("pushDisplay"));

        horizontalLayout->addWidget(pushDisplay);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        pushLogSettings = new QPushButton(verticalLayoutWidget);
        pushLogSettings->setObjectName(QStringLiteral("pushLogSettings"));

        horizontalLayout->addWidget(pushLogSettings);


        verticalLayout->addLayout(horizontalLayout);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 853, 21));
        menuDevice = new QMenu(menuBar);
        menuDevice->setObjectName(QStringLiteral("menuDevice"));
        menuSettings = new QMenu(menuBar);
        menuSettings->setObjectName(QStringLiteral("menuSettings"));
        menuAuto = new QMenu(menuBar);
        menuAuto->setObjectName(QStringLiteral("menuAuto"));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        menuBar->addAction(menuDevice->menuAction());
        menuBar->addAction(menuSettings->menuAction());
        menuBar->addAction(menuAuto->menuAction());
        menuDevice->addAction(actionConnect);
        menuDevice->addAction(actionDisconnect);
        menuDevice->addSeparator();
        menuDevice->addAction(actionConnect_Keithley);
        menuDevice->addAction(actionDisconnect_Keithley);
        menuDevice->addSeparator();
        menuDevice->addAction(actionConnect_Stepper);
        menuDevice->addAction(actionDisconnect_Stepper);
        menuSettings->addAction(actionHost_IP);
        menuSettings->addAction(actionDevices);
        menuSettings->addAction(actionTrigger_config);
        menuAuto->addAction(actionLinearity_test);
        menuAuto->addAction(actionIntegration_time_scan);
        menuAuto->addAction(actionProfile_viewer);
        menuAuto->addAction(actionBeta_Scanner);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "HIT DAQ", 0));
        actionConnect->setText(QApplication::translate("MainWindow", "Connect", 0));
        actionDisconnect->setText(QApplication::translate("MainWindow", "Disconnect", 0));
        actionHost_IP->setText(QApplication::translate("MainWindow", "Host IP...", 0));
        actionDevices->setText(QApplication::translate("MainWindow", "Devices...", 0));
        actionTrigger_config->setText(QApplication::translate("MainWindow", "Trigger config...", 0));
        actionRun->setText(QApplication::translate("MainWindow", "Run", 0));
        actionConnect_Keithley->setText(QApplication::translate("MainWindow", "Connect Keithley", 0));
        actionDisconnect_Keithley->setText(QApplication::translate("MainWindow", "Disconnect Keithley", 0));
        actionLinearity_test->setText(QApplication::translate("MainWindow", "Linearity test", 0));
        actionIntegration_time_scan->setText(QApplication::translate("MainWindow", "Integration time scan", 0));
        actionProfile_viewer->setText(QApplication::translate("MainWindow", "Profile viewer", 0));
        actionConnect_Stepper->setText(QApplication::translate("MainWindow", "Connect Stepper", 0));
        actionDisconnect_Stepper->setText(QApplication::translate("MainWindow", "Disconnect Stepper", 0));
        actionBeta_Scanner->setText(QApplication::translate("MainWindow", "Beta Scanner", 0));
        pushRun->setText(QApplication::translate("MainWindow", "Run!", 0));
        pushLogging->setText(QApplication::translate("MainWindow", "Start logging!", 0));
        pushDisplay->setText(QApplication::translate("MainWindow", "Show display!", 0));
        pushLogSettings->setText(QApplication::translate("MainWindow", "Log settings...", 0));
        menuDevice->setTitle(QApplication::translate("MainWindow", "Device", 0));
        menuSettings->setTitle(QApplication::translate("MainWindow", "Settings", 0));
        menuAuto->setTitle(QApplication::translate("MainWindow", "Auto", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
