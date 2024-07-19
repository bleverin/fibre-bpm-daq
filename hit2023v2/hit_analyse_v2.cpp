#include "hit_analyse_v2.h"
#include <random>
#include <immintrin.h> // Include for Intel Intrinsics

HIT_ANALYSE_V2::HIT_ANALYSE_V2(QObject *parent) : QObject(parent)
{



}




// Define your own functions for matrix operations
struct Matrix2x2 {
    double data[2][2];
};

Matrix2x2 InvertMatrix2x2(const Matrix2x2& mat) {
    Matrix2x2 result;
    double det = mat.data[0][0] * mat.data[1][1] - mat.data[0][1] * mat.data[1][0];
    if (det != 0.0) {
        double invDet = 1.0 / det;
        result.data[0][0] = mat.data[1][1] * invDet;
        result.data[0][1] = -mat.data[0][1] * invDet;
        result.data[1][0] = -mat.data[1][0] * invDet;
        result.data[1][1] = mat.data[0][0] * invDet;
    } else {
        // Handle the case when the matrix is not invertible
        // You might want to implement error handling here.
        std::cerr << "Matrix not invertible! " << std::endl;
    }
    return result;
}

struct Vector2 {
    double data[2];
};

QString HIT_ANALYSE_V2::analyseBeamData(short int * signal_list, const int dev_nr, const int vector_length)
{

    double position=100;
    double focus=8;
    double intensity=1000.0;
    QString dataString;

    // Fill arr1 and arr2 with your data


    std::vector<double> channel_list;
    std::vector<double> short_signal_list;
    std::vector<double> short_channel_list;

    channel_list = fixed_channel;

    // Create a vector to store the generated values
    // std::vector<short int> result(vector_length);


    // Fill the vector with random noise values
    //add a gaussian profile, focus is FWHM, position is random between 50 and 250
    bool fixeddata = false  ;
    if (fixeddata){
    //    signal_list = (short int)fixedsignalarray;
        bool dummy = true;
    }
    else
    {
//        signal_list = dataframe[dev_nr].sensor_data;
        bool dummy = false;
    }
 //   std::cerr << signal_list[0] << " " << dev_nr << std::endl;

    double SumArea = 0.0, SumY2 = 0.0, SumXY2 = 0.0, SumX2Y2 = 0.0, SumX3Y2 = 0.0;
    double SumY2LnY = 0.0, SumXY2LnY = 0.0, Ymax = 0.0, Pomax = 0.0;
    double fac_c = 0.0, Yn = 0.0, sigma = 0.0, amp = 0.0;
    double SumYYP = 0.0, SumYYM = 0.0, MeanY = 0.0, window_start = 0.0, window_end = 0.0;

    // ...

    Matrix2x2 M1, M1inv;
    Vector2 ABC, M2;

    for (int i = 0; i < vector_length; i++) {
        std::cerr<< signal_list[i] << " ";
        if (signal_list[i] > Ymax) {
            Ymax = signal_list[i];
            Pomax = channel_list[i];
        }
        if (i > 0 && signal_list[i] > 34) {
            SumArea += signal_list[i] * (channel_list[i] - channel_list[i - 1]);
        }
    }
    std::cerr<< std::endl;
    // Estimate sigma
    sigma = SumArea / Ymax / 2.5066;

    // Set a +-3 sigma window
    window_start = Pomax - 3 * sigma;
    window_end = Pomax + 3 * sigma;
    std::cerr<< Pomax << " " << Ymax <<  " " << sigma << std::endl;


    for (int i = 0; i < vector_length; i++) {
        if (signal_list[i] > 34 && channel_list[i] > window_start && channel_list[i] < window_end) {
            short_signal_list.push_back(signal_list[i]);
            short_channel_list.push_back(channel_list[i]);
        }
    }
    //signal_list.clear();
    //channel_list.clear();
    // Recalculate SumArea using the sieved data
    SumArea = 0.0;
    for (int i = 1; i < short_signal_list.size(); i++) {
        SumArea += short_signal_list[i] * (short_channel_list[i] - short_channel_list[i - 1]);
    }


    const int shortlist_length = short_channel_list.size();

    if (shortlist_length <= 3) {
        intensity = -1;
        focus = -1;
        position = -128;
        dataString += QString::number(intensity) + ',' + QString::number(position) + ',' + QString::number(focus)
                      + ',' + QString::number(0);


        return dataString;
    }

    // Re-Estimate sigma
    sigma = SumArea / Ymax / 2.5066;
    fac_c = -1.0 / (2.0 * sigma * sigma);
   // std::cerr << sigma << std::endl;
    for(int k=0; k<shortlist_length;k++){

        SumY2 += short_signal_list[k]*short_signal_list[k];
        SumXY2 += short_signal_list[k]*short_signal_list[k]*short_channel_list[k];
        SumX2Y2 +=  short_signal_list[k]*short_signal_list[k]*short_channel_list[k]*short_channel_list[k];
        SumX3Y2 +=  short_signal_list[k]*short_signal_list[k]*short_channel_list[k]*short_channel_list[k]*short_channel_list[k];

        SumY2LnY += short_signal_list[k]*short_signal_list[k]*log(short_signal_list[k]);
        SumXY2LnY += short_channel_list[k]*short_signal_list[k]*short_signal_list[k]*log(short_signal_list[k]);
      //  std::cerr<< shortlist_length << " " << short_channel_list[k] << " " << short_signal_list[k] << " " << short_signal_list[k] << " " << log(short_signal_list[k]) << std::endl;
        MeanY+=short_signal_list[k];
    }
    MeanY/=shortlist_length;

    // Use custom matrix and vector functions for calculations
    M1.data[0][0] = SumY2;
    M1.data[0][1] = SumXY2;
    M1.data[1][0] = SumXY2;
    M1.data[1][1] = SumX2Y2;

  //  std::cerr << M1.data[0][0]  << " " << M1.data[0][1] << " " << M1.data[1][0] << " " << M1.data[1][1] << std::endl;
    M2.data[0] = SumY2LnY - fac_c * SumX2Y2;
    M2.data[1] = SumXY2LnY - fac_c * SumX3Y2;
  //  std::cerr << M2.data[0] << " " << M2.data[1]  << std::endl;
    M1inv = InvertMatrix2x2(M1);
    ABC.data[0] = M1inv.data[0][0] * M2.data[0] + M1inv.data[0][1] * M2.data[1];
    ABC.data[1] = M1inv.data[1][0] * M2.data[0] + M1inv.data[1][1] * M2.data[1];

   // std::cerr << ABC.data[0]  << " " << ABC.data[1] << std::endl;


//iterate to improve the fit.
    int N_iter = 1;
    for (int i = 0; i < N_iter; i++) {
        SumY2 = 0.0;
        SumXY2 = 0.0;
        SumX2Y2 = 0.0;
        SumX3Y2 = 0.0;
        SumY2LnY = 0.0;
        SumXY2LnY = 0.0;

        for (int k = 0; k < shortlist_length; k++) {
            Yn = exp(ABC.data[0] + ABC.data[1] * short_channel_list[k] + fac_c * short_channel_list[k] * short_channel_list[k]);
            SumY2 += Yn * Yn;
            SumXY2 += Yn * Yn * short_channel_list[k];
            SumX2Y2 += Yn * Yn * short_channel_list[k] * short_channel_list[k];
            SumX3Y2 += Yn * Yn * short_channel_list[k] * short_channel_list[k] * short_channel_list[k];
            SumY2LnY += Yn * Yn * log(short_signal_list[k]);
            SumXY2LnY += short_channel_list[k] * Yn * Yn * log(short_signal_list[k]);
        }

        M1.data[0][0] = SumY2;
        M1.data[0][1] = SumXY2;
        M1.data[1][0] = SumXY2;
        M1.data[1][1] = SumX2Y2;

        M2.data[0] = SumY2LnY - fac_c * SumX2Y2;
        M2.data[1] = SumXY2LnY - fac_c * SumX3Y2;

        M1inv = InvertMatrix2x2(M1);
        ABC.data[0] = M1inv.data[0][0] * M2.data[0] + M1inv.data[0][1] * M2.data[1];
        ABC.data[1] = M1inv.data[1][0] * M2.data[0] + M1inv.data[1][1] * M2.data[1];
    }

    position = -ABC.data[1]/fac_c/2;

    amp = exp(ABC.data[0]-ABC.data[1]*ABC.data[1]/4/fac_c);

    sigma=SumArea/amp/2.5066;

    // cout << sigma << " " << mean << " " << amp << endl;


    for(int k=0; k<shortlist_length;k++){
        SumYYM+= (short_signal_list[k]-MeanY)*(short_signal_list[k]-MeanY);
        SumYYP+= (amp*exp(-(short_channel_list[k]-position)*(short_channel_list[k]-position)/2/(sigma*sigma)) - MeanY )*(amp*exp(-(short_channel_list[k]-position)*(short_channel_list[k]-position)/2/(sigma*sigma)) - MeanY );
    }



    focus = 2.3548*sigma;
    intensity = amp;
    double R_squared = SumYYP/SumYYM;

    dataString += QString::number(intensity) + ',' + QString::number(position) + ',' + QString::number(focus)
                         + ',' + QString::number(R_squared);


    return dataString;


}



HIT_ANALYSE_V2::~HIT_ANALYSE_V2()
{

}
