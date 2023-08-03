/********************************************************************************
** Form generated from reading UI file 'dialoglogsettings.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGLOGSETTINGS_H
#define UI_DIALOGLOGSETTINGS_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogLogSettings
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *gridLayoutWidget;
    QGridLayout *gridLayout;
    QLabel *label_3;
    QLabel *label_4;
    QLabel *label_6;
    QLabel *label;
    QLabel *label_7;
    QLabel *label_5;
    QLabel *label_2;
    QLabel *label_8;
    QCheckBox *checkDisplayDebug;
    QCheckBox *checkDetailsDebug;
    QCheckBox *checkDisplayInfo;
    QCheckBox *checkDetailsInfo;
    QCheckBox *checkDisplayWarning;
    QCheckBox *checkDetailsWarning;
    QCheckBox *checkDisplayCritical;
    QCheckBox *checkDetailsCritical;
    QCheckBox *checkDisplayFatal;
    QCheckBox *checkDetailsFatal;
    QButtonGroup *buttonGroup;

    void setupUi(QDialog *DialogLogSettings)
    {
        if (DialogLogSettings->objectName().isEmpty())
            DialogLogSettings->setObjectName(QStringLiteral("DialogLogSettings"));
        DialogLogSettings->resize(284, 239);
        buttonBox = new QDialogButtonBox(DialogLogSettings);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(80, 190, 181, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        gridLayoutWidget = new QWidget(DialogLogSettings);
        gridLayoutWidget->setObjectName(QStringLiteral("gridLayoutWidget"));
        gridLayoutWidget->setGeometry(QRect(20, 20, 241, 161));
        gridLayout = new QGridLayout(gridLayoutWidget);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        label_3 = new QLabel(gridLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        gridLayout->addWidget(label_3, 0, 2, 1, 1);

        label_4 = new QLabel(gridLayoutWidget);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label_4, 1, 0, 1, 1);

        label_6 = new QLabel(gridLayoutWidget);
        label_6->setObjectName(QStringLiteral("label_6"));
        label_6->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label_6, 3, 0, 1, 1);

        label = new QLabel(gridLayoutWidget);
        label->setObjectName(QStringLiteral("label"));
        label->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label, 0, 0, 1, 1);

        label_7 = new QLabel(gridLayoutWidget);
        label_7->setObjectName(QStringLiteral("label_7"));
        label_7->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label_7, 4, 0, 1, 1);

        label_5 = new QLabel(gridLayoutWidget);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label_5, 2, 0, 1, 1);

        label_2 = new QLabel(gridLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 0, 1, 1, 1);

        label_8 = new QLabel(gridLayoutWidget);
        label_8->setObjectName(QStringLiteral("label_8"));
        label_8->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(label_8, 5, 0, 1, 1);

        checkDisplayDebug = new QCheckBox(gridLayoutWidget);
        buttonGroup = new QButtonGroup(DialogLogSettings);
        buttonGroup->setObjectName(QStringLiteral("buttonGroup"));
        buttonGroup->setExclusive(false);
        buttonGroup->addButton(checkDisplayDebug);
        checkDisplayDebug->setObjectName(QStringLiteral("checkDisplayDebug"));
        QSizePolicy sizePolicy(QSizePolicy::Maximum, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(checkDisplayDebug->sizePolicy().hasHeightForWidth());
        checkDisplayDebug->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDisplayDebug, 1, 1, 1, 1);

        checkDetailsDebug = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDetailsDebug);
        checkDetailsDebug->setObjectName(QStringLiteral("checkDetailsDebug"));
        sizePolicy.setHeightForWidth(checkDetailsDebug->sizePolicy().hasHeightForWidth());
        checkDetailsDebug->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDetailsDebug, 1, 2, 1, 1);

        checkDisplayInfo = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDisplayInfo);
        checkDisplayInfo->setObjectName(QStringLiteral("checkDisplayInfo"));
        sizePolicy.setHeightForWidth(checkDisplayInfo->sizePolicy().hasHeightForWidth());
        checkDisplayInfo->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDisplayInfo, 2, 1, 1, 1);

        checkDetailsInfo = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDetailsInfo);
        checkDetailsInfo->setObjectName(QStringLiteral("checkDetailsInfo"));
        sizePolicy.setHeightForWidth(checkDetailsInfo->sizePolicy().hasHeightForWidth());
        checkDetailsInfo->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDetailsInfo, 2, 2, 1, 1);

        checkDisplayWarning = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDisplayWarning);
        checkDisplayWarning->setObjectName(QStringLiteral("checkDisplayWarning"));
        sizePolicy.setHeightForWidth(checkDisplayWarning->sizePolicy().hasHeightForWidth());
        checkDisplayWarning->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDisplayWarning, 3, 1, 1, 1);

        checkDetailsWarning = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDetailsWarning);
        checkDetailsWarning->setObjectName(QStringLiteral("checkDetailsWarning"));
        sizePolicy.setHeightForWidth(checkDetailsWarning->sizePolicy().hasHeightForWidth());
        checkDetailsWarning->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDetailsWarning, 3, 2, 1, 1);

        checkDisplayCritical = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDisplayCritical);
        checkDisplayCritical->setObjectName(QStringLiteral("checkDisplayCritical"));
        sizePolicy.setHeightForWidth(checkDisplayCritical->sizePolicy().hasHeightForWidth());
        checkDisplayCritical->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDisplayCritical, 4, 1, 1, 1);

        checkDetailsCritical = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDetailsCritical);
        checkDetailsCritical->setObjectName(QStringLiteral("checkDetailsCritical"));
        sizePolicy.setHeightForWidth(checkDetailsCritical->sizePolicy().hasHeightForWidth());
        checkDetailsCritical->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDetailsCritical, 4, 2, 1, 1);

        checkDisplayFatal = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDisplayFatal);
        checkDisplayFatal->setObjectName(QStringLiteral("checkDisplayFatal"));
        sizePolicy.setHeightForWidth(checkDisplayFatal->sizePolicy().hasHeightForWidth());
        checkDisplayFatal->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDisplayFatal, 5, 1, 1, 1);

        checkDetailsFatal = new QCheckBox(gridLayoutWidget);
        buttonGroup->addButton(checkDetailsFatal);
        checkDetailsFatal->setObjectName(QStringLiteral("checkDetailsFatal"));
        sizePolicy.setHeightForWidth(checkDetailsFatal->sizePolicy().hasHeightForWidth());
        checkDetailsFatal->setSizePolicy(sizePolicy);

        gridLayout->addWidget(checkDetailsFatal, 5, 2, 1, 1);


        retranslateUi(DialogLogSettings);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogLogSettings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogLogSettings, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogLogSettings);
    } // setupUi

    void retranslateUi(QDialog *DialogLogSettings)
    {
        DialogLogSettings->setWindowTitle(QApplication::translate("DialogLogSettings", "Log window settings", 0));
        label_3->setText(QApplication::translate("DialogLogSettings", "Details", 0));
        label_4->setText(QApplication::translate("DialogLogSettings", "Debug", 0));
        label_6->setText(QApplication::translate("DialogLogSettings", "Warning", 0));
        label->setText(QApplication::translate("DialogLogSettings", "Message type", 0));
        label_7->setText(QApplication::translate("DialogLogSettings", "Critical", 0));
        label_5->setText(QApplication::translate("DialogLogSettings", "Info", 0));
        label_2->setText(QApplication::translate("DialogLogSettings", "Display", 0));
        label_8->setText(QApplication::translate("DialogLogSettings", "Fatal", 0));
        checkDisplayDebug->setText(QString());
        checkDetailsDebug->setText(QString());
        checkDisplayInfo->setText(QString());
        checkDetailsInfo->setText(QString());
        checkDisplayWarning->setText(QString());
        checkDetailsWarning->setText(QString());
        checkDisplayCritical->setText(QString());
        checkDetailsCritical->setText(QString());
        checkDisplayFatal->setText(QString());
        checkDetailsFatal->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class DialogLogSettings: public Ui_DialogLogSettings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGLOGSETTINGS_H
