/****************************************************************************
** Meta object code from reading C++ file 'dialogtriggersettings.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../dialogtriggersettings.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dialogtriggersettings.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DialogTriggerSettings_t {
    QByteArrayData data[11];
    char stringdata0[193];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DialogTriggerSettings_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DialogTriggerSettings_t qt_meta_stringdata_DialogTriggerSettings = {
    {
QT_MOC_LITERAL(0, 0, 21), // "DialogTriggerSettings"
QT_MOC_LITERAL(1, 22, 9), // "showEvent"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 11), // "QShowEvent*"
QT_MOC_LITERAL(4, 45, 5), // "event"
QT_MOC_LITERAL(5, 51, 6), // "accept"
QT_MOC_LITERAL(6, 58, 31), // "on_spinPeriodTicks_valueChanged"
QT_MOC_LITERAL(7, 90, 4), // "arg1"
QT_MOC_LITERAL(8, 95, 29), // "on_spinTintTicks_valueChanged"
QT_MOC_LITERAL(9, 125, 34), // "on_spinPeriodTicks_v2_valueCh..."
QT_MOC_LITERAL(10, 160, 32) // "on_spinTintTicks_v2_valueChanged"

    },
    "DialogTriggerSettings\0showEvent\0\0"
    "QShowEvent*\0event\0accept\0"
    "on_spinPeriodTicks_valueChanged\0arg1\0"
    "on_spinTintTicks_valueChanged\0"
    "on_spinPeriodTicks_v2_valueChanged\0"
    "on_spinTintTicks_v2_valueChanged"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DialogTriggerSettings[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x0a /* Public */,
       5,    0,   47,    2, 0x0a /* Public */,
       6,    1,   48,    2, 0x08 /* Private */,
       8,    1,   51,    2, 0x08 /* Private */,
       9,    1,   54,    2, 0x08 /* Private */,
      10,    1,   57,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void, QMetaType::Int,    7,

       0        // eod
};

void DialogTriggerSettings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DialogTriggerSettings *_t = static_cast<DialogTriggerSettings *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->showEvent((*reinterpret_cast< QShowEvent*(*)>(_a[1]))); break;
        case 1: _t->accept(); break;
        case 2: _t->on_spinPeriodTicks_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->on_spinTintTicks_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->on_spinPeriodTicks_v2_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->on_spinTintTicks_v2_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject DialogTriggerSettings::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_DialogTriggerSettings.data,
      qt_meta_data_DialogTriggerSettings,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DialogTriggerSettings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DialogTriggerSettings::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DialogTriggerSettings.stringdata0))
        return static_cast<void*>(const_cast< DialogTriggerSettings*>(this));
    return QDialog::qt_metacast(_clname);
}

int DialogTriggerSettings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
