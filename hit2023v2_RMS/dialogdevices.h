 #ifndef DIALOGDEVICES_H
#define DIALOGDEVICES_H

#include <QDialog>
#include <QSettings>
#include <QShowEvent>
#include <QVector> // Include QVector for calibration data storage
#include <QTableWidgetItem>

namespace Ui {
class DialogDevices;
}

class DialogDevices : public QDialog
{
    Q_OBJECT

public:
    explicit DialogDevices(QWidget *parent = 0);
    ~DialogDevices();
    QSettings* deviceSettings = NULL;

    QVector<QVector<unsigned short>> getAllCalibrationFactors() const; // Declaration of the method
public slots:
    void showEvent(QShowEvent *event);
    void accept();
protected:
    int validateAndSave();
    bool loadCalibrationFactorsFromFile(const QString &filePath, QVector<unsigned short> &calibrationFactors); // Function to load calibration factors from a file
    void applyCalibrationDataToDevice(int dev_nr, const QVector<unsigned short>& data); // Function to apply calibration data to a device
    void importSettings();
    int last_nr_devices = -1;
    int initialized = 0;
    QVector<QVector<unsigned short>> deviceCalibrationData; // Storage for calibration data for each device
private slots:
    void on_spinNrDevices_valueChanged(int arg1);
    void selectCalibrationFile(int dev_nr); // Slot for handling calibration file selection
private:
    Ui::DialogDevices *ui;

};

#endif // DIALOGDEVICES_H
