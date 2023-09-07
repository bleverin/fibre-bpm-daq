#include "display.h"
#include "ui_display.h"

Display::Display(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::display)
{
    ui->setupUi(this);


    // Copy/Create and initialize radio buttons
    radioButtonFixedScale = ui->radioButtonFixedScale;//new QRadioButton("Fixed Scale", this);
    radioButtonAutoscale = ui->radioButtonAutoscale;//new QRadioButton("Autoscale", this);

    // Copy/Create and initialize the button group
    buttonGroup = ui->buttonGroup;//new QButtonGroup(this);
    buttonGroup->setExclusive(true); // Ensure exclusivity

    // Add radio buttons to the button group
    buttonGroup->addButton(ui->radioButtonFixedScale);
    buttonGroup->addButton(ui->radioButtonAutoscale);
    buttonGroup->addButton(ui->radioButtonMaxScale);

    // Connect the buttonClicked signal of the button group
    connect(buttonGroup, SIGNAL(buttonClicked(QAbstractButton*)), this, SLOT(onButtonClicked(QAbstractButton*)));

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

    if (ui->radioButtonAutoscale->isChecked())
        ui->plot->yAxis->setRange(min-0.05*(max-min),max+0.05*(max-min));
    else if (ui->radioButtonFixedScale ->isChecked())
        ui->plot->yAxis->setRange(ui->spinBox_fixedmin->value(), ui->spinBox_fixedmax->value());
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

// Slot to handle button clicks
void Display::onButtonClicked(QAbstractButton *button)
{
    // Handle button clicks here
    if (button == radioButtonFixedScale)
    {
        // Fixed Scale radio button clicked
        // Handle the Fixed Scale selection
        // Perform actions when Fixed Scale is selected
        radioButtonFixedScale->setChecked(true); // Enable relevant controls
        radioButtonAutoscale->setChecked(false); // Disable other controls
    }//
    else if (button == radioButtonAutoscale)
    {
        // Autoscale radio button clicked
        // Handle the Autoscale selection
        // Perform actions when Autoscale is selected
        ui->radioButtonFixedScale->setChecked(false); // Disable relevant controls
        ui->radioButtonAutoscale->setChecked(true); // setEnabled(true); // Enable other controls
    }
}
