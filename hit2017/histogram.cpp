#include "histogram.h"

Histogram::Histogram()
{
    resize(1);
}

Histogram::Histogram(const Histogram& other)
{
    length = other.getLength();
    data = other.data;
}

Histogram::Histogram(int newlength)
{
    resize(newlength);
}

Histogram::~Histogram()
{
    data.clear();
}

void Histogram::resize(int newlength)
{
    length = newlength;
    data.clear();
    data.resize(length);
    clear();
}

void Histogram::clear()
{
    data.fill(0);
}

int Histogram::getLength() const
{
    return length;
}

int& Histogram::operator[](int pos)
{
    if (pos < 0)
        pos = 0;
    if (pos >= length)
        pos = length-1;

    return data[pos];
}

Histogram& Histogram::operator=(const Histogram& other)
{
    if (this != &other)
    {
        length = other.getLength();
        data = other.data;
    }
    return *this;
}

void Histogram::shoot(int channel)
{
    if ((channel >= 0) && (channel < length))
            data[channel]++;
}

int Histogram::getNrSamples()
{
    int result = 0;
    for (int ch = 0; ch < length; ch++)
        result += data[ch];\

    return result;
}

double Histogram::moment(int n)
{
    double result;
    for (int ch = 0; ch < length; ch++)
        result += (pow(ch,n) * data[ch]);
    result /= getNrSamples();

    return result;
}

double Histogram::cmoment(int n)
{
    double result;
    double EX = moment(1);
    for (int ch = 0; ch < length; ch++)
        result += (pow((ch-EX),n) * data[ch]);
    result /= getNrSamples();

    return result;
}


double Histogram::mean()
{
    //return moment(1);
        //faster:
    double result;
    for (int ch = 0; ch < length; ch++)
        result += ((long int)ch * (long int)data[ch]);

    return (double) result / getNrSamples();
}

double Histogram::var()
{
    //return moment(2) - pow(mean(),2);
    //faster:
    double result;
    for (int ch = 0; ch < length; ch++)
        result += ((double)ch * (double)ch * (double)data[ch]);

    return (double) result / getNrSamples();
}

double Histogram::stdev()
{
    return sqrt(var());
}

void Histogram::MS(double* mean, double* stdev)
{
    double nr_samples = 0;
    double EX = 0;
    double EX2 = 0;
    double tmp;
    for (int ch = 0; ch < length; ch++)
    {
        tmp =  (double)ch * (double)data[ch];
        nr_samples += data[ch];
        EX += tmp;
        EX2 += (double)ch * tmp;
    }
    EX /= nr_samples;
    EX2 /= nr_samples;

    *mean = EX;
    *stdev = sqrt( EX2 - EX*EX );
}
