#-------------------------------------------------
#
# Project created by QtCreator 2017-08-21T15:59:19
#
#-------------------------------------------------

QT       += core gui network serialport
QMAKE_CXXFLAGS += -Wa,-mbig-obj


greaterThan(QT_MAJOR_VERSION, 5): QT += widgets printsupport

TARGET = hit2023v2
TEMPLATE = app


SOURCES += main.cpp\
    hit_analyse_v2.cpp \
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
    qcustomplot.cpp \
    display.cpp \
    displayserver.cpp \
    keithley.cpp \
    keithley_thr.cpp \
    dialoglinearity.cpp \
    histogram.cpp \
    dialogtiscan.cpp \
    dialogprofiler.cpp \
    stepper.cpp \
    dialogbeta.cpp

HEADERS  += mainwindow.h \
    Q_DebugStream.h \
    dialoglogsettings.h \
    device.h \
    dev_commands.h \
    datareceiver.h \
    hit_analyse_v2.h \
    hw.h \
    dialoghostip.h \
    dialogtriggersettings.h \
    dialogdevices.h \
    helpers.h \
    cbuffer.h \
    eventbuilder.h \
    networkthread.h \
    qcustomplot.h \
    display.h \
    displayserver.h \
    keithley.h \
    keithley_thr.h \
    dialoglinearity.h \
    histogram.h \
    dialogtiscan.h \
    dialogprofiler.h \
    stepper.h \
    dialogbeta.h \
    hitreader.h

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


