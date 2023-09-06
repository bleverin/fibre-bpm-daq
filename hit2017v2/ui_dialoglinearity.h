/********************************************************************************
** Form generated from reading UI file 'dialoglinearity.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGLINEARITY_H
#define UI_DIALOGLINEARITY_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QDoubleSpinBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qcustomplot.h"

QT_BEGIN_NAMESPACE

class Ui_DialogLinearity
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QGridLayout *gridLayout;
    QSpacerItem *verticalSpacer_2;
    QLabel *label_5;
    QLabel *label_8;
    QSpinBox *spinDelay;
    QLabel *label_9;
    QLabel *label_7;
    QLabel *label_6;
    QLabel *label_10;
    QSpinBox *spinAcquisitions;
    QLabel *label_3;
    QDoubleSpinBox *doubleSpinVend;
    QDoubleSpinBox *doubleSpinVstart;
    QLabel *label_2;
    QLabel *label_4;
    QDoubleSpinBox *doubleSpinVinc;
    QLabel *label_11;
    QSpinBox *spinPLotDecimation;
    QSpacerItem *verticalSpacer_3;
    QPushButton *pushRun;
    QPushButton *pushSave;
    QSpacerItem *verticalSpacer;
    QVBoxLayout *verticalLayout_3;
    QLabel *label_12;
    QCustomPlot *plotResultsMean;
    QLabel *label_13;
    QCustomPlot *plotResultsStd;

    void setupUi(QDialog *DialogLinearity)
    {
        if (DialogLinearity->objectName().isEmpty())
            DialogLinearity->setObjectName(QStringLiteral("DialogLinearity"));
        DialogLinearity->resize(844, 632);
        buttonBox = new QDialogButtonBox(DialogLinearity);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(490, 590, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Close);
        horizontalLayoutWidget = new QWidget(DialogLinearity);
        horizontalLayoutWidget->setObjectName(QStringLiteral("horizontalLayoutWidget"));
        horizontalLayoutWidget->setGeometry(QRect(10, 10, 821, 571));
        horizontalLayout = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        label = new QLabel(horizontalLayoutWidget);
        label->setObjectName(QStringLiteral("label"));
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy);
        label->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(label);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Fixed);

        gridLayout->addItem(verticalSpacer_2, 3, 0, 1, 1);

        label_5 = new QLabel(horizontalLayoutWidget);
        label_5->setObjectName(QStringLiteral("label_5"));

        gridLayout->addWidget(label_5, 0, 2, 1, 1);

        label_8 = new QLabel(horizontalLayoutWidget);
        label_8->setObjectName(QStringLiteral("label_8"));

        gridLayout->addWidget(label_8, 4, 0, 1, 1);

        spinDelay = new QSpinBox(horizontalLayoutWidget);
        spinDelay->setObjectName(QStringLiteral("spinDelay"));
        spinDelay->setMinimum(100);
        spinDelay->setMaximum(10000);
        spinDelay->setSingleStep(100);
        spinDelay->setValue(1500);

        gridLayout->addWidget(spinDelay, 4, 1, 1, 1);

        label_9 = new QLabel(horizontalLayoutWidget);
        label_9->setObjectName(QStringLiteral("label_9"));

        gridLayout->addWidget(label_9, 4, 2, 1, 1);

        label_7 = new QLabel(horizontalLayoutWidget);
        label_7->setObjectName(QStringLiteral("label_7"));

        gridLayout->addWidget(label_7, 2, 2, 1, 1);

        label_6 = new QLabel(horizontalLayoutWidget);
        label_6->setObjectName(QStringLiteral("label_6"));

        gridLayout->addWidget(label_6, 1, 2, 1, 1);

        label_10 = new QLabel(horizontalLayoutWidget);
        label_10->setObjectName(QStringLiteral("label_10"));

        gridLayout->addWidget(label_10, 5, 0, 1, 1);

        spinAcquisitions = new QSpinBox(horizontalLayoutWidget);
        spinAcquisitions->setObjectName(QStringLiteral("spinAcquisitions"));
        spinAcquisitions->setMinimum(1);
        spinAcquisitions->setMaximum(1000000);
        spinAcquisitions->setSingleStep(1000);
        spinAcquisitions->setValue(10000);

        gridLayout->addWidget(spinAcquisitions, 5, 1, 1, 1);

        label_3 = new QLabel(horizontalLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        gridLayout->addWidget(label_3, 1, 0, 1, 1);

        doubleSpinVend = new QDoubleSpinBox(horizontalLayoutWidget);
        doubleSpinVend->setObjectName(QStringLiteral("doubleSpinVend"));
        doubleSpinVend->setMaximum(10);
        doubleSpinVend->setSingleStep(0.1);
        doubleSpinVend->setValue(6);

        gridLayout->addWidget(doubleSpinVend, 1, 1, 1, 1);

        doubleSpinVstart = new QDoubleSpinBox(horizontalLayoutWidget);
        doubleSpinVstart->setObjectName(QStringLiteral("doubleSpinVstart"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(doubleSpinVstart->sizePolicy().hasHeightForWidth());
        doubleSpinVstart->setSizePolicy(sizePolicy1);
        doubleSpinVstart->setMaximum(10);
        doubleSpinVstart->setSingleStep(0.1);
        doubleSpinVstart->setValue(2);

        gridLayout->addWidget(doubleSpinVstart, 0, 1, 1, 1);

        label_2 = new QLabel(horizontalLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));
        QSizePolicy sizePolicy2(QSizePolicy::Fixed, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(label_2->sizePolicy().hasHeightForWidth());
        label_2->setSizePolicy(sizePolicy2);

        gridLayout->addWidget(label_2, 0, 0, 1, 1);

        label_4 = new QLabel(horizontalLayoutWidget);
        label_4->setObjectName(QStringLiteral("label_4"));

        gridLayout->addWidget(label_4, 2, 0, 1, 1);

        doubleSpinVinc = new QDoubleSpinBox(horizontalLayoutWidget);
        doubleSpinVinc->setObjectName(QStringLiteral("doubleSpinVinc"));
        doubleSpinVinc->setMaximum(10);
        doubleSpinVinc->setSingleStep(0.01);
        doubleSpinVinc->setValue(0.1);

        gridLayout->addWidget(doubleSpinVinc, 2, 1, 1, 1);

        label_11 = new QLabel(horizontalLayoutWidget);
        label_11->setObjectName(QStringLiteral("label_11"));

        gridLayout->addWidget(label_11, 6, 0, 1, 1);

        spinPLotDecimation = new QSpinBox(horizontalLayoutWidget);
        spinPLotDecimation->setObjectName(QStringLiteral("spinPLotDecimation"));
        spinPLotDecimation->setMinimum(1);
        spinPLotDecimation->setMaximum(128);
        spinPLotDecimation->setValue(16);

        gridLayout->addWidget(spinPLotDecimation, 6, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);

        verticalSpacer_3 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout->addItem(verticalSpacer_3);

        pushRun = new QPushButton(horizontalLayoutWidget);
        pushRun->setObjectName(QStringLiteral("pushRun"));

        verticalLayout->addWidget(pushRun);

        pushSave = new QPushButton(horizontalLayoutWidget);
        pushSave->setObjectName(QStringLiteral("pushSave"));

        verticalLayout->addWidget(pushSave);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);


        horizontalLayout->addLayout(verticalLayout);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        label_12 = new QLabel(horizontalLayoutWidget);
        label_12->setObjectName(QStringLiteral("label_12"));
        QSizePolicy sizePolicy3(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(label_12->sizePolicy().hasHeightForWidth());
        label_12->setSizePolicy(sizePolicy3);
        label_12->setAlignment(Qt::AlignCenter);

        verticalLayout_3->addWidget(label_12);

        plotResultsMean = new QCustomPlot(horizontalLayoutWidget);
        plotResultsMean->setObjectName(QStringLiteral("plotResultsMean"));
        QSizePolicy sizePolicy4(QSizePolicy::Expanding, QSizePolicy::Minimum);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(plotResultsMean->sizePolicy().hasHeightForWidth());
        plotResultsMean->setSizePolicy(sizePolicy4);

        verticalLayout_3->addWidget(plotResultsMean);

        label_13 = new QLabel(horizontalLayoutWidget);
        label_13->setObjectName(QStringLiteral("label_13"));
        sizePolicy3.setHeightForWidth(label_13->sizePolicy().hasHeightForWidth());
        label_13->setSizePolicy(sizePolicy3);
        label_13->setAlignment(Qt::AlignCenter);

        verticalLayout_3->addWidget(label_13);

        plotResultsStd = new QCustomPlot(horizontalLayoutWidget);
        plotResultsStd->setObjectName(QStringLiteral("plotResultsStd"));

        verticalLayout_3->addWidget(plotResultsStd);


        horizontalLayout->addLayout(verticalLayout_3);


        retranslateUi(DialogLinearity);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogLinearity, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogLinearity, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogLinearity);
    } // setupUi

    void retranslateUi(QDialog *DialogLinearity)
    {
        DialogLinearity->setWindowTitle(QApplication::translate("DialogLinearity", "Linearity Test", 0));
        label->setText(QApplication::translate("DialogLinearity", "Scan settings", 0));
        label_5->setText(QApplication::translate("DialogLinearity", "V", 0));
        label_8->setText(QApplication::translate("DialogLinearity", "Measurement delay:", 0));
        label_9->setText(QApplication::translate("DialogLinearity", "ms", 0));
        label_7->setText(QApplication::translate("DialogLinearity", "V", 0));
        label_6->setText(QApplication::translate("DialogLinearity", "V", 0));
        label_10->setText(QApplication::translate("DialogLinearity", "Acqs/point:", 0));
        label_3->setText(QApplication::translate("DialogLinearity", "End LED voltage:", 0));
        label_2->setText(QApplication::translate("DialogLinearity", "Start LED voltage:", 0));
        label_4->setText(QApplication::translate("DialogLinearity", "Voltage increment:", 0));
        label_11->setText(QApplication::translate("DialogLinearity", "Plot decimation:", 0));
        pushRun->setText(QApplication::translate("DialogLinearity", "Run!", 0));
        pushSave->setText(QApplication::translate("DialogLinearity", "Save results...", 0));
        label_12->setText(QApplication::translate("DialogLinearity", "Signal mean", 0));
        label_13->setText(QApplication::translate("DialogLinearity", "Signal standard deviation", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogLinearity: public Ui_DialogLinearity {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGLINEARITY_H
