/****************************************************************************
** Meta object code from reading C++ file 'dialoglogsettings.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../dialoglogsettings.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dialoglogsettings.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS = QtMocHelpers::stringData(
    "DialogLogSettings",
    "on_buttonGroup_buttonReleased",
    "",
    "arg1",
    "showEvent",
    "QShowEvent*",
    "event"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS_t {
    uint offsetsAndSizes[14];
    char stringdata0[18];
    char stringdata1[30];
    char stringdata2[1];
    char stringdata3[5];
    char stringdata4[10];
    char stringdata5[12];
    char stringdata6[6];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS_t qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS = {
    {
        QT_MOC_LITERAL(0, 17),  // "DialogLogSettings"
        QT_MOC_LITERAL(18, 29),  // "on_buttonGroup_buttonReleased"
        QT_MOC_LITERAL(48, 0),  // ""
        QT_MOC_LITERAL(49, 4),  // "arg1"
        QT_MOC_LITERAL(54, 9),  // "showEvent"
        QT_MOC_LITERAL(64, 11),  // "QShowEvent*"
        QT_MOC_LITERAL(76, 5)   // "event"
    },
    "DialogLogSettings",
    "on_buttonGroup_buttonReleased",
    "",
    "arg1",
    "showEvent",
    "QShowEvent*",
    "event"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSDialogLogSettingsENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   26,    2, 0x08,    1 /* Private */,
       4,    1,   29,    2, 0x08,    3 /* Private */,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, 0x80000000 | 5,    6,

       0        // eod
};

Q_CONSTINIT const QMetaObject DialogLogSettings::staticMetaObject = { {
    QMetaObject::SuperData::link<QDialog::staticMetaObject>(),
    qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSDialogLogSettingsENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<DialogLogSettings, std::true_type>,
        // method 'on_buttonGroup_buttonReleased'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'showEvent'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QShowEvent *, std::false_type>
    >,
    nullptr
} };

void DialogLogSettings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DialogLogSettings *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->on_buttonGroup_buttonReleased((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 1: _t->showEvent((*reinterpret_cast< std::add_pointer_t<QShowEvent*>>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject *DialogLogSettings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DialogLogSettings::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSDialogLogSettingsENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QDialog::qt_metacast(_clname);
}

int DialogLogSettings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 2;
    }
    return _id;
}
QT_WARNING_POP