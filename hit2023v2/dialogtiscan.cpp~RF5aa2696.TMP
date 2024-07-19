#include "dialogtiscan.h"
#include "ui_dialogtiscan.h"

#define RUNNING 1
#define STOPPED 0
#define STOP_ISSUED -1

DialogTiScan::DialogTiScan(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogTiScan)
{
    ui->setupUi(this);
    runState = STOPPED;
}

DialogTiScan::~DialogTiScan()
{
    delete ui;
}

void DialogTiScan::showEvent(QShowEvent * event)
{
    if (!event->spontaneous())
    {
        if (!theKeithley->isOpen)
            ui->checkUseLED->setEnabled(false);
    }
    QDialog::showEvent(event);
}

//************** Processing ***************

void DialogTiScan::run()
{
    runState = RUNNING;
    qInfo("Starting integration time scan...");

        //Prepare measurement
    ui->plotResultsMean->clearGraphs();
    ui->plotResultsStd->clearGraphs();
    results.clear();
    int nr_devices = theHW->devices.length();

    int use_led = ui->checkUseLED->isChecked();
    double ledv = ui->doubleSpinLEDV->value();
    int decimation = ui->spinPLotDecimation->value();
    int nacqs = ui->spinAcquisitions->value();
    int tstart = ui->spintStart->value();
    int tend = ui->spinTEnd->value();
    int tinc = ui->spinTIncrement->value();
    int tcurrent = tstart;

        //Plot data
    QVector<double> xdata;
    QList<QVector<double>> ymeandata;
    QList<QVector<double>> ystddata;
    for (int ch = 0; ch < (nr_devices*128); ch+= decimation)
    {
        ymeandata.append(xdata);    //just add empty vectors to the list
        ystddata.append(xdata);    //just add empty vectors to the list
    }



        //The number of plotted lines is smaller than number of channels - see decimation
    for (int plotnr = 0; plotnr < nr_devices*128; plotnr++)
    {
        ui->plotResultsMean->addGraph();
        ui->plotResultsStd->addGraph();
    }


    double xmin = 1e+10;
    double xmax = -1e+10;
    double ymeanmin = 1e+10;
    double ymeanmax = -1e+10;
    double ystdmin = 1e+10;
    double ystdmax = -1e+10;


    if (use_led)
    {
        theKeithley->setVoltage(ledv);
        theKeithley->on(1);
    }

    theHW->run();

        //Measure!
    while ((runState != STOP_ISSUED) && (tcurrent <= tend))
    {
            //Set LED voltage
        qInfo(qPrintable(QString("Integration time: %1 ").arg(tcurrent)));

            //set up integration time for all devices
        theHW->stop();
        for (int dev_nr = 0; dev_nr < theHW->devices.length(); dev_nr++)
        {
            DeviceConfig dc = theHW->devices[dev_nr]->deviceConfig;
            dc.tint = tcurrent;
            theHW->devices[dev_nr]->configure(dc);
        }
        theHW->run();

        TiScanResult result;

            //Collect sensor data
        histoReady = 0;
        connect(&(theHW->eventBuilder), EventBuilder::sigHistoCompleted, this, DialogTiScan::onHistogramCompleted);
        theHW->eventBuilder.startTakingHistos(nacqs);
        while (!histoReady)
        {
             QCoreApplication::processEvents();
             QThread::msleep(10);
        }
        disconnect(&(theHW->eventBuilder), EventBuilder::sigHistoCompleted, this, DialogTiScan::onHistogramCompleted);
        QVector<Histogram> histos = theHW->eventBuilder.getHistos();

        result.mean.fill(0, nr_devices*128);
        result.std.fill(0, nr_devices*128);
        for (int i = 0; i < result.mean.length(); i++)
        {
            histos[i].MS(&(result.mean[i]), &(result.std[i]));
            //result.mean[i] = histos[i].mean();
            //result.std[i] = histos[i].stdev();
        }

            //Add information on integration time
        result.tint = tcurrent;
        results.append(result);

            //Plot data...
        xdata.append(result.tint);
        if (result.tint > xmax)
            xmax = result.tint;
        if (result.tint < xmin)
            xmin = result.tint;

        for (int ch = 0, i = 0; ch < (nr_devices*128); ch+= decimation, i++)
        {
            ymeandata[i].append(result.mean[ch]);
            if (result.mean[ch] > ymeanmax)
                ymeanmax = result.mean[ch];
            if (result.mean[ch] < ymeanmin)
                ymeanmin = result.mean[ch];
            ystddata[i].append(result.std[ch]);
            if (result.std[ch] > ystdmax)
                ystdmax = result.std[ch];
            if (result.std[ch] < ystdmin)
                ystdmin = result.std[ch];
        }

        ui->plotResultsMean->xAxis->setRange(xmin, xmax);
        ui->plotResultsMean->yAxis->setRange(ymeanmin, ymeanmax);
        ui->plotResultsStd->xAxis->setRange(xmin, xmax);
        ui->plotResultsStd->yAxis->setRange(ystdmin, ystdmax);

        for (int ch = 0, i = 0; ch < (nr_devices*128); ch+= decimation, i++)
        {
            ui->plotResultsMean->graph(i)->setData(xdata, ymeandata[i]);
            ui->plotResultsStd->graph(i)->setData(xdata, ystddata[i]);
        }

        ui->plotResultsMean->replot();
        ui->plotResultsStd->replot();

            //Roll over
        tcurrent += tinc;
        QCoreApplication::processEvents();
    }

    if (use_led)
        theKeithley->on(0);

    theHW->stop();

    qInfo("Integration time scan finished!");
    runState = STOPPED;
}


//************** Slots ****************

void DialogTiScan::onHistogramCompleted()
{
    histoReady = 1;
}

void DialogTiScan::on_pushRun_pressed()
{
    if (runState)
    {
        runState = STOP_ISSUED;
    }
    else
    {
        ui->pushRun->setText("Stop");
        ui->pushSave->setEnabled(false);
        run();
        ui->pushRun->setText("Run");
        ui->pushSave->setEnabled(true);
    }

}

void DialogTiScan::on_pushSave_pressed()
{
    QString filename = QFileDialog::getSaveFileName(this, "Select file for saving data", "", tr("Comma separated files (*.csv)"));
    QString delimiter = QString(",");

    if (filename.length() == 0)
        return;

    QFile file(filename);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return;

    QTextStream out(&file);
    out << qSetFieldWidth(14) << qSetRealNumberPrecision(8);
    for (int row = 0; row < results.length(); row++)
    {
        out << results[row].tint;

        for (int col = 0; (col < results[row].mean.length()) && (col < results[row].std.length()); col++)
            out << delimiter << results[row].mean[col] << delimiter << results[row].std[col];
        out << QString("\n");
    }

    file.close();
}
