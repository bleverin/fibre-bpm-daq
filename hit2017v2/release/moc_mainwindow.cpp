/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../mainwindow.h"
#include <QtGui/qtextcursor.h>
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.5.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSMainWindowENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSMainWindowENDCLASS = QtMocHelpers::stringData(
    "MainWindow",
    "showEvent",
    "",
    "QShowEvent*",
    "event",
    "closeEvent",
    "QCloseEvent*",
    "on_timer",
    "on_newCurrentReadout",
    "currentReadout",
    "on_pushLogSettings_pressed",
    "on_actionConnect_triggered",
    "on_actionDisconnect_triggered",
    "on_actionHost_IP_triggered",
    "on_actionTrigger_config_triggered",
    "on_actionDevices_triggered",
    "on_pushRun_pressed",
    "on_pushLogging_pressed",
    "on_pushDisplay_pressed",
    "on_actionConnect_Keithley_triggered",
    "on_actionDisconnect_Keithley_triggered",
    "on_actionLinearity_test_triggered",
    "on_actionIntegration_time_scan_triggered",
    "on_actionProfile_viewer_triggered",
    "on_actionConnect_Stepper_triggered",
    "on_actionDisconnect_Stepper_triggered",
    "on_actionBeta_Scanner_triggered"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSMainWindowENDCLASS_t {
    uint offsetsAndSizes[54];
    char stringdata0[11];
    char stringdata1[10];
    char stringdata2[1];
    char stringdata3[12];
    char stringdata4[6];
    char stringdata5[11];
    char stringdata6[13];
    char stringdata7[9];
    char stringdata8[21];
    char stringdata9[15];
    char stringdata10[27];
    char stringdata11[27];
    char stringdata12[30];
    char stringdata13[27];
    char stringdata14[34];
    char stringdata15[27];
    char stringdata16[19];
    char stringdata17[23];
    char stringdata18[23];
    char stringdata19[36];
    char stringdata20[39];
    char stringdata21[34];
    char stringdata22[41];
    char stringdata23[34];
    char stringdata24[35];
    char stringdata25[38];
    char stringdata26[32];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSMainWindowENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSMainWindowENDCLASS_t qt_meta_stringdata_CLASSMainWindowENDCLASS = {
    {
        QT_MOC_LITERAL(0, 10),  // "MainWindow"
        QT_MOC_LITERAL(11, 9),  // "showEvent"
        QT_MOC_LITERAL(21, 0),  // ""
        QT_MOC_LITERAL(22, 11),  // "QShowEvent*"
        QT_MOC_LITERAL(34, 5),  // "event"
        QT_MOC_LITERAL(40, 10),  // "closeEvent"
        QT_MOC_LITERAL(51, 12),  // "QCloseEvent*"
        QT_MOC_LITERAL(64, 8),  // "on_timer"
        QT_MOC_LITERAL(73, 20),  // "on_newCurrentReadout"
        QT_MOC_LITERAL(94, 14),  // "currentReadout"
        QT_MOC_LITERAL(109, 26),  // "on_pushLogSettings_pressed"
        QT_MOC_LITERAL(136, 26),  // "on_actionConnect_triggered"
        QT_MOC_LITERAL(163, 29),  // "on_actionDisconnect_triggered"
        QT_MOC_LITERAL(193, 26),  // "on_actionHost_IP_triggered"
        QT_MOC_LITERAL(220, 33),  // "on_actionTrigger_config_trigg..."
        QT_MOC_LITERAL(254, 26),  // "on_actionDevices_triggered"
        QT_MOC_LITERAL(281, 18),  // "on_pushRun_pressed"
        QT_MOC_LITERAL(300, 22),  // "on_pushLogging_pressed"
        QT_MOC_LITERAL(323, 22),  // "on_pushDisplay_pressed"
        QT_MOC_LITERAL(346, 35),  // "on_actionConnect_Keithley_tri..."
        QT_MOC_LITERAL(382, 38),  // "on_actionDisconnect_Keithley_..."
        QT_MOC_LITERAL(421, 33),  // "on_actionLinearity_test_trigg..."
        QT_MOC_LITERAL(455, 40),  // "on_actionIntegration_time_sca..."
        QT_MOC_LITERAL(496, 33),  // "on_actionProfile_viewer_trigg..."
        QT_MOC_LITERAL(530, 34),  // "on_actionConnect_Stepper_trig..."
        QT_MOC_LITERAL(565, 37),  // "on_actionDisconnect_Stepper_t..."
        QT_MOC_LITERAL(603, 31)   // "on_actionBeta_Scanner_triggered"
    },
    "MainWindow",
    "showEvent",
    "",
    "QShowEvent*",
    "event",
    "closeEvent",
    "QCloseEvent*",
    "on_timer",
    "on_newCurrentReadout",
    "currentReadout",
    "on_pushLogSettings_pressed",
    "on_actionConnect_triggered",
    "on_actionDisconnect_triggered",
    "on_actionHost_IP_triggered",
    "on_actionTrigger_config_triggered",
    "on_actionDevices_triggered",
    "on_pushRun_pressed",
    "on_pushLogging_pressed",
    "on_pushDisplay_pressed",
    "on_actionConnect_Keithley_triggered",
    "on_actionDisconnect_Keithley_triggered",
    "on_actionLinearity_test_triggered",
    "on_actionIntegration_time_scan_triggered",
    "on_actionProfile_viewer_triggered",
    "on_actionConnect_Stepper_triggered",
    "on_actionDisconnect_Stepper_triggered",
    "on_actionBeta_Scanner_triggered"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSMainWindowENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
      21,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,  140,    2, 0x0a,    1 /* Public */,
       5,    1,  143,    2, 0x0a,    3 /* Public */,
       7,    0,  146,    2, 0x0a,    5 /* Public */,
       8,    1,  147,    2, 0x0a,    6 /* Public */,
      10,    0,  150,    2, 0x08,    8 /* Private */,
      11,    0,  151,    2, 0x08,    9 /* Private */,
      12,    0,  152,    2, 0x08,   10 /* Private */,
      13,    0,  153,    2, 0x08,   11 /* Private */,
      14,    0,  154,    2, 0x08,   12 /* Private */,
      15,    0,  155,    2, 0x08,   13 /* Private */,
      16,    0,  156,    2, 0x08,   14 /* Private */,
      17,    0,  157,    2, 0x08,   15 /* Private */,
      18,    0,  158,    2, 0x08,   16 /* Private */,
      19,    0,  159,    2, 0x08,   17 /* Private */,
      20,    0,  160,    2, 0x08,   18 /* Private */,
      21,    0,  161,    2, 0x08,   19 /* Private */,
      22,    0,  162,    2, 0x08,   20 /* Private */,
      23,    0,  163,    2, 0x08,   21 /* Private */,
      24,    0,  164,    2, 0x08,   22 /* Private */,
      25,    0,  165,    2, 0x08,   23 /* Private */,
      26,    0,  166,    2, 0x08,   24 /* Private */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 6,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Double,    9,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

Q_CONSTINIT const QMetaObject MainWindow::staticMetaObject = { {
    QMetaObject::SuperData::link<QMainWindow::staticMetaObject>(),
    qt_meta_stringdata_CLASSMainWindowENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSMainWindowENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSMainWindowENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<MainWindow, std::true_type>,
        // method 'showEvent'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QShowEvent *, std::false_type>,
        // method 'closeEvent'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QCloseEvent *, std::false_type>,
        // method 'on_timer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_newCurrentReadout'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'on_pushLogSettings_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionConnect_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionDisconnect_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionHost_IP_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionTrigger_config_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionDevices_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushRun_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushLogging_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushDisplay_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionConnect_Keithley_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionDisconnect_Keithley_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionLinearity_test_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionIntegration_time_scan_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionProfile_viewer_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionConnect_Stepper_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionDisconnect_Stepper_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_actionBeta_Scanner_triggered'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MainWindow *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->showEvent((*reinterpret_cast< std::add_pointer_t<QShowEvent*>>(_a[1]))); break;
        case 1: _t->closeEvent((*reinterpret_cast< std::add_pointer_t<QCloseEvent*>>(_a[1]))); break;
        case 2: _t->on_timer(); break;
        case 3: _t->on_newCurrentReadout((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 4: _t->on_pushLogSettings_pressed(); break;
        case 5: _t->on_actionConnect_triggered(); break;
        case 6: _t->on_actionDisconnect_triggered(); break;
        case 7: _t->on_actionHost_IP_triggered(); break;
        case 8: _t->on_actionTrigger_config_triggered(); break;
        case 9: _t->on_actionDevices_triggered(); break;
        case 10: _t->on_pushRun_pressed(); break;
        case 11: _t->on_pushLogging_pressed(); break;
        case 12: _t->on_pushDisplay_pressed(); break;
        case 13: _t->on_actionConnect_Keithley_triggered(); break;
        case 14: _t->on_actionDisconnect_Keithley_triggered(); break;
        case 15: _t->on_actionLinearity_test_triggered(); break;
        case 16: _t->on_actionIntegration_time_scan_triggered(); break;
        case 17: _t->on_actionProfile_viewer_triggered(); break;
        case 18: _t->on_actionConnect_Stepper_triggered(); break;
        case 19: _t->on_actionDisconnect_Stepper_triggered(); break;
        case 20: _t->on_actionBeta_Scanner_triggered(); break;
        default: ;
        }
    }
}

const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSMainWindowENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 21)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 21)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 21;
    }
    return _id;
}
QT_WARNING_POP
