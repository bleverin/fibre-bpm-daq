#ifndef HISTOGRAM_H
#define HISTOGRAM_H

#include <QVector>


class Histogram
{
public:
    Histogram();
    Histogram(const Histogram &other);
    Histogram(int newlength);
    ~Histogram();

    void resize(int newlength);
    void clear();

    int getLength() const;
    int &operator [](int pos);

    int length;
    QVector<int> data;
    Histogram &operator =(const Histogram &other);
    void shoot(int channel);    //add one event to the histogram
    int getNrSamples();
    double moment(int n);
    double cmoment(int n);
    double mean();
    double var();
    double stdev();
    void MS(double *mean, double *stdev);   //calculate mean and stdev
protected:

};

#endif // HISTOGRAM_H
