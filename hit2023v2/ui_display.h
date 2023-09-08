/********************************************************************************
** Form generated from reading UI file 'display.ui'
**
** Created by: Qt User Interface Compiler version 6.5.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DISPLAY_H
#define UI_DISPLAY_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qcustomplot.h"

QT_BEGIN_NAMESPACE

class Ui_display
{
public:
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QLineEdit *lineTitle;
    QCustomPlot *plot;
    QHBoxLayout *horizontalLayout;
    QRadioButton *radioButtonAutoscale;
    QFrame *line;
    QRadioButton *radioButtonMaxScale;
    QFrame *line_2;
    QRadioButton *radioButtonFixedScale;
    QSpinBox *spinBox_fixedmin;
    QSpinBox *spinBox_fixedmax;
    QFrame *line_3;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout_2;
    QCheckBox *checkBox_expertmode;
    QCheckBox *checkBox_enablecalib;
    QPushButton *pushButton_loadcalib;
    QPushButton *pushButton_savecalib;
    QCheckBox *checkBox_subbkg;
    QPushButton *pushButton_loadbkg;
    QPushButton *pushButton_savebkg;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *display)
    {
        if (display->objectName().isEmpty())
            display->setObjectName("display");
        display->resize(609, 418);
        QSizePolicy sizePolicy(QSizePolicy::Maximum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(display->sizePolicy().hasHeightForWidth());
        display->setSizePolicy(sizePolicy);
        verticalLayoutWidget = new QWidget(display);
        verticalLayoutWidget->setObjectName("verticalLayoutWidget");
        verticalLayoutWidget->setGeometry(QRect(9, 10, 581, 341));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        lineTitle = new QLineEdit(verticalLayoutWidget);
        lineTitle->setObjectName("lineTitle");
        lineTitle->setFrame(false);
        lineTitle->setAlignment(Qt::AlignCenter);
        lineTitle->setReadOnly(true);

        verticalLayout->addWidget(lineTitle);

        plot = new QCustomPlot(verticalLayoutWidget);
        plot->setObjectName("plot");
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Expanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(plot->sizePolicy().hasHeightForWidth());
        plot->setSizePolicy(sizePolicy1);

        verticalLayout->addWidget(plot);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        radioButtonAutoscale = new QRadioButton(verticalLayoutWidget);
        buttonGroup = new QButtonGroup(display);
        buttonGroup->setObjectName("buttonGroup");
        buttonGroup->addButton(radioButtonAutoscale);
        radioButtonAutoscale->setObjectName("radioButtonAutoscale");

        horizontalLayout->addWidget(radioButtonAutoscale);

        line = new QFrame(verticalLayoutWidget);
        line->setObjectName("line");
        line->setFrameShape(QFrame::VLine);
        line->setFrameShadow(QFrame::Sunken);

        horizontalLayout->addWidget(line);

        radioButtonMaxScale = new QRadioButton(verticalLayoutWidget);
        buttonGroup->addButton(radioButtonMaxScale);
        radioButtonMaxScale->setObjectName("radioButtonMaxScale");

        horizontalLayout->addWidget(radioButtonMaxScale);

        line_2 = new QFrame(verticalLayoutWidget);
        line_2->setObjectName("line_2");
        line_2->setFrameShape(QFrame::VLine);
        line_2->setFrameShadow(QFrame::Sunken);

        horizontalLayout->addWidget(line_2);

        radioButtonFixedScale = new QRadioButton(verticalLayoutWidget);
        buttonGroup->addButton(radioButtonFixedScale);
        radioButtonFixedScale->setObjectName("radioButtonFixedScale");

        horizontalLayout->addWidget(radioButtonFixedScale);

        spinBox_fixedmin = new QSpinBox(verticalLayoutWidget);
        spinBox_fixedmin->setObjectName("spinBox_fixedmin");
        spinBox_fixedmin->setMinimum(-1000);
        spinBox_fixedmin->setMaximum(66000);
        spinBox_fixedmin->setSingleStep(100);
        spinBox_fixedmin->setValue(-1000);
        spinBox_fixedmin->setDisplayIntegerBase(10);

        horizontalLayout->addWidget(spinBox_fixedmin);

        spinBox_fixedmax = new QSpinBox(verticalLayoutWidget);
        spinBox_fixedmax->setObjectName("spinBox_fixedmax");
        spinBox_fixedmax->setMinimum(1000);
        spinBox_fixedmax->setMaximum(65000);
        spinBox_fixedmax->setSingleStep(100);
        spinBox_fixedmax->setValue(65000);

        horizontalLayout->addWidget(spinBox_fixedmax);


        verticalLayout->addLayout(horizontalLayout);

        line_3 = new QFrame(display);
        line_3->setObjectName("line_3");
        line_3->setGeometry(QRect(10, 350, 581, 20));
        QSizePolicy sizePolicy2(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(line_3->sizePolicy().hasHeightForWidth());
        line_3->setSizePolicy(sizePolicy2);
        line_3->setFrameShape(QFrame::HLine);
        line_3->setFrameShadow(QFrame::Sunken);
        horizontalLayoutWidget = new QWidget(display);
        horizontalLayoutWidget->setObjectName("horizontalLayoutWidget");
        horizontalLayoutWidget->setGeometry(QRect(10, 370, 581, 41));
        horizontalLayout_2 = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout_2->setObjectName("horizontalLayout_2");
        horizontalLayout_2->setContentsMargins(0, 0, 0, 0);
        checkBox_expertmode = new QCheckBox(horizontalLayoutWidget);
        checkBox_expertmode->setObjectName("checkBox_expertmode");

        horizontalLayout_2->addWidget(checkBox_expertmode);

        checkBox_enablecalib = new QCheckBox(horizontalLayoutWidget);
        checkBox_enablecalib->setObjectName("checkBox_enablecalib");

        horizontalLayout_2->addWidget(checkBox_enablecalib);

        pushButton_loadcalib = new QPushButton(horizontalLayoutWidget);
        pushButton_loadcalib->setObjectName("pushButton_loadcalib");

        horizontalLayout_2->addWidget(pushButton_loadcalib);

        pushButton_savecalib = new QPushButton(horizontalLayoutWidget);
        pushButton_savecalib->setObjectName("pushButton_savecalib");
        pushButton_savecalib->setEnabled(false);

        horizontalLayout_2->addWidget(pushButton_savecalib);

        checkBox_subbkg = new QCheckBox(horizontalLayoutWidget);
        checkBox_subbkg->setObjectName("checkBox_subbkg");

        horizontalLayout_2->addWidget(checkBox_subbkg);

        pushButton_loadbkg = new QPushButton(horizontalLayoutWidget);
        pushButton_loadbkg->setObjectName("pushButton_loadbkg");

        horizontalLayout_2->addWidget(pushButton_loadbkg);

        pushButton_savebkg = new QPushButton(horizontalLayoutWidget);
        pushButton_savebkg->setObjectName("pushButton_savebkg");
        pushButton_savebkg->setEnabled(false);

        horizontalLayout_2->addWidget(pushButton_savebkg);


        retranslateUi(display);

        QMetaObject::connectSlotsByName(display);
    } // setupUi

    void retranslateUi(QDialog *display)
    {
        display->setWindowTitle(QCoreApplication::translate("display", "Online Display", nullptr));
        radioButtonAutoscale->setText(QCoreApplication::translate("display", "Auto Y-Scale", nullptr));
        radioButtonMaxScale->setText(QCoreApplication::translate("display", "Max Y-Scale", nullptr));
        radioButtonFixedScale->setText(QCoreApplication::translate("display", "Fixed Y-Scale", nullptr));
        checkBox_expertmode->setText(QCoreApplication::translate("display", "expert\n"
"mode", nullptr));
        checkBox_enablecalib->setText(QCoreApplication::translate("display", "enable\n"
"calibration", nullptr));
        pushButton_loadcalib->setText(QCoreApplication::translate("display", "Load calib", nullptr));
        pushButton_savecalib->setText(QCoreApplication::translate("display", "save calib", nullptr));
        checkBox_subbkg->setText(QCoreApplication::translate("display", "sub bkg", nullptr));
        pushButton_loadbkg->setText(QCoreApplication::translate("display", "load bkg", nullptr));
        pushButton_savebkg->setText(QCoreApplication::translate("display", "save bkg", nullptr));
    } // retranslateUi

};

namespace Ui {
    class display: public Ui_display {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DISPLAY_H
