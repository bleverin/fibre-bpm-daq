#include "hit_analyse_v2.h"
#include <random>

HIT_ANALYSE_V2::HIT_ANALYSE_V2(QObject *parent) : QObject(parent)
{



}

QString HIT_ANALYSE_V2::analyseBeamData(QVector<BufferData> dataframe){

    double position=0.1;
    double focus=8;
    double intensity=10000.0;
    QString dataString;


    const int vector_length = 300; // Replace with the actual length of your vectors

    std::vector<double> signal_list(vector_length);
    std::vector<double> channel_list(vector_length);


    // Create a random number generator with a Gaussian distribution
    std::random_device rd;
    std::mt19937 gen(rd());
    std::normal_distribution<double> dist(0.0, 17.0); // Mean of 0 and Sigma of 17

    // Create a vector to store the generated values
    std::vector<short int> result(vector_length);

    // Fill the vector with random values
    for (int i = 0; i < vector_length; ++i) {
        result[i] = static_cast<short int>(dist(gen));
        signal_list.push_back(result[i]);
        channel_list.push_back(i);
    }
    //add a gaussian profile, focus is FWHM, position is random between 50 and 250
    position = 50 + (rand() % (int)(250 - 50 + 1));
    for  (int i = 0; i < vector_length; ++i) {
        signal_list[i] += intensity*exp(-4*log(2)*pow((channel_list[i]-position)/focus,2));
    }




    // Fill signal_list and channel_list with your data

    double SumT = 0.0, SumS = 0.0, SumS2 = 0.0, SumST = 0.0, SumT2 = 0.0, SumY = 0.0, SumYS = 0.0, SumYT = 0.0;
    double b_den = 0.0, b_num = 0.0, b = 0.0, p = 0.0, c = 0.0, SumYYP = 0.0, SumYYM = 0.0, MeanY = 0.0;
    double S[vector_length];
    double T[vector_length];

    for (int k = 0; k < vector_length; k++) {
        if (k == 0) {
            S[k] = 0.0;
            T[k] = 0.0;
        } else {
            S[k] = S[k - 1] + 0.5 * (signal_list[k] + signal_list[k - 1]) * (channel_list[k] - channel_list[k - 1]);
            T[k] = T[k - 1] + 0.5 * (channel_list[k] * signal_list[k] + channel_list[k - 1] * signal_list[k - 1]) *
                                  (channel_list[k] - channel_list[k - 1]);
        }
        SumS += S[k];
        SumT += T[k];
        SumY += signal_list[k];
        SumS2 += S[k] * S[k];
        SumST += S[k] * T[k];
        SumT2 += T[k] * T[k];
        SumYS += signal_list[k] * S[k];
        SumYT += signal_list[k] * T[k];
        MeanY += signal_list[k];
    }
    MeanY /= vector_length;

    // Calculate M1 matrix elements
    double M1_00 = SumT2;
    double M1_01 = SumST;
    double M1_02 = SumT;
    double M1_10 = SumST;
    double M1_11 = SumS2;
    double M1_12 = SumS;
    double M1_20 = SumT;
    double M1_21 = SumS;
    double M1_22 = vector_length;

    // Calculate M2 vector elements
    double M2_0 = SumYT;
    double M2_1 = SumYS;
    double M2_2 = SumY;

    // Calculate the inverse of M1
    double detM1 = M1_00 * (M1_11 * M1_22 - M1_12 * M1_21) -
                   M1_01 * (M1_10 * M1_22 - M1_12 * M1_20) +
                   M1_02 * (M1_10 * M1_21 - M1_11 * M1_20);

    if (detM1 == 0.0) {
        std::cerr << "M1 is not invertible." << std::endl;
        //return 1;
    }

    double invM1_00 = (M1_11 * M1_22 - M1_12 * M1_21) / detM1;
    double invM1_01 = (M1_02 * M1_21 - M1_01 * M1_22) / detM1;
    double invM1_02 = (M1_01 * M1_12 - M1_02 * M1_11) / detM1;
    double invM1_10 = (M1_12 * M1_20 - M1_10 * M1_22) / detM1;
    double invM1_11 = (M1_00 * M1_22 - M1_02 * M1_20) / detM1;
    double invM1_12 = (M1_02 * M1_10 - M1_00 * M1_12) / detM1;
    double invM1_20 = (M1_10 * M1_21 - M1_11 * M1_20) / detM1;
    double invM1_21 = (M1_01 * M1_20 - M1_00 * M1_21) / detM1;
    double invM1_22 = (M1_00 * M1_11 - M1_01 * M1_10) / detM1;

    // Calculate ABC vector
    double ABC_0 = invM1_00 * M2_0 + invM1_01 * M2_1 + invM1_02 * M2_2;
    double ABC_1 = invM1_10 * M2_0 + invM1_11 * M2_1 + invM1_12 * M2_2;
    double ABC_2 = invM1_20 * M2_0 + invM1_21 * M2_1 + invM1_22 * M2_2;

    // Calculate b, p, and c
    p = -ABC_0 / 2.0;
    c = -ABC_1 / ABC_0;

    for (int k = 0; k < vector_length; k++) {
        double exp_term = exp(-p * (channel_list[k] - c) * (channel_list[k] - c));
        b_num += exp_term * signal_list[k];
        b_den += exp_term;
    }

    b = b_num / b_den;

    for (int k = 0; k < vector_length; k++) {
        double y_pred = b * exp(-p * (channel_list[k] - c) * (channel_list[k] - c));
        SumYYM += (signal_list[k] - MeanY) * (signal_list[k] - MeanY);
        SumYYP += (y_pred - MeanY) * (y_pred - MeanY);
    }

    double R_squared = SumYYP / SumYYM;
    //std::cout << "R-squared = " << R_squared << endl;
    position = -ABC_1/ ABC_0;
    //sigma = sqrt(1.0 / (2.0 * ABC_0));
    focus = 2.3548/sqrt(2*p);
    intensity = b;

    dataString += QString::number(intensity) + ',' + QString::number(position) + ',' + QString::number(focus)
                         + ',' + QString::number(R_squared);


    return dataString;


}

HIT_ANALYSE_V2::~HIT_ANALYSE_V2()
{

}
