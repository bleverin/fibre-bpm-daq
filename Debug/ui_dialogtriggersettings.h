/********************************************************************************
** Form generated from reading UI file 'dialogtriggersettings.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGTRIGGERSETTINGS_H
#define UI_DIALOGTRIGGERSETTINGS_H

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
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogTriggerSettings
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *gridLayoutWidget;
    QGridLayout *gridLayout;
    QLabel *label_6;
    QLabel *label;
    QLineEdit *lineTintOK;
    QLineEdit *linePeriodUs;
    QLabel *label_4;
    QLineEdit *lineFreqKhz;
    QLineEdit *linePeriodOK;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label_5;
    QLineEdit *lineTintUs;
    QLabel *label_7;
    QLabel *label_8;
    QSpinBox *spinPeriodTicks;
    QSpinBox *spinTintTicks;
    QHBoxLayout *horizontalLayout;
    QRadioButton *radioLow;
    QRadioButton *radioHigh;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *DialogTriggerSettings)
    {
        if (DialogTriggerSettings->objectName().isEmpty())
            DialogTriggerSettings->setObjectName(QStringLiteral("DialogTriggerSettings"));
        DialogTriggerSettings->resize(443, 148);
        buttonBox = new QDialogButtonBox(DialogTriggerSettings);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(90, 110, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        gridLayoutWidget = new QWidget(DialogTriggerSettings);
        gridLayoutWidget->setObjectName(QStringLiteral("gridLayoutWidget"));
        gridLayoutWidget->setGeometry(QRect(10, 10, 417, 91));
        gridLayout = new QGridLayout(gridLayoutWidget);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        label_6 = new QLabel(gridLayoutWidget);
        label_6->setObjectName(QStringLiteral("label_6"));

        gridLayout->addWidget(label_6, 1, 2, 1, 1);

        label = new QLabel(gridLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        lineTintOK = new QLineEdit(gridLayoutWidget);
        lineTintOK->setObjectName(QStringLiteral("lineTintOK"));
        lineTintOK->setAlignment(Qt::AlignCenter);
        lineTintOK->setReadOnly(true);

        gridLayout->addWidget(lineTintOK, 1, 7, 1, 1);

        linePeriodUs = new QLineEdit(gridLayoutWidget);
        linePeriodUs->setObjectName(QStringLiteral("linePeriodUs"));
        linePeriodUs->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        linePeriodUs->setReadOnly(true);

        gridLayout->addWidget(linePeriodUs, 0, 3, 1, 1);

        label_4 = new QLabel(gridLayoutWidget);
        label_4->setObjectName(QStringLiteral("label_4"));

        gridLayout->addWidget(label_4, 0, 6, 1, 1);

        lineFreqKhz = new QLineEdit(gridLayoutWidget);
        lineFreqKhz->setObjectName(QStringLiteral("lineFreqKhz"));
        lineFreqKhz->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineFreqKhz->setReadOnly(true);

        gridLayout->addWidget(lineFreqKhz, 0, 5, 1, 1);

        linePeriodOK = new QLineEdit(gridLayoutWidget);
        linePeriodOK->setObjectName(QStringLiteral("linePeriodOK"));
        linePeriodOK->setAlignment(Qt::AlignCenter);
        linePeriodOK->setReadOnly(true);

        gridLayout->addWidget(linePeriodOK, 0, 7, 1, 1);

        label_2 = new QLabel(gridLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 1, 0, 1, 1);

        label_3 = new QLabel(gridLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        gridLayout->addWidget(label_3, 0, 4, 1, 1);

        label_5 = new QLabel(gridLayoutWidget);
        label_5->setObjectName(QStringLiteral("label_5"));

        gridLayout->addWidget(label_5, 0, 2, 1, 1);

        lineTintUs = new QLineEdit(gridLayoutWidget);
        lineTintUs->setObjectName(QStringLiteral("lineTintUs"));
        lineTintUs->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineTintUs->setReadOnly(true);

        gridLayout->addWidget(lineTintUs, 1, 3, 1, 1);

        label_7 = new QLabel(gridLayoutWidget);
        label_7->setObjectName(QStringLiteral("label_7"));

        gridLayout->addWidget(label_7, 1, 4, 1, 1);

        label_8 = new QLabel(gridLayoutWidget);
        label_8->setObjectName(QStringLiteral("label_8"));

        gridLayout->addWidget(label_8, 2, 0, 1, 1);

        spinPeriodTicks = new QSpinBox(gridLayoutWidget);
        spinPeriodTicks->setObjectName(QStringLiteral("spinPeriodTicks"));
        spinPeriodTicks->setMinimum(7500);
        spinPeriodTicks->setMaximum(65535);

        gridLayout->addWidget(spinPeriodTicks, 0, 1, 1, 1);

        spinTintTicks = new QSpinBox(gridLayoutWidget);
        spinTintTicks->setObjectName(QStringLiteral("spinTintTicks"));
        spinTintTicks->setMinimum(10);
        spinTintTicks->setMaximum(65535);

        gridLayout->addWidget(spinTintTicks, 1, 1, 1, 1);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        radioLow = new QRadioButton(gridLayoutWidget);
        buttonGroup = new QButtonGroup(DialogTriggerSettings);
        buttonGroup->setObjectName(QStringLiteral("buttonGroup"));
        buttonGroup->addButton(radioLow);
        radioLow->setObjectName(QStringLiteral("radioLow"));

        horizontalLayout->addWidget(radioLow);

        radioHigh = new QRadioButton(gridLayoutWidget);
        buttonGroup->addButton(radioHigh);
        radioHigh->setObjectName(QStringLiteral("radioHigh"));

        horizontalLayout->addWidget(radioHigh);


        gridLayout->addLayout(horizontalLayout, 2, 1, 1, 1);


        retranslateUi(DialogTriggerSettings);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogTriggerSettings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogTriggerSettings, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogTriggerSettings);
    } // setupUi

    void retranslateUi(QDialog *DialogTriggerSettings)
    {
        DialogTriggerSettings->setWindowTitle(QApplication::translate("DialogTriggerSettings", "Trigger configuration", 0));
        label_6->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label->setText(QApplication::translate("DialogTriggerSettings", "Period:", 0));
        label_4->setText(QApplication::translate("DialogTriggerSettings", "kHz", 0));
        label_2->setText(QApplication::translate("DialogTriggerSettings", "Tint:", 0));
        label_3->setText(QApplication::translate("DialogTriggerSettings", "us  =>", 0));
        label_5->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label_7->setText(QApplication::translate("DialogTriggerSettings", "us", 0));
        label_8->setText(QApplication::translate("DialogTriggerSettings", "Gain:", 0));
        radioLow->setText(QApplication::translate("DialogTriggerSettings", "Lo", 0));
        radioHigh->setText(QApplication::translate("DialogTriggerSettings", "Hi", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogTriggerSettings: public Ui_DialogTriggerSettings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGTRIGGERSETTINGS_H