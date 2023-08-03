/****************************************************************************
** Meta object code from reading C++ file 'dialogtiscan.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../hit2017/dialogtiscan.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dialogtiscan.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DialogTiScan_t {
    QByteArrayData data[8];
    char stringdata0[102];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DialogTiScan_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DialogTiScan_t qt_meta_stringdata_DialogTiScan = {
    {
QT_MOC_LITERAL(0, 0, 12), // "DialogTiScan"
QT_MOC_LITERAL(1, 13, 20), // "onHistogramCompleted"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 9), // "showEvent"
QT_MOC_LITERAL(4, 45, 11), // "QShowEvent*"
QT_MOC_LITERAL(5, 57, 5), // "event"
QT_MOC_LITERAL(6, 63, 18), // "on_pushRun_pressed"
QT_MOC_LITERAL(7, 82, 19) // "on_pushSave_pressed"

    },
    "DialogTiScan\0onHistogramCompleted\0\0"
    "showEvent\0QShowEvent*\0event\0"
    "on_pushRun_pressed\0on_pushSave_pressed"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DialogTiScan[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x0a /* Public */,
       3,    1,   35,    2, 0x0a /* Public */,
       6,    0,   38,    2, 0x08 /* Private */,
       7,    0,   39,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 4,    5,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void DialogTiScan::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DialogTiScan *_t = static_cast<DialogTiScan *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onHistogramCompleted(); break;
        case 1: _t->showEvent((*reinterpret_cast< QShowEvent*(*)>(_a[1]))); break;
        case 2: _t->on_pushRun_pressed(); break;
        case 3: _t->on_pushSave_pressed(); break;
        default: ;
        }
    }
}

const QMetaObject DialogTiScan::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_DialogTiScan.data,
      qt_meta_data_DialogTiScan,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DialogTiScan::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DialogTiScan::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DialogTiScan.stringdata0))
        return static_cast<void*>(const_cast< DialogTiScan*>(this));
    return QDialog::qt_metacast(_clname);
}

int DialogTiScan::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
