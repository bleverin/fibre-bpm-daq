#include "display.h"
#include "ui_display.h"

Display::Display(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::display)
{
    ui->setupUi(this);
}

Display::~Display()
{
    delete ui;
}

void Display::showEvent(QShowEvent * event)
{
    if (!event->spontaneous())
    {
       ui->plot->addGraph();

    }
    QDialog::showEvent(event);
}

//***********************************************

void Display::plot(const QVector<unsigned short> &data)
{
        //resize data vectors and fill X values - only if needed
    if (data.length() != nrPoints)
    {
        nrPoints = data.length();
        dataX.clear();
        dataY.clear();
        dataX.resize(nrPoints);
        dataY.resize(nrPoints);

        ui->plot->xAxis->setRange(0,nrPoints-1);
        //ui->plot->yAxis->setRange(-1000,66000);

        for (int i = 0; i < nrPoints; i++)
            dataX[i] = i;
    }

        //fill Y values
    double min = 65535;
    double max = 0;
    for (int i = 0; i < nrPoints; i++)
    {
        dataY[i] = /*65535 -*/ data[i];
        if (dataY[i] < min)
            min = dataY[i];
        if (dataY[i] > max)
            max = dataY[i];
    }

    if (ui->checkAutoscale->isChecked())
        ui->plot->yAxis->setRange(min-0.05*(max-min),max+0.05*(max-min));
    else
        ui->plot->yAxis->setRange(-1000,66000);

        //feed plotter
    ui->plot->graph(0)->setData(dataX, dataY);

        //plot
    ui->plot->replot();
}

void Display::plot()
{
    plot(buffer);
}

void Display::setTitle(QString title)
{
    ui->lineTitle->setText(title);
}
