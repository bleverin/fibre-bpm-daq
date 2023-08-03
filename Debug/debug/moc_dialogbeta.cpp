/****************************************************************************
** Meta object code from reading C++ file 'dialogbeta.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../hit2017/dialogbeta.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dialogbeta.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DialogBeta_t {
    QByteArrayData data[15];
    char stringdata0[237];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DialogBeta_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DialogBeta_t qt_meta_stringdata_DialogBeta = {
    {
QT_MOC_LITERAL(0, 0, 10), // "DialogBeta"
QT_MOC_LITERAL(1, 11, 9), // "showEvent"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 11), // "QShowEvent*"
QT_MOC_LITERAL(4, 34, 5), // "event"
QT_MOC_LITERAL(5, 40, 20), // "onHistogramCompleted"
QT_MOC_LITERAL(6, 61, 7), // "onTimer"
QT_MOC_LITERAL(7, 69, 18), // "on_pushRun_pressed"
QT_MOC_LITERAL(8, 88, 19), // "on_pushSave_pressed"
QT_MOC_LITERAL(9, 108, 20), // "on_pushClear_pressed"
QT_MOC_LITERAL(10, 129, 19), // "on_pushLeft_pressed"
QT_MOC_LITERAL(11, 149, 20), // "on_pushLeft_released"
QT_MOC_LITERAL(12, 170, 20), // "on_pushRight_pressed"
QT_MOC_LITERAL(13, 191, 21), // "on_pushRight_released"
QT_MOC_LITERAL(14, 213, 23) // "on_pushResetCtr_pressed"

    },
    "DialogBeta\0showEvent\0\0QShowEvent*\0"
    "event\0onHistogramCompleted\0onTimer\0"
    "on_pushRun_pressed\0on_pushSave_pressed\0"
    "on_pushClear_pressed\0on_pushLeft_pressed\0"
    "on_pushLeft_released\0on_pushRight_pressed\0"
    "on_pushRight_released\0on_pushResetCtr_pressed"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DialogBeta[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   69,    2, 0x0a /* Public */,
       5,    0,   72,    2, 0x0a /* Public */,
       6,    0,   73,    2, 0x0a /* Public */,
       7,    0,   74,    2, 0x08 /* Private */,
       8,    0,   75,    2, 0x08 /* Private */,
       9,    0,   76,    2, 0x08 /* Private */,
      10,    0,   77,    2, 0x08 /* Private */,
      11,    0,   78,    2, 0x08 /* Private */,
      12,    0,   79,    2, 0x08 /* Private */,
      13,    0,   80,    2, 0x08 /* Private */,
      14,    0,   81,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
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

void DialogBeta::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DialogBeta *_t = static_cast<DialogBeta *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->showEvent((*reinterpret_cast< QShowEvent*(*)>(_a[1]))); break;
        case 1: _t->onHistogramCompleted(); break;
        case 2: _t->onTimer(); break;
        case 3: _t->on_pushRun_pressed(); break;
        case 4: _t->on_pushSave_pressed(); break;
        case 5: _t->on_pushClear_pressed(); break;
        case 6: _t->on_pushLeft_pressed(); break;
        case 7: _t->on_pushLeft_released(); break;
        case 8: _t->on_pushRight_pressed(); break;
        case 9: _t->on_pushRight_released(); break;
        case 10: _t->on_pushResetCtr_pressed(); break;
        default: ;
        }
    }
}

const QMetaObject DialogBeta::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_DialogBeta.data,
      qt_meta_data_DialogBeta,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DialogBeta::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DialogBeta::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DialogBeta.stringdata0))
        return static_cast<void*>(const_cast< DialogBeta*>(this));
    return QDialog::qt_metacast(_clname);
}

int DialogBeta::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
