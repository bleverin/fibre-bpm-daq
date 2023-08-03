/********************************************************************************
** Form generated from reading UI file 'dialogprofiler.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGPROFILER_H
#define UI_DIALOGPROFILER_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qcustomplot.h"

QT_BEGIN_NAMESPACE

class Ui_DialogProfiler
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QGridLayout *gridLayout;
    QLabel *label_10;
    QSpinBox *spinAcquisitions;
    QLabel *label_11;
    QSpinBox *spinRuns;
    QSpacerItem *verticalSpacer_3;
    QPushButton *pushRun;
    QPushButton *pushRunOnce;
    QPushButton *pushRunInfinite;
    QSpacerItem *verticalSpacer_2;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label_2;
    QLineEdit *lineRunsDone;
    QPushButton *pushClear;
    QPushButton *pushSave;
    QSpacerItem *verticalSpacer;
    QVBoxLayout *verticalLayout_3;
    QLabel *label_12;
    QCustomPlot *plotResultsMean;
    QLabel *label_13;
    QCustomPlot *plotResultsStd;

    void setupUi(QDialog *DialogProfiler)
    {
        if (DialogProfiler->objectName().isEmpty())
            DialogProfiler->setObjectName(QStringLiteral("DialogProfiler"));
        DialogProfiler->resize(844, 632);
        buttonBox = new QDialogButtonBox(DialogProfiler);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(490, 590, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Close);
        horizontalLayoutWidget = new QWidget(DialogProfiler);
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
        label_10 = new QLabel(horizontalLayoutWidget);
        label_10->setObjectName(QStringLiteral("label_10"));

        gridLayout->addWidget(label_10, 0, 0, 1, 1);

        spinAcquisitions = new QSpinBox(horizontalLayoutWidget);
        spinAcquisitions->setObjectName(QStringLiteral("spinAcquisitions"));
        spinAcquisitions->setMinimum(1);
        spinAcquisitions->setMaximum(1000000);
        spinAcquisitions->setSingleStep(1000);
        spinAcquisitions->setValue(1000);

        gridLayout->addWidget(spinAcquisitions, 0, 1, 1, 1);

        label_11 = new QLabel(horizontalLayoutWidget);
        label_11->setObjectName(QStringLiteral("label_11"));

        gridLayout->addWidget(label_11, 1, 0, 1, 1);

        spinRuns = new QSpinBox(horizontalLayoutWidget);
        spinRuns->setObjectName(QStringLiteral("spinRuns"));
        spinRuns->setMinimum(1);
        spinRuns->setMaximum(128);
        spinRuns->setValue(16);

        gridLayout->addWidget(spinRuns, 1, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);

        verticalSpacer_3 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout->addItem(verticalSpacer_3);

        pushRun = new QPushButton(horizontalLayoutWidget);
        pushRun->setObjectName(QStringLiteral("pushRun"));

        verticalLayout->addWidget(pushRun);

        pushRunOnce = new QPushButton(horizontalLayoutWidget);
        pushRunOnce->setObjectName(QStringLiteral("pushRunOnce"));

        verticalLayout->addWidget(pushRunOnce);

        pushRunInfinite = new QPushButton(horizontalLayoutWidget);
        pushRunInfinite->setObjectName(QStringLiteral("pushRunInfinite"));

        verticalLayout->addWidget(pushRunInfinite);

        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout->addItem(verticalSpacer_2);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        horizontalLayout_2->setContentsMargins(-1, -1, -1, 0);
        label_2 = new QLabel(horizontalLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        horizontalLayout_2->addWidget(label_2);

        lineRunsDone = new QLineEdit(horizontalLayoutWidget);
        lineRunsDone->setObjectName(QStringLiteral("lineRunsDone"));
        sizePolicy.setHeightForWidth(lineRunsDone->sizePolicy().hasHeightForWidth());
        lineRunsDone->setSizePolicy(sizePolicy);
        lineRunsDone->setAutoFillBackground(false);
        lineRunsDone->setReadOnly(true);

        horizontalLayout_2->addWidget(lineRunsDone);


        verticalLayout->addLayout(horizontalLayout_2);

        pushClear = new QPushButton(horizontalLayoutWidget);
        pushClear->setObjectName(QStringLiteral("pushClear"));

        verticalLayout->addWidget(pushClear);

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
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(label_12->sizePolicy().hasHeightForWidth());
        label_12->setSizePolicy(sizePolicy1);
        label_12->setAlignment(Qt::AlignCenter);

        verticalLayout_3->addWidget(label_12);

        plotResultsMean = new QCustomPlot(horizontalLayoutWidget);
        plotResultsMean->setObjectName(QStringLiteral("plotResultsMean"));
        QSizePolicy sizePolicy2(QSizePolicy::Expanding, QSizePolicy::Minimum);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(plotResultsMean->sizePolicy().hasHeightForWidth());
        plotResultsMean->setSizePolicy(sizePolicy2);

        verticalLayout_3->addWidget(plotResultsMean);

        label_13 = new QLabel(horizontalLayoutWidget);
        label_13->setObjectName(QStringLiteral("label_13"));
        sizePolicy1.setHeightForWidth(label_13->sizePolicy().hasHeightForWidth());
        label_13->setSizePolicy(sizePolicy1);
        label_13->setAlignment(Qt::AlignCenter);

        verticalLayout_3->addWidget(label_13);

        plotResultsStd = new QCustomPlot(horizontalLayoutWidget);
        plotResultsStd->setObjectName(QStringLiteral("plotResultsStd"));

        verticalLayout_3->addWidget(plotResultsStd);


        horizontalLayout->addLayout(verticalLayout_3);


        retranslateUi(DialogProfiler);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogProfiler, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogProfiler, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogProfiler);
    } // setupUi

    void retranslateUi(QDialog *DialogProfiler)
    {
        DialogProfiler->setWindowTitle(QApplication::translate("DialogProfiler", "Profile Viewer", 0));
        label->setText(QApplication::translate("DialogProfiler", "Scan settings", 0));
        label_10->setText(QApplication::translate("DialogProfiler", "Acqs/run:", 0));
        label_11->setText(QApplication::translate("DialogProfiler", "Nr runs:", 0));
        pushRun->setText(QApplication::translate("DialogProfiler", "Run!", 0));
        pushRunOnce->setText(QApplication::translate("DialogProfiler", "Run once!", 0));
        pushRunInfinite->setText(QApplication::translate("DialogProfiler", "Run infinite!", 0));
        label_2->setText(QApplication::translate("DialogProfiler", "Runs:", 0));
        pushClear->setText(QApplication::translate("DialogProfiler", "Clear", 0));
        pushSave->setText(QApplication::translate("DialogProfiler", "Save results...", 0));
        label_12->setText(QApplication::translate("DialogProfiler", "Signal mean", 0));
        label_13->setText(QApplication::translate("DialogProfiler", "Signal standard deviation", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogProfiler: public Ui_DialogProfiler {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGPROFILER_H
