/********************************************************************************
** Form generated from reading UI file 'dialoghostip.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGHOSTIP_H
#define UI_DIALOGHOSTIP_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DialogHostIp
{
public:
    QDialogButtonBox *buttonBox;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QLabel *label;
    QLineEdit *lineIp;

    void setupUi(QDialog *DialogHostIp)
    {
        if (DialogHostIp->objectName().isEmpty())
            DialogHostIp->setObjectName(QStringLiteral("DialogHostIp"));
        DialogHostIp->resize(185, 99);
        buttonBox = new QDialogButtonBox(DialogHostIp);
        buttonBox->setObjectName(QStringLiteral("buttonBox"));
        buttonBox->setGeometry(QRect(10, 60, 161, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        horizontalLayoutWidget = new QWidget(DialogHostIp);
        horizontalLayoutWidget->setObjectName(QStringLiteral("horizontalLayoutWidget"));
        horizontalLayoutWidget->setGeometry(QRect(10, 10, 160, 41));
        horizontalLayout = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        label = new QLabel(horizontalLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        horizontalLayout->addWidget(label);

        lineIp = new QLineEdit(horizontalLayoutWidget);
        lineIp->setObjectName(QStringLiteral("lineIp"));

        horizontalLayout->addWidget(lineIp);


        retranslateUi(DialogHostIp);
        QObject::connect(buttonBox, SIGNAL(accepted()), DialogHostIp, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DialogHostIp, SLOT(reject()));

        QMetaObject::connectSlotsByName(DialogHostIp);
    } // setupUi

    void retranslateUi(QDialog *DialogHostIp)
    {
        DialogHostIp->setWindowTitle(QApplication::translate("DialogHostIp", "Host IP", 0));
        label->setText(QApplication::translate("DialogHostIp", "Host IP:", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogHostIp: public Ui_DialogHostIp {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGHOSTIP_H
