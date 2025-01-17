#ifndef DISPLAY_H
#define DISPLAY_H

#include <QDialog>
#include <QVector>
#include <QRadioButton>
#include <QButtonGroup>
#include <QTextStream>
#include <QFile>
#include <QCheckBox>

namespace Ui {
class display;
}

class BPMDisplay : public QDialog
{
    Q_OBJECT

public:
    explicit BPMDisplay(QWidget *parent = 0);
    ~BPMDisplay();


    void plot(const QVector<unsigned short> &data);
    void plot();
    void setTitle(QString title);

    QVector<unsigned short> buffer;

public slots:
    void showEvent(QShowEvent *event);
    void onButtonClicked(QAbstractButton *button);
    void onSaveBackgroundClicked();
    void onLoadBackgroundClicked();
    void onCheckBoxStateChanged(int state);
    void onSaveCalibrationClicked();
    void onLoadCalibrationClicked();
    void onCalibrationCheckBoxChanged(int state);
    void onExpertModeStateChanged(int state);

protected:
    int nrPoints = 0;
    QVector<double> dataX;
    QVector<double> dataY;
private:
    Ui::display *ui;
    QRadioButton *radioButtonFixedScale; // Pointer to the Fixed Scale radio button
    QRadioButton *radioButtonAutoscale;  // Pointer to the Autoscale radio button
    QButtonGroup *buttonGroup;
    QMap<QString, QVector<unsigned short>> backgroundDataMap; // Map to store background data for each plane
    bool subtractBackground = false; // Flag to track if background subtraction is enabled

    QMap<QString, QVector<float>> calibrationDataMap; // Map to store calibration data for each plane
    bool applyCalibration = false; // Flag to track if calibration should be applied
    QVector<float> calibrationData; // Stores the loaded calibration data
    QCheckBox *checkBoxExpertMode; // Expert Mode checkbox
    bool expertModeEnabled = false; // Flag to track if expert mode is enabled
};

#endif // DISPLAY_H
