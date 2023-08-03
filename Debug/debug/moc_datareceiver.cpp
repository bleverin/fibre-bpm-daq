/****************************************************************************
** Meta object code from reading C++ file 'datareceiver.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../hit2017/datareceiver.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'datareceiver.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DataReceiver_t {
    QByteArrayData data[13];
    char stringdata0[143];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DataReceiver_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DataReceiver_t qt_meta_stringdata_DataReceiver = {
    {
QT_MOC_LITERAL(0, 0, 12), // "DataReceiver"
QT_MOC_LITERAL(1, 13, 7), // "sigInit"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 9), // "sigDeinit"
QT_MOC_LITERAL(4, 32, 23), // "sigConfigureEthSettings"
QT_MOC_LITERAL(5, 56, 12), // "sigDataReady"
QT_MOC_LITERAL(6, 69, 13), // "DataReceiver*"
QT_MOC_LITERAL(7, 83, 3), // "ptr"
QT_MOC_LITERAL(8, 87, 7), // "onTimer"
QT_MOC_LITERAL(9, 95, 8), // "readData"
QT_MOC_LITERAL(10, 104, 6), // "onInit"
QT_MOC_LITERAL(11, 111, 8), // "onDeinit"
QT_MOC_LITERAL(12, 120, 22) // "onConfigureEthSettings"

    },
    "DataReceiver\0sigInit\0\0sigDeinit\0"
    "sigConfigureEthSettings\0sigDataReady\0"
    "DataReceiver*\0ptr\0onTimer\0readData\0"
    "onInit\0onDeinit\0onConfigureEthSettings"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DataReceiver[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    0,   60,    2, 0x06 /* Public */,
       4,    0,   61,    2, 0x06 /* Public */,
       5,    1,   62,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   65,    2, 0x0a /* Public */,
       9,    0,   66,    2, 0x09 /* Protected */,
      10,    0,   67,    2, 0x09 /* Protected */,
      11,    0,   68,    2, 0x09 /* Protected */,
      12,    0,   69,    2, 0x09 /* Protected */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 6,    7,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void DataReceiver::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DataReceiver *_t = static_cast<DataReceiver *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sigInit(); break;
        case 1: _t->sigDeinit(); break;
        case 2: _t->sigConfigureEthSettings(); break;
        case 3: _t->sigDataReady((*reinterpret_cast< DataReceiver*(*)>(_a[1]))); break;
        case 4: _t->onTimer(); break;
        case 5: _t->readData(); break;
        case 6: _t->onInit(); break;
        case 7: _t->onDeinit(); break;
        case 8: _t->onConfigureEthSettings(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< DataReceiver* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (DataReceiver::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&DataReceiver::sigInit)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (DataReceiver::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&DataReceiver::sigDeinit)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (DataReceiver::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&DataReceiver::sigConfigureEthSettings)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (DataReceiver::*_t)(DataReceiver * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&DataReceiver::sigDataReady)) {
                *result = 3;
                return;
            }
        }
    }
}

const QMetaObject DataReceiver::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_DataReceiver.data,
      qt_meta_data_DataReceiver,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DataReceiver::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DataReceiver::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DataReceiver.stringdata0))
        return static_cast<void*>(const_cast< DataReceiver*>(this));
    return QObject::qt_metacast(_clname);
}

int DataReceiver::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void DataReceiver::sigInit()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void DataReceiver::sigDeinit()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void DataReceiver::sigConfigureEthSettings()
{
    QMetaObject::activate(this, &staticMetaObject, 2, Q_NULLPTR);
}

// SIGNAL 3
void DataReceiver::sigDataReady(DataReceiver * _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_END_MOC_NAMESPACE
