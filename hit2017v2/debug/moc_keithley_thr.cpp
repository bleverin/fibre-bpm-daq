/****************************************************************************
** Meta object code from reading C++ file 'keithley_thr.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../keithley_thr.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'keithley_thr.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_keithleyWorker_t {
    QByteArrayData data[15];
    char stringdata0[134];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_keithleyWorker_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_keithleyWorker_t qt_meta_stringdata_keithleyWorker = {
    {
QT_MOC_LITERAL(0, 0, 14), // "keithleyWorker"
QT_MOC_LITERAL(1, 15, 18), // "sig_currentReadout"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 5), // "value"
QT_MOC_LITERAL(4, 41, 10), // "sig_isOpen"
QT_MOC_LITERAL(5, 52, 5), // "state"
QT_MOC_LITERAL(6, 58, 8), // "portName"
QT_MOC_LITERAL(7, 67, 2), // "on"
QT_MOC_LITERAL(8, 70, 10), // "setVoltage"
QT_MOC_LITERAL(9, 81, 7), // "voltage"
QT_MOC_LITERAL(10, 89, 5), // "reset"
QT_MOC_LITERAL(11, 95, 10), // "timerEvent"
QT_MOC_LITERAL(12, 106, 8), // "runTimer"
QT_MOC_LITERAL(13, 115, 7), // "connect"
QT_MOC_LITERAL(14, 123, 10) // "disconnect"

    },
    "keithleyWorker\0sig_currentReadout\0\0"
    "value\0sig_isOpen\0state\0portName\0on\0"
    "setVoltage\0voltage\0reset\0timerEvent\0"
    "runTimer\0connect\0disconnect"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_keithleyWorker[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   59,    2, 0x06 /* Public */,
       4,    2,   62,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    1,   67,    2, 0x0a /* Public */,
       8,    1,   70,    2, 0x0a /* Public */,
      10,    0,   73,    2, 0x0a /* Public */,
      11,    0,   74,    2, 0x0a /* Public */,
      12,    1,   75,    2, 0x0a /* Public */,
      13,    0,   78,    2, 0x0a /* Public */,
      14,    0,   79,    2, 0x0a /* Public */,

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

void keithleyWorker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        keithleyWorker *_t = static_cast<keithleyWorker *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sig_currentReadout((*reinterpret_cast< const double(*)>(_a[1]))); break;
        case 1: _t->sig_isOpen((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 2: _t->on((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 3: _t->setVoltage((*reinterpret_cast< const double(*)>(_a[1]))); break;
        case 4: _t->reset(); break;
        case 5: _t->timerEvent(); break;
        case 6: _t->runTimer((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 7: _t->connect(); break;
        case 8: _t->disconnect(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (keithleyWorker::*_t)(const double );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithleyWorker::sig_currentReadout)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (keithleyWorker::*_t)(const int , const QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithleyWorker::sig_isOpen)) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject keithleyWorker::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_keithleyWorker.data,
      qt_meta_data_keithleyWorker,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *keithleyWorker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *keithleyWorker::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_keithleyWorker.stringdata0))
        return static_cast<void*>(const_cast< keithleyWorker*>(this));
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void keithleyWorker::sig_currentReadout(const double _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void keithleyWorker::sig_isOpen(const int _t1, const QString _t2)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
struct qt_meta_stringdata_keithley_thr_t {
    QByteArrayData data[14];
    char stringdata0[163];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_keithley_thr_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_keithley_thr_t qt_meta_stringdata_keithley_thr = {
    {
QT_MOC_LITERAL(0, 0, 12), // "keithley_thr"
QT_MOC_LITERAL(1, 13, 11), // "sig_connect"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 14), // "sig_disconnect"
QT_MOC_LITERAL(4, 41, 6), // "sig_on"
QT_MOC_LITERAL(5, 48, 14), // "sig_setVoltage"
QT_MOC_LITERAL(6, 63, 9), // "sig_reset"
QT_MOC_LITERAL(7, 73, 12), // "sig_runTimer"
QT_MOC_LITERAL(8, 86, 22), // "esig_newCurrentReadout"
QT_MOC_LITERAL(9, 109, 17), // "on_currentReadout"
QT_MOC_LITERAL(10, 127, 5), // "value"
QT_MOC_LITERAL(11, 133, 9), // "on_isOpen"
QT_MOC_LITERAL(12, 143, 5), // "state"
QT_MOC_LITERAL(13, 149, 13) // "givenPortName"

    },
    "keithley_thr\0sig_connect\0\0sig_disconnect\0"
    "sig_on\0sig_setVoltage\0sig_reset\0"
    "sig_runTimer\0esig_newCurrentReadout\0"
    "on_currentReadout\0value\0on_isOpen\0"
    "state\0givenPortName"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_keithley_thr[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    0,   60,    2, 0x06 /* Public */,
       4,    1,   61,    2, 0x06 /* Public */,
       5,    1,   64,    2, 0x06 /* Public */,
       6,    0,   67,    2, 0x06 /* Public */,
       7,    1,   68,    2, 0x06 /* Public */,
       8,    1,   71,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       9,    1,   74,    2, 0x0a /* Public */,
      11,    2,   77,    2, 0x0a /* Public */,

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

void keithley_thr::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        keithley_thr *_t = static_cast<keithley_thr *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sig_connect(); break;
        case 1: _t->sig_disconnect(); break;
        case 2: _t->sig_on((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 3: _t->sig_setVoltage((*reinterpret_cast< const double(*)>(_a[1]))); break;
        case 4: _t->sig_reset(); break;
        case 5: _t->sig_runTimer((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 6: _t->esig_newCurrentReadout((*reinterpret_cast< const double(*)>(_a[1]))); break;
        case 7: { int _r = _t->on_currentReadout((*reinterpret_cast< const double(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 8: { int _r = _t->on_isOpen((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (keithley_thr::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_connect)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_disconnect)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)(const int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_on)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)(const double );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_setVoltage)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_reset)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)(const int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::sig_runTimer)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (keithley_thr::*_t)(const double );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&keithley_thr::esig_newCurrentReadout)) {
                *result = 6;
                return;
            }
        }
    }
}

const QMetaObject keithley_thr::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_keithley_thr.data,
      qt_meta_data_keithley_thr,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *keithley_thr::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *keithley_thr::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_keithley_thr.stringdata0))
        return static_cast<void*>(const_cast< keithley_thr*>(this));
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void keithley_thr::sig_connect()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void keithley_thr::sig_disconnect()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void keithley_thr::sig_on(const int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void keithley_thr::sig_setVoltage(const double _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void keithley_thr::sig_reset()
{
    QMetaObject::activate(this, &staticMetaObject, 4, Q_NULLPTR);
}

// SIGNAL 5
void keithley_thr::sig_runTimer(const int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void keithley_thr::esig_newCurrentReadout(const double _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_END_MOC_NAMESPACE
