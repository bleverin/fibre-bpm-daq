#include "keithley_thr.h"

//THIS IS KEITHLEY 6487 (PICOAMMETER) RS-232 LIBRARY!

//************************** worker class ******************

keithleyWorker::keithleyWorker()
{
    QObject::connect(&timer, &QTimer::timeout, this, &keithleyWorker::timerEvent);
    timer.setSingleShot(true);
}

void keithleyWorker::connect()
{
    int isOpen = theKeithley.connect();
    emit sig_isOpen(isOpen, theKeithley.portName);
}

void keithleyWorker::disconnect()
{
    theKeithley.disconnect();
}

void keithleyWorker::runTimer(const int state)
{
    if (state)
        timer.start(readoutDelay);
    else
        timer.stop();
}

void keithleyWorker::timerEvent()
{
        //do the readout
    lastCurrentReadout = theKeithley.getCurrent();
    emit sig_currentReadout(lastCurrentReadout);
        //run the timer again
    timer.start(readoutDelay);
}

void keithleyWorker::on(const int state)
{
    theKeithley.on(state);
}

void keithleyWorker::setVoltage(const double voltage)
{
    theKeithley.setVoltage(voltage);
}

void keithleyWorker::reset()
{
    theKeithley.reset();
}

//************************** constructor and destructor ******************


keithley_thr::keithley_thr()
{
    lastCurrentReadout = -1;
    isOpen = 0;


   keithleyWorker *worker = new keithleyWorker;
   //worker->theKeithley = &theKeithley;
   worker->moveToThread(&udpThread);
   worker->timer.moveToThread(&udpThread);
   worker->theKeithley.serialPort.moveToThread(&udpThread);
        //controller -> worker
   QObject::connect(&udpThread, &QThread::finished, worker, &QObject::deleteLater);
   QObject::connect(this, &keithley_thr::sig_connect, worker, &keithleyWorker::connect);
   QObject::connect(this, &keithley_thr::sig_disconnect, worker, &keithleyWorker::disconnect);
   QObject::connect(this, &keithley_thr::sig_on, worker, &keithleyWorker::on);
   QObject::connect(this, &keithley_thr::sig_setVoltage, worker, &keithleyWorker::setVoltage);
   QObject::connect(this, &keithley_thr::sig_reset, worker, &keithleyWorker::reset);
   QObject::connect(this, &keithley_thr::sig_runTimer, worker, &keithleyWorker::runTimer);
        //worker -> controller
   QObject::connect(worker, &keithleyWorker::sig_currentReadout, this, &keithley_thr::on_currentReadout);
   QObject::connect(worker, &keithleyWorker::sig_isOpen, this, &keithley_thr::on_isOpen);
   udpThread.start();
}

keithley_thr::~keithley_thr()
{
    udpThread.quit();
    udpThread.wait();
}



//************************** slots for communication with worker thread ******************

    //called on each current readout
void keithley_thr::on_currentReadout(const double value)
{
    lastCurrentReadout = value;
    emit esig_newCurrentReadout(lastCurrentReadout);
}

    //called after opening the socket
int keithley_thr::on_isOpen(const int state, const QString givenPortName)
{
    isOpen = state;
    portName = givenPortName;
}

//************************** class keithley mirror ******************

int keithley_thr::connect()
{
    isOpen = -1;
    emit sig_connect();

        //wait until the socket opens or fails
    while (isOpen == -1)
        qApp->processEvents();

        //run readout if opened succesfully
    emit sig_runTimer(isOpen);
    return isOpen;
}

void keithley_thr::disconnect()
{
    emit sig_runTimer(0);
    emit sig_disconnect();
}

void keithley_thr::setVoltage(double voltage)
{
    emit sig_setVoltage(voltage);
}

void keithley_thr::on(int state)
{
    emit sig_on(state);
}

void keithley_thr::reset()
{
    emit sig_reset();
}

double keithley_thr::getCurrent()
{
    return lastCurrentReadout;
}


