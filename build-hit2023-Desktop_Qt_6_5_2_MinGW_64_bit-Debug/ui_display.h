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
    QCustomPlot *plot;
    QLineEdit *lineTitle;
    QHBoxLayout *horizontalLayout;
    QRadioButton *radioButtonMaxScale;
    QFrame *line;
    QRadioButton *radioButtonAutoscale;
    QFrame *line_2;
    QRadioButton *radioButtonFixedScale;
    QSpinBox *spinBox_fixedmin;
    QSpinBox *spinBox_fixedmax;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *display)
    {
        if (display->objectName().isEmpty())
            display->setObjectName("display");
        display->resize(603, 392);
        QPalette palette;
        QBrush brush(QColor(255, 255, 255, 255));
        brush.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Button, brush);
        QBrush brush1(QColor(221, 221, 221, 255));
        brush1.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Midlight, brush1);
        QBrush brush2(QColor(85, 85, 255, 255));
        brush2.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Highlight, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::Highlight, brush2);
        display->setPalette(palette);
        verticalLayoutWidget = new QWidget(display);
        verticalLayoutWidget->setObjectName("verticalLayoutWidget");
        verticalLayoutWidget->setGeometry(QRect(10, 10, 581, 371));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        plot = new QCustomPlot(verticalLayoutWidget);
        plot->setObjectName("plot");
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(plot->sizePolicy().hasHeightForWidth());
        plot->setSizePolicy(sizePolicy);
        lineTitle = new QLineEdit(plot);
        lineTitle->setObjectName("lineTitle");
        lineTitle->setGeometry(QRect(230, 0, 106, 22));
        QSizePolicy sizePolicy1(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(lineTitle->sizePolicy().hasHeightForWidth());
        lineTitle->setSizePolicy(sizePolicy1);
        lineTitle->setFrame(false);
        lineTitle->setAlignment(Qt::AlignCenter);
        lineTitle->setReadOnly(true);

        verticalLayout->addWidget(plot);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        radioButtonMaxScale = new QRadioButton(verticalLayoutWidget);
        buttonGroup = new QButtonGroup(display);
        buttonGroup->setObjectName("buttonGroup");
        buttonGroup->addButton(radioButtonMaxScale);
        radioButtonMaxScale->setObjectName("radioButtonMaxScale");
        radioButtonMaxScale->setEnabled(true);
        radioButtonMaxScale->setMouseTracking(false);
        radioButtonMaxScale->setIconSize(QSize(25, 25));
        radioButtonMaxScale->setChecked(true);
        radioButtonMaxScale->setAutoExclusive(false);

        horizontalLayout->addWidget(radioButtonMaxScale);

        line = new QFrame(verticalLayoutWidget);
        line->setObjectName("line");
        line->setFrameShape(QFrame::VLine);
        line->setFrameShadow(QFrame::Sunken);

        horizontalLayout->addWidget(line);

        radioButtonAutoscale = new QRadioButton(verticalLayoutWidget);
        buttonGroup->addButton(radioButtonAutoscale);
        radioButtonAutoscale->setObjectName("radioButtonAutoscale");
        radioButtonAutoscale->setEnabled(true);
        radioButtonAutoscale->setMouseTracking(false);
        radioButtonAutoscale->setIconSize(QSize(25, 25));
        radioButtonAutoscale->setChecked(false);
        radioButtonAutoscale->setAutoExclusive(false);

        horizontalLayout->addWidget(radioButtonAutoscale);

        line_2 = new QFrame(verticalLayoutWidget);
        line_2->setObjectName("line_2");
        line_2->setFrameShape(QFrame::VLine);
        line_2->setFrameShadow(QFrame::Sunken);

        horizontalLayout->addWidget(line_2);

        radioButtonFixedScale = new QRadioButton(verticalLayoutWidget);
        buttonGroup->addButton(radioButtonFixedScale);
        radioButtonFixedScale->setObjectName("radioButtonFixedScale");
        radioButtonFixedScale->setMouseTracking(false);
        radioButtonFixedScale->setText(QString::fromUtf8("Fixed Scale"));
        radioButtonFixedScale->setIconSize(QSize(25, 25));
        radioButtonFixedScale->setChecked(false);
        radioButtonFixedScale->setAutoExclusive(false);

        horizontalLayout->addWidget(radioButtonFixedScale);

        spinBox_fixedmin = new QSpinBox(verticalLayoutWidget);
        spinBox_fixedmin->setObjectName("spinBox_fixedmin");
        spinBox_fixedmin->setMinimum(-2000);
        spinBox_fixedmin->setMaximum(60000);
        spinBox_fixedmin->setSingleStep(100);
        spinBox_fixedmin->setValue(-2000);

        horizontalLayout->addWidget(spinBox_fixedmin);

        spinBox_fixedmax = new QSpinBox(verticalLayoutWidget);
        spinBox_fixedmax->setObjectName("spinBox_fixedmax");
        spinBox_fixedmax->setMouseTracking(true);
        spinBox_fixedmax->setAutoFillBackground(true);
        spinBox_fixedmax->setAccelerated(true);
        spinBox_fixedmax->setMinimum(2000);
        spinBox_fixedmax->setMaximum(65000);
        spinBox_fixedmax->setSingleStep(100);
        spinBox_fixedmax->setValue(20000);

        horizontalLayout->addWidget(spinBox_fixedmax);


        verticalLayout->addLayout(horizontalLayout);

        QWidget::setTabOrder(radioButtonFixedScale, spinBox_fixedmin);
        QWidget::setTabOrder(spinBox_fixedmin, spinBox_fixedmax);

        retranslateUi(display);

        QMetaObject::connectSlotsByName(display);
    } // setupUi

    void retranslateUi(QDialog *display)
    {
        display->setWindowTitle(QCoreApplication::translate("display", "Online Display", nullptr));
        radioButtonMaxScale->setText(QCoreApplication::translate("display", "Max Scale", nullptr));
        radioButtonAutoscale->setText(QCoreApplication::translate("display", "Auto-Scale", nullptr));
    } // retranslateUi

};

namespace Ui {
    class display: public Ui_display {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DISPLAY_H
