/********************************************************************************
** Form generated from reading UI file 'dialogdevices.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGDEVICES_H
#define UI_DIALOGDEVICES_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogDevices
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label;
    QSpinBox *spinNrDevices;
    QTableWidget *tableDevices;

    void setupUi(QDialog *DialogDevices)
    {
        if (DialogDevices->objectName().isEmpty())
            DialogDevices->setObjectName(QStringLiteral("DialogDevices"));
        DialogDevices->resize(573, 233);
        buttonBox = new QDialogButtonBox(DialogDevices);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(210, 190, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        verticalLayoutWidget = new QWidget(DialogDevices);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(20, 10, 531, 171));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        label = new QLabel(verticalLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        horizontalLayout_2->addWidget(label);

        spinNrDevices = new QSpinBox(verticalLayoutWidget);
        spinNrDevices->setObjectName(QStringLiteral("spinNrDevices"));
        spinNrDevices->setMinimum(1);

        horizontalLayout_2->addWidget(spinNrDevices);


        verticalLayout->addLayout(horizontalLayout_2);

        tableDevices = new QTableWidget(verticalLayoutWidget);
        tableDevices->setObjectName(QStringLiteral("tableDevices"));

        verticalLayout->addWidget(tableDevices);


        retranslateUi(DialogDevices);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogDevices, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogDevices, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogDevices);
    } // setupUi

    void retranslateUi(QDialog *DialogDevices)
    {
        DialogDevices->setWindowTitle(QApplication::translate("DialogDevices", "Devices", 0));
        label->setText(QApplication::translate("DialogDevices", "Number of devices", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogDevices: public Ui_DialogDevices {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGDEVICES_H
