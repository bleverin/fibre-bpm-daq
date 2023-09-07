#ifndef DISPLAY_H
#define DISPLAY_H

#include <QDialog>
#include <QVector>
#include <QRadioButton>
#include <QButtonGroup>
#include <QTextStream>
#include <QFile>

namespace Ui {
class display;
}

class Display : public QDialog
{
    Q_OBJECT

public:
    explicit Display(QWidget *parent = 0);
    ~Display();


    void plot(const QVector<unsigned short> &data);
    void plot();
    void setTitle(QString title);

    QVector<unsigned short> buffer;

public slots:
    void showEvent(QShowEvent *event);
    void onButtonClicked(QAbstractButton *button);
    void onSaveBackgroundClicked();

protected:
    int nrPoints = 0;
    QVector<double> dataX;
    QVector<double> dataY;
private:
    Ui::display *ui;
    QRadioButton *radioButtonFixedScale; // Pointer to the Fixed Scale radio button
    QRadioButton *radioButtonAutoscale;  // Pointer to the Autoscale radio button
    QButtonGroup *buttonGroup;

};

#endif // DISPLAY_H
