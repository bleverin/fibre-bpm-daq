/****************************************************************************
** Meta object code from reading C++ file 'keithley_thr.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../hit2017/keithley_thr.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'keithley_thr.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS = QtMocHelpers::stringData(
    "keithleyWorker",
    "sig_currentReadout",
    "",
    "value",
    "sig_isOpen",
    "state",
    "portName",
    "on",
    "setVoltage",
    "voltage",
    "reset",
    "timerEvent",
    "runTimer",
    "connect",
    "disconnect"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS_t {
    uint offsetsAndSizes[30];
    char stringdata0[15];
    char stringdata1[19];
    char stringdata2[1];
    char stringdata3[6];
    char stringdata4[11];
    char stringdata5[6];
    char stringdata6[9];
    char stringdata7[3];
    char stringdata8[11];
    char stringdata9[8];
    char stringdata10[6];
    char stringdata11[11];
    char stringdata12[9];
    char stringdata13[8];
    char stringdata14[11];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS_t qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS = {
    {
        QT_MOC_LITERAL(0, 14),  // "keithleyWorker"
        QT_MOC_LITERAL(15, 18),  // "sig_currentReadout"
        QT_MOC_LITERAL(34, 0),  // ""
        QT_MOC_LITERAL(35, 5),  // "value"
        QT_MOC_LITERAL(41, 10),  // "sig_isOpen"
        QT_MOC_LITERAL(52, 5),  // "state"
        QT_MOC_LITERAL(58, 8),  // "portName"
        QT_MOC_LITERAL(67, 2),  // "on"
        QT_MOC_LITERAL(70, 10),  // "setVoltage"
        QT_MOC_LITERAL(81, 7),  // "voltage"
        QT_MOC_LITERAL(89, 5),  // "reset"
        QT_MOC_LITERAL(95, 10),  // "timerEvent"
        QT_MOC_LITERAL(106, 8),  // "runTimer"
        QT_MOC_LITERAL(115, 7),  // "connect"
        QT_MOC_LITERAL(123, 10)   // "disconnect"
    },
    "keithleyWorker",
    "sig_currentReadout",
    "",
    "value",
    "sig_isOpen",
    "state",
    "portName",
    "on",
    "setVoltage",
    "voltage",
    "reset",
    "timerEvent",
    "runTimer",
    "connect",
    "disconnect"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSkeithleyWorkerENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   68,    2, 0x06,    1 /* Public */,
       4,    2,   71,    2, 0x06,    3 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       7,    1,   76,    2, 0x0a,    6 /* Public */,
       8,    1,   79,    2, 0x0a,    8 /* Public */,
      10,    0,   82,    2, 0x0a,   10 /* Public */,
      11,    0,   83,    2, 0x0a,   11 /* Public */,
      12,    1,   84,    2, 0x0a,   12 /* Public */,
      13,    0,   87,    2, 0x0a,   14 /* Public */,
      14,    0,   88,    2, 0x0a,   15 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Double,    3,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    5,    6,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,    5,
    QMetaType::Void, QMetaType::Double,    9,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    5,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

Q_CONSTINIT const QMetaObject keithleyWorker::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSkeithleyWorkerENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<keithleyWorker, std::true_type>,
        // method 'sig_currentReadout'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'sig_isOpen'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString, std::false_type>,
        // method 'on'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        // method 'setVoltage'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'reset'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'timerEvent'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'runTimer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        // method 'connect'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'disconnect'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void keithleyWorker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<keithleyWorker *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->sig_currentReadout((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 1: _t->sig_isOpen((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 2: _t->on((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 3: _t->setVoltage((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 4: _t->reset(); break;
        case 5: _t->timerEvent(); break;
        case 6: _t->runTimer((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 7: _t->connect(); break;
        case 8: _t->disconnect(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (keithleyWorker::*)(const double );
            if (_t _q_method = &keithleyWorker::sig_currentReadout; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (keithleyWorker::*)(const int , const QString );
            if (_t _q_method = &keithleyWorker::sig_isOpen; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject *keithleyWorker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *keithleyWorker::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSkeithleyWorkerENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int keithleyWorker::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void keithleyWorker::sig_currentReadout(const double _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void keithleyWorker::sig_isOpen(const int _t1, const QString _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSkeithley_thrENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSkeithley_thrENDCLASS = QtMocHelpers::stringData(
    "keithley_thr",
    "sig_connect",
    "",
    "sig_disconnect",
    "sig_on",
    "sig_setVoltage",
    "sig_reset",
    "sig_runTimer",
    "esig_newCurrentReadout",
    "on_currentReadout",
    "value",
    "on_isOpen",
    "state",
    "givenPortName"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSkeithley_thrENDCLASS_t {
    uint offsetsAndSizes[28];
    char stringdata0[13];
    char stringdata1[12];
    char stringdata2[1];
    char stringdata3[15];
    char stringdata4[7];
    char stringdata5[15];
    char stringdata6[10];
    char stringdata7[13];
    char stringdata8[23];
    char stringdata9[18];
    char stringdata10[6];
    char stringdata11[10];
    char stringdata12[6];
    char stringdata13[14];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSkeithley_thrENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSkeithley_thrENDCLASS_t qt_meta_stringdata_CLASSkeithley_thrENDCLASS = {
    {
        QT_MOC_LITERAL(0, 12),  // "keithley_thr"
        QT_MOC_LITERAL(13, 11),  // "sig_connect"
        QT_MOC_LITERAL(25, 0),  // ""
        QT_MOC_LITERAL(26, 14),  // "sig_disconnect"
        QT_MOC_LITERAL(41, 6),  // "sig_on"
        QT_MOC_LITERAL(48, 14),  // "sig_setVoltage"
        QT_MOC_LITERAL(63, 9),  // "sig_reset"
        QT_MOC_LITERAL(73, 12),  // "sig_runTimer"
        QT_MOC_LITERAL(86, 22),  // "esig_newCurrentReadout"
        QT_MOC_LITERAL(109, 17),  // "on_currentReadout"
        QT_MOC_LITERAL(127, 5),  // "value"
        QT_MOC_LITERAL(133, 9),  // "on_isOpen"
        QT_MOC_LITERAL(143, 5),  // "state"
        QT_MOC_LITERAL(149, 13)   // "givenPortName"
    },
    "keithley_thr",
    "sig_connect",
    "",
    "sig_disconnect",
    "sig_on",
    "sig_setVoltage",
    "sig_reset",
    "sig_runTimer",
    "esig_newCurrentReadout",
    "on_currentReadout",
    "value",
    "on_isOpen",
    "state",
    "givenPortName"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSkeithley_thrENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   68,    2, 0x06,    1 /* Public */,
       3,    0,   69,    2, 0x06,    2 /* Public */,
       4,    1,   70,    2, 0x06,    3 /* Public */,
       5,    1,   73,    2, 0x06,    5 /* Public */,
       6,    0,   76,    2, 0x06,    7 /* Public */,
       7,    1,   77,    2, 0x06,    8 /* Public */,
       8,    1,   80,    2, 0x06,   10 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       9,    1,   83,    2, 0x0a,   12 /* Public */,
      11,    2,   86,    2, 0x0a,   14 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    2,
    QMetaType::Void, QMetaType::Double,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    2,
    QMetaType::Void, QMetaType::Double,    2,

 // slots: parameters
    QMetaType::Int, QMetaType::Double,   10,
    QMetaType::Int, QMetaType::Int, QMetaType::QString,   12,   13,

       0        // eod
};

Q_CONSTINIT const QMetaObject keithley_thr::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSkeithley_thrENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSkeithley_thrENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSkeithley_thrENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<keithley_thr, std::true_type>,
        // method 'sig_connect'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'sig_disconnect'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'sig_on'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        // method 'sig_setVoltage'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'sig_reset'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'sig_runTimer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        // method 'esig_newCurrentReadout'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'on_currentReadout'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<const double, std::false_type>,
        // method 'on_isOpen'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString, std::false_type>
    >,
    nullptr
} };

void keithley_thr::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<keithley_thr *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->sig_connect(); break;
        case 1: _t->sig_disconnect(); break;
        case 2: _t->sig_on((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 3: _t->sig_setVoltage((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 4: _t->sig_reset(); break;
        case 5: _t->sig_runTimer((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 6: _t->esig_newCurrentReadout((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 7: { int _r = _t->on_currentReadout((*reinterpret_cast< std::add_pointer_t<double>>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 8: { int _r = _t->on_isOpen((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (keithley_thr::*)();
            if (_t _q_method = &keithley_thr::sig_connect; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)();
            if (_t _q_method = &keithley_thr::sig_disconnect; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)(const int );
            if (_t _q_method = &keithley_thr::sig_on; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)(const double );
            if (_t _q_method = &keithley_thr::sig_setVoltage; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)();
            if (_t _q_method = &keithley_thr::sig_reset; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)(const int );
            if (_t _q_method = &keithley_thr::sig_runTimer; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (keithley_thr::*)(const double );
            if (_t _q_method = &keithley_thr::esig_newCurrentReadout; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
    }
}

const QMetaObject *keithley_thr::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *keithley_thr::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSkeithley_thrENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int keithley_thr::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void keithley_thr::sig_connect()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void keithley_thr::sig_disconnect()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void keithley_thr::sig_on(const int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void keithley_thr::sig_setVoltage(const double _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void keithley_thr::sig_reset()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void keithley_thr::sig_runTimer(const int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void keithley_thr::esig_newCurrentReadout(const double _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_WARNING_POP
