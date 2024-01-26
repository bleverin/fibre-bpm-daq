#ifndef HIT_ANALYSE_V2_H
#define HIT_ANALYSE_V2_H

#include <string>
#include <stdio.h>
#include <iostream>
#include <numeric>
#include <vector>
#include <algorithm>    // std::count
#include <utility>
#include <math.h>
#include <fstream>
#include <iomanip>      // std::setprecision
#include <QObject>
#include <QUdpSocket>
#include <complex.h>
#include <stdlib.h>
#include "datareceiver.h"
//#include <gsl/gsl_errno.h>
//#include <gsl/gsl_fft_complex.h>
//#include <gsl/gsl_sort.h>
//#include <gsl/gsl_statistics.h>

class HIT_ANALYSE_V2 : public QObject
{
    Q_OBJECT
public:
    explicit HIT_ANALYSE_V2(QObject *parent = nullptr);
    ~HIT_ANALYSE_V2();
private:
    struct beamRecon  {

        double Position;
        double Focus;
        double Peak;
        double Rsqr;
        double Skew;
        double Kurtosis;
        double Sum;
        int n_channels;
    };

    struct bpm_frame_v2 {
        double channel_amp[320];
        double channel_position[320];
        double avg_position;
        double avg_width;
        double integratedsignalamp;
        double maxchannel_amp;
        int maxchannel;
        int nrChannels;
        int board_number;
        int sma_state;

    };


public slots:
    QString analyseBeamData(QVector<BufferData> dataframe);
   // void processPendingDatagrams();

};

class Channel{
public:
    double amplitude;;
    double position;
    int chnumber;
    int last_neighbour;
    int next_neighbour;
};
#endif // HIT_ANALYSE_V2_H
