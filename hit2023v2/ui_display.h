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
    QPushButton *pushButton_savebkg;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *display)
    {
        if (display->objectName().isEmpty())
            display->setObjectName("display");
        display->resize(602, 390);
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
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(plot->sizePolicy().hasHeightForWidth());
        plot->setSizePolicy(sizePolicy);

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

        pushButton_savebkg = new QPushButton(display);
        pushButton_savebkg->setObjectName("pushButton_savebkg");
        pushButton_savebkg->setGeometry(QRect(510, 360, 80, 24));

        retranslateUi(display);

        QMetaObject::connectSlotsByName(display);
    } // setupUi

    void retranslateUi(QDialog *display)
    {
        display->setWindowTitle(QCoreApplication::translate("display", "Online Display", nullptr));
        radioButtonAutoscale->setText(QCoreApplication::translate("display", "Auto Y-Scale", nullptr));
        radioButtonMaxScale->setText(QCoreApplication::translate("display", "Max Y-Scale", nullptr));
        radioButtonFixedScale->setText(QCoreApplication::translate("display", "Fixed Y-Scale", nullptr));
        pushButton_savebkg->setText(QCoreApplication::translate("display", "save bkg", nullptr));
    } // retranslateUi

};

namespace Ui {
    class display: public Ui_display {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DISPLAY_H
