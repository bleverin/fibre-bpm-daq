#ifndef DIALOGTISCAN_H
#define DIALOGTISCAN_H

#include <QDialog>
#include <QVector>
#include <QList>
#include "hw.h"
#include "keithley_thr.h"
#include "histogram.h"
#include "helpers.h"

typedef struct
{
    int tint;
    QVector<double> mean;
    QVector<double> std;
} TiScanResult;


namespace Ui {
class DialogTiScan;
}

class DialogTiScan : public QDialog
{
    Q_OBJECT

public:
    explicit DialogTiScan(QWidget *parent = 0);
    ~DialogTiScan();
    HW* theHW;
    keithley_thr* theKeithley;

public slots:
    void onHistogramCompleted();
    void showEvent(QShowEvent *event);
protected:
    int runState;
    int histoReady;
    QList<TiScanResult> results;

    void run();
private slots:
    void on_pushRun_pressed();

    void on_pushSave_pressed();

private:
    Ui::DialogTiScan *ui;
};

#endif // DIALOGTISCAN_H
