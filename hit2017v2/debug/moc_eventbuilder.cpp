/****************************************************************************
** Meta object code from reading C++ file 'eventbuilder.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../eventbuilder.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'eventbuilder.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_EventBuilder_t {
    QByteArrayData data[19];
    char stringdata0[252];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_EventBuilder_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_EventBuilder_t qt_meta_stringdata_EventBuilder = {
    {
QT_MOC_LITERAL(0, 0, 12), // "EventBuilder"
QT_MOC_LITERAL(1, 13, 7), // "sigInit"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 9), // "sigDeinit"
QT_MOC_LITERAL(4, 32, 15), // "sigStartLogging"
QT_MOC_LITERAL(5, 48, 14), // "sigStopLogging"
QT_MOC_LITERAL(6, 63, 20), // "sigStartTakingHistos"
QT_MOC_LITERAL(7, 84, 19), // "sigStopTakingHistos"
QT_MOC_LITERAL(8, 104, 17), // "sigHistoCompleted"
QT_MOC_LITERAL(9, 122, 9), // "onNewData"
QT_MOC_LITERAL(10, 132, 13), // "DataReceiver*"
QT_MOC_LITERAL(11, 146, 8), // "receiver"
QT_MOC_LITERAL(12, 155, 6), // "onInit"
QT_MOC_LITERAL(13, 162, 8), // "onDeinit"
QT_MOC_LITERAL(14, 171, 14), // "onStartLogging"
QT_MOC_LITERAL(15, 186, 13), // "onStopLogging"
QT_MOC_LITERAL(16, 200, 19), // "onStartTakingHistos"
QT_MOC_LITERAL(17, 220, 12), // "sample_count"
QT_MOC_LITERAL(18, 233, 18) // "onStopTakingHistos"

    },
    "EventBuilder\0sigInit\0\0sigDeinit\0"
    "sigStartLogging\0sigStopLogging\0"
    "sigStartTakingHistos\0sigStopTakingHistos\0"
    "sigHistoCompleted\0onNewData\0DataReceiver*\0"
    "receiver\0onInit\0onDeinit\0onStartLogging\0"
    "onStopLogging\0onStartTakingHistos\0"
    "sample_count\0onStopTakingHistos"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_EventBuilder[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      14,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   84,    2, 0x06 /* Public */,
       3,    0,   85,    2, 0x06 /* Public */,
       4,    0,   86,    2, 0x06 /* Public */,
       5,    0,   87,    2, 0x06 /* Public */,
       6,    1,   88,    2, 0x06 /* Public */,
       7,    0,   91,    2, 0x06 /* Public */,
       8,    0,   92,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       9,    1,   93,    2, 0x0a /* Public */,
      12,    0,   96,    2, 0x09 /* Protected */,
      13,    0,   97,    2, 0x09 /* Protected */,
      14,    0,   98,    2, 0x09 /* Protected */,
      15,    0,   99,    2, 0x09 /* Protected */,
      16,    1,  100,    2, 0x09 /* Protected */,
      18,    0,  103,    2, 0x09 /* Protected */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    2,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   17,
    QMetaType::Void,

       0        // eod
};

void EventBuilder::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        EventBuilder *_t = static_cast<EventBuilder *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sigInit(); break;
        case 1: _t->sigDeinit(); break;
        case 2: _t->sigStartLogging(); break;
        case 3: _t->sigStopLogging(); break;
        case 4: _t->sigStartTakingHistos((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->sigStopTakingHistos(); break;
        case 6: _t->sigHistoCompleted(); break;
        case 7: _t->onNewData((*reinterpret_cast< DataReceiver*(*)>(_a[1]))); break;
        case 8: _t->onInit(); break;
        case 9: _t->onDeinit(); break;
        case 10: _t->onStartLogging(); break;
        case 11: _t->onStopLogging(); break;
        case 12: _t->onStartTakingHistos((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 13: _t->onStopTakingHistos(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 7:
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
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigInit)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigDeinit)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigStartLogging)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigStopLogging)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigStartTakingHistos)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigStopTakingHistos)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (EventBuilder::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&EventBuilder::sigHistoCompleted)) {
                *result = 6;
                return;
            }
        }
    }
}

const QMetaObject EventBuilder::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_EventBuilder.data,
      qt_meta_data_EventBuilder,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *EventBuilder::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *EventBuilder::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_EventBuilder.stringdata0))
        return static_cast<void*>(const_cast< EventBuilder*>(this));
    return QObject::qt_metacast(_clname);
}

int EventBuilder::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    }
    return _id;
}

// SIGNAL 0
void EventBuilder::sigInit()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void EventBuilder::sigDeinit()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void EventBuilder::sigStartLogging()
{
    QMetaObject::activate(this, &staticMetaObject, 2, Q_NULLPTR);
}

// SIGNAL 3
void EventBuilder::sigStopLogging()
{
    QMetaObject::activate(this, &staticMetaObject, 3, Q_NULLPTR);
}

// SIGNAL 4
void EventBuilder::sigStartTakingHistos(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void EventBuilder::sigStopTakingHistos()
{
    QMetaObject::activate(this, &staticMetaObject, 5, Q_NULLPTR);
}

// SIGNAL 6
void EventBuilder::sigHistoCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 6, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
