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
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogTriggerSettings
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QLabel *label_9;
    QGridLayout *gridLayout;
    QLabel *label_6;
    QLabel *label;
    QLineEdit *lineTintOK;
    QLineEdit *linePeriodOK;
    QLineEdit *lineFreqKhz;
    QLabel *label_4;
    QLineEdit *linePeriodUs;
    QLabel *label_2;
    QLineEdit *lineTintUs;
    QLabel *label_7;
    QLabel *label_3;
    QLabel *label_5;
    QSpinBox *spinPeriodTicks;
    QLabel *label_8;
    QSpinBox *spinTintTicks;
    QHBoxLayout *horizontalLayout;
    QRadioButton *radioLow;
    QRadioButton *radioHigh;
    QLabel *label_10;
    QGridLayout *gridLayout_3;
    QLabel *label_12;
    QLabel *label_13;
    QLineEdit *lineTintOK_v2;
    QLineEdit *linePeriodOK_v2;
    QLineEdit *lineFreqKhz_v2;
    QLabel *label_14;
    QLineEdit *linePeriodUs_v2;
    QLabel *label_15;
    QLineEdit *lineTintUs_v2;
    QLabel *label_16;
    QLabel *label_17;
    QLabel *label_18;
    QSpinBox *spinPeriodTicks_v2;
    QLabel *label_19;
    QSpinBox *spinTintTicks_v2;
    QHBoxLayout *horizontalLayout_2;
    QRadioButton *radioLow_v2;
    QRadioButton *radioHigh_v2;
    QButtonGroup *buttonGroup_2;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *DialogTriggerSettings)
    {
        if (DialogTriggerSettings->objectName().isEmpty())
            DialogTriggerSettings->setObjectName(QStringLiteral("DialogTriggerSettings"));
        DialogTriggerSettings->resize(443, 281);
        buttonBox = new QDialogButtonBox(DialogTriggerSettings);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(90, 240, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        verticalLayoutWidget = new QWidget(DialogTriggerSettings);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(10, 10, 421, 221));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        label_9 = new QLabel(verticalLayoutWidget);
        label_9->setObjectName(QStringLiteral("label_9"));
        label_9->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(label_9);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        label_6 = new QLabel(verticalLayoutWidget);
        label_6->setObjectName(QStringLiteral("label_6"));

        gridLayout->addWidget(label_6, 1, 2, 1, 1);

        label = new QLabel(verticalLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        lineTintOK = new QLineEdit(verticalLayoutWidget);
        lineTintOK->setObjectName(QStringLiteral("lineTintOK"));
        lineTintOK->setAlignment(Qt::AlignCenter);
        lineTintOK->setReadOnly(true);

        gridLayout->addWidget(lineTintOK, 1, 7, 1, 1);

        linePeriodOK = new QLineEdit(verticalLayoutWidget);
        linePeriodOK->setObjectName(QStringLiteral("linePeriodOK"));
        linePeriodOK->setAlignment(Qt::AlignCenter);
        linePeriodOK->setReadOnly(true);

        gridLayout->addWidget(linePeriodOK, 0, 7, 1, 1);

        lineFreqKhz = new QLineEdit(verticalLayoutWidget);
        lineFreqKhz->setObjectName(QStringLiteral("lineFreqKhz"));
        lineFreqKhz->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineFreqKhz->setReadOnly(true);

        gridLayout->addWidget(lineFreqKhz, 0, 5, 1, 1);

        label_4 = new QLabel(verticalLayoutWidget);
        label_4->setObjectName(QStringLiteral("label_4"));

        gridLayout->addWidget(label_4, 0, 6, 1, 1);

        linePeriodUs = new QLineEdit(verticalLayoutWidget);
        linePeriodUs->setObjectName(QStringLiteral("linePeriodUs"));
        linePeriodUs->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        linePeriodUs->setReadOnly(true);

        gridLayout->addWidget(linePeriodUs, 0, 3, 1, 1);

        label_2 = new QLabel(verticalLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 1, 0, 1, 1);

        lineTintUs = new QLineEdit(verticalLayoutWidget);
        lineTintUs->setObjectName(QStringLiteral("lineTintUs"));
        lineTintUs->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineTintUs->setReadOnly(true);

        gridLayout->addWidget(lineTintUs, 1, 3, 1, 1);

        label_7 = new QLabel(verticalLayoutWidget);
        label_7->setObjectName(QStringLiteral("label_7"));

        gridLayout->addWidget(label_7, 1, 4, 1, 1);

        label_3 = new QLabel(verticalLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        gridLayout->addWidget(label_3, 0, 4, 1, 1);

        label_5 = new QLabel(verticalLayoutWidget);
        label_5->setObjectName(QStringLiteral("label_5"));

        gridLayout->addWidget(label_5, 0, 2, 1, 1);

        spinPeriodTicks = new QSpinBox(verticalLayoutWidget);
        spinPeriodTicks->setObjectName(QStringLiteral("spinPeriodTicks"));
        spinPeriodTicks->setMinimum(8000);
        spinPeriodTicks->setMaximum(65535);

        gridLayout->addWidget(spinPeriodTicks, 0, 1, 1, 1);

        label_8 = new QLabel(verticalLayoutWidget);
        label_8->setObjectName(QStringLiteral("label_8"));

        gridLayout->addWidget(label_8, 2, 0, 1, 1);

        spinTintTicks = new QSpinBox(verticalLayoutWidget);
        spinTintTicks->setObjectName(QStringLiteral("spinTintTicks"));
        spinTintTicks->setMinimum(10);
        spinTintTicks->setMaximum(65535);

        gridLayout->addWidget(spinTintTicks, 1, 1, 1, 1);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        radioLow = new QRadioButton(verticalLayoutWidget);
        buttonGroup_2 = new QButtonGroup(DialogTriggerSettings);
        buttonGroup_2->setObjectName(QStringLiteral("buttonGroup_2"));
        buttonGroup_2->addButton(radioLow);
        radioLow->setObjectName(QStringLiteral("radioLow"));

        horizontalLayout->addWidget(radioLow);

        radioHigh = new QRadioButton(verticalLayoutWidget);
        buttonGroup_2->addButton(radioHigh);
        radioHigh->setObjectName(QStringLiteral("radioHigh"));

        horizontalLayout->addWidget(radioHigh);


        gridLayout->addLayout(horizontalLayout, 2, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);

        label_10 = new QLabel(verticalLayoutWidget);
        label_10->setObjectName(QStringLiteral("label_10"));
        label_10->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(label_10);

        gridLayout_3 = new QGridLayout();
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        label_12 = new QLabel(verticalLayoutWidget);
        label_12->setObjectName(QStringLiteral("label_12"));

        gridLayout_3->addWidget(label_12, 1, 2, 1, 1);

        label_13 = new QLabel(verticalLayoutWidget);
        label_13->setObjectName(QStringLiteral("label_13"));

        gridLayout_3->addWidget(label_13, 0, 0, 1, 1);

        lineTintOK_v2 = new QLineEdit(verticalLayoutWidget);
        lineTintOK_v2->setObjectName(QStringLiteral("lineTintOK_v2"));
        lineTintOK_v2->setAlignment(Qt::AlignCenter);
        lineTintOK_v2->setReadOnly(true);

        gridLayout_3->addWidget(lineTintOK_v2, 1, 7, 1, 1);

        linePeriodOK_v2 = new QLineEdit(verticalLayoutWidget);
        linePeriodOK_v2->setObjectName(QStringLiteral("linePeriodOK_v2"));
        linePeriodOK_v2->setAlignment(Qt::AlignCenter);
        linePeriodOK_v2->setReadOnly(true);

        gridLayout_3->addWidget(linePeriodOK_v2, 0, 7, 1, 1);

        lineFreqKhz_v2 = new QLineEdit(verticalLayoutWidget);
        lineFreqKhz_v2->setObjectName(QStringLiteral("lineFreqKhz_v2"));
        lineFreqKhz_v2->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineFreqKhz_v2->setReadOnly(true);

        gridLayout_3->addWidget(lineFreqKhz_v2, 0, 5, 1, 1);

        label_14 = new QLabel(verticalLayoutWidget);
        label_14->setObjectName(QStringLiteral("label_14"));

        gridLayout_3->addWidget(label_14, 0, 6, 1, 1);

        linePeriodUs_v2 = new QLineEdit(verticalLayoutWidget);
        linePeriodUs_v2->setObjectName(QStringLiteral("linePeriodUs_v2"));
        linePeriodUs_v2->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        linePeriodUs_v2->setReadOnly(true);

        gridLayout_3->addWidget(linePeriodUs_v2, 0, 3, 1, 1);

        label_15 = new QLabel(verticalLayoutWidget);
        label_15->setObjectName(QStringLiteral("label_15"));

        gridLayout_3->addWidget(label_15, 1, 0, 1, 1);

        lineTintUs_v2 = new QLineEdit(verticalLayoutWidget);
        lineTintUs_v2->setObjectName(QStringLiteral("lineTintUs_v2"));
        lineTintUs_v2->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        lineTintUs_v2->setReadOnly(true);

        gridLayout_3->addWidget(lineTintUs_v2, 1, 3, 1, 1);

        label_16 = new QLabel(verticalLayoutWidget);
        label_16->setObjectName(QStringLiteral("label_16"));

        gridLayout_3->addWidget(label_16, 1, 4, 1, 1);

        label_17 = new QLabel(verticalLayoutWidget);
        label_17->setObjectName(QStringLiteral("label_17"));

        gridLayout_3->addWidget(label_17, 0, 4, 1, 1);

        label_18 = new QLabel(verticalLayoutWidget);
        label_18->setObjectName(QStringLiteral("label_18"));

        gridLayout_3->addWidget(label_18, 0, 2, 1, 1);

        spinPeriodTicks_v2 = new QSpinBox(verticalLayoutWidget);
        spinPeriodTicks_v2->setObjectName(QStringLiteral("spinPeriodTicks_v2"));
        spinPeriodTicks_v2->setMinimum(2000);
        spinPeriodTicks_v2->setMaximum(65535);

        gridLayout_3->addWidget(spinPeriodTicks_v2, 0, 1, 1, 1);

        label_19 = new QLabel(verticalLayoutWidget);
        label_19->setObjectName(QStringLiteral("label_19"));

        gridLayout_3->addWidget(label_19, 2, 0, 1, 1);

        spinTintTicks_v2 = new QSpinBox(verticalLayoutWidget);
        spinTintTicks_v2->setObjectName(QStringLiteral("spinTintTicks_v2"));
        spinTintTicks_v2->setMinimum(10);
        spinTintTicks_v2->setMaximum(65535);

        gridLayout_3->addWidget(spinTintTicks_v2, 1, 1, 1, 1);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        radioLow_v2 = new QRadioButton(verticalLayoutWidget);
        buttonGroup = new QButtonGroup(DialogTriggerSettings);
        buttonGroup->setObjectName(QStringLiteral("buttonGroup"));
        buttonGroup->addButton(radioLow_v2);
        radioLow_v2->setObjectName(QStringLiteral("radioLow_v2"));

        horizontalLayout_2->addWidget(radioLow_v2);

        radioHigh_v2 = new QRadioButton(verticalLayoutWidget);
        buttonGroup->addButton(radioHigh_v2);
        radioHigh_v2->setObjectName(QStringLiteral("radioHigh_v2"));

        horizontalLayout_2->addWidget(radioHigh_v2);


        gridLayout_3->addLayout(horizontalLayout_2, 2, 1, 1, 1);


        verticalLayout->addLayout(gridLayout_3);


        retranslateUi(DialogTriggerSettings);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogTriggerSettings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogTriggerSettings, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogTriggerSettings);
    } // setupUi

    void retranslateUi(QDialog *DialogTriggerSettings)
    {
        DialogTriggerSettings->setWindowTitle(QApplication::translate("DialogTriggerSettings", "Trigger configuration", 0));
        label_9->setText(QApplication::translate("DialogTriggerSettings", "Hardware v.1", 0));
        label_6->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label->setText(QApplication::translate("DialogTriggerSettings", "Period:", 0));
        label_4->setText(QApplication::translate("DialogTriggerSettings", "kHz", 0));
        label_2->setText(QApplication::translate("DialogTriggerSettings", "Tint:", 0));
        label_7->setText(QApplication::translate("DialogTriggerSettings", "us", 0));
        label_3->setText(QApplication::translate("DialogTriggerSettings", "us  =>", 0));
        label_5->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label_8->setText(QApplication::translate("DialogTriggerSettings", "Gain:", 0));
        radioLow->setText(QApplication::translate("DialogTriggerSettings", "Lo", 0));
        radioHigh->setText(QApplication::translate("DialogTriggerSettings", "Hi", 0));
        label_10->setText(QApplication::translate("DialogTriggerSettings", "Harware v.2", 0));
        label_12->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label_13->setText(QApplication::translate("DialogTriggerSettings", "Period:", 0));
        label_14->setText(QApplication::translate("DialogTriggerSettings", "kHz", 0));
        label_15->setText(QApplication::translate("DialogTriggerSettings", "Tint:", 0));
        label_16->setText(QApplication::translate("DialogTriggerSettings", "us", 0));
        label_17->setText(QApplication::translate("DialogTriggerSettings", "us  =>", 0));
        label_18->setText(QApplication::translate("DialogTriggerSettings", "=", 0));
        label_19->setText(QApplication::translate("DialogTriggerSettings", "Gain:", 0));
        radioLow_v2->setText(QApplication::translate("DialogTriggerSettings", "Lo", 0));
        radioHigh_v2->setText(QApplication::translate("DialogTriggerSettings", "Hi", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogTriggerSettings: public Ui_DialogTriggerSettings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGTRIGGERSETTINGS_H
