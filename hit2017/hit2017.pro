#-------------------------------------------------
#
# Project created by QtCreator 2017-08-21T15:59:19
#
#-------------------------------------------------

QT       += core gui network serialport
QMAKE_CXXFLAGS += -Wa,-mbig-obj

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

TARGET = hit2017
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    q_debugstream.cpp \
    dialoglogsettings.cpp \
    device.cpp \
    datareceiver.cpp \
    hw.cpp \
    dialoghostip.cpp \
    dialogtriggersettings.cpp \
    dialogdevices.cpp \
    helpers.cpp \
    eventbuilder.cpp \
    display.cpp \
    displayserver.cpp \
    keithley.cpp \
    keithley_thr.cpp \
    dialoglinearity.cpp \
    histogram.cpp \
    dialogtiscan.cpp \
    dialogprofiler.cpp \
    qcustomplot.cpp \
    stepper.cpp \
    dialogbeta.cpp

HEADERS  += mainwindow.h \
    Q_DebugStream.h \
    dialoglogsettings.h \
    device.h \
    dev_commands.h \
    datareceiver.h \
    hw.h \
    dialoghostip.h \
    dialogtriggersettings.h \
    dialogdevices.h \
    helpers.h \
    cbuffer.h \
    eventbuilder.h \
    display.h \
    displayserver.h \
    keithley.h \
    keithley_thr.h \
    dialoglinearity.h \
    histogram.h \
    dialogtiscan.h \
    dialogprofiler.h \
    qcustomplot.h \
    stepper.h \
    dialogbeta.h

FORMS    += mainwindow.ui \
    dialoglogsettings.ui \
    dialoghostip.ui \
    dialogtriggersettings.ui \
    dialogdevices.ui \
    display.ui \
    dialoglinearity.ui \
    dialogtiscan.ui \
    dialogprofiler.ui \
    dialogbeta.ui


