/****************************************************************************
** Meta object code from reading C++ file 'display.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../display.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'display.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSDisplayENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSDisplayENDCLASS = QtMocHelpers::stringData(
    "Display",
    "showEvent",
    "",
    "QShowEvent*",
    "event",
    "onButtonClicked",
    "QAbstractButton*",
    "button",
    "onSaveBackgroundClicked",
    "onLoadBackgroundClicked",
    "onCheckBoxStateChanged",
    "state",
    "onSaveCalibrationClicked",
    "onLoadCalibrationClicked",
    "onCalibrationCheckBoxChanged",
    "onExpertModeStateChanged"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSDisplayENDCLASS_t {
    uint offsetsAndSizes[32];
    char stringdata0[8];
    char stringdata1[10];
    char stringdata2[1];
    char stringdata3[12];
    char stringdata4[6];
    char stringdata5[16];
    char stringdata6[17];
    char stringdata7[7];
    char stringdata8[24];
    char stringdata9[24];
    char stringdata10[23];
    char stringdata11[6];
    char stringdata12[25];
    char stringdata13[25];
    char stringdata14[29];
    char stringdata15[25];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSDisplayENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSDisplayENDCLASS_t qt_meta_stringdata_CLASSDisplayENDCLASS = {
    {
        QT_MOC_LITERAL(0, 7),  // "Display"
        QT_MOC_LITERAL(8, 9),  // "showEvent"
        QT_MOC_LITERAL(18, 0),  // ""
        QT_MOC_LITERAL(19, 11),  // "QShowEvent*"
        QT_MOC_LITERAL(31, 5),  // "event"
        QT_MOC_LITERAL(37, 15),  // "onButtonClicked"
        QT_MOC_LITERAL(53, 16),  // "QAbstractButton*"
        QT_MOC_LITERAL(70, 6),  // "button"
        QT_MOC_LITERAL(77, 23),  // "onSaveBackgroundClicked"
        QT_MOC_LITERAL(101, 23),  // "onLoadBackgroundClicked"
        QT_MOC_LITERAL(125, 22),  // "onCheckBoxStateChanged"
        QT_MOC_LITERAL(148, 5),  // "state"
        QT_MOC_LITERAL(154, 24),  // "onSaveCalibrationClicked"
        QT_MOC_LITERAL(179, 24),  // "onLoadCalibrationClicked"
        QT_MOC_LITERAL(204, 28),  // "onCalibrationCheckBoxChanged"
        QT_MOC_LITERAL(233, 24)   // "onExpertModeStateChanged"
    },
    "Display",
    "showEvent",
    "",
    "QShowEvent*",
    "event",
    "onButtonClicked",
    "QAbstractButton*",
    "button",
    "onSaveBackgroundClicked",
    "onLoadBackgroundClicked",
    "onCheckBoxStateChanged",
    "state",
    "onSaveCalibrationClicked",
    "onLoadCalibrationClicked",
    "onCalibrationCheckBoxChanged",
    "onExpertModeStateChanged"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSDisplayENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   68,    2, 0x0a,    1 /* Public */,
       5,    1,   71,    2, 0x0a,    3 /* Public */,
       8,    0,   74,    2, 0x0a,    5 /* Public */,
       9,    0,   75,    2, 0x0a,    6 /* Public */,
      10,    1,   76,    2, 0x0a,    7 /* Public */,
      12,    0,   79,    2, 0x0a,    9 /* Public */,
      13,    0,   80,    2, 0x0a,   10 /* Public */,
      14,    1,   81,    2, 0x0a,   11 /* Public */,
      15,    1,   84,    2, 0x0a,   13 /* Public */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 6,    7,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   11,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   11,
    QMetaType::Void, QMetaType::Int,   11,

       0        // eod
};

Q_CONSTINIT const QMetaObject Display::staticMetaObject = { {
    QMetaObject::SuperData::link<QDialog::staticMetaObject>(),
    qt_meta_stringdata_CLASSDisplayENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSDisplayENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSDisplayENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Display, std::true_type>,
        // method 'showEvent'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QShowEvent *, std::false_type>,
        // method 'onButtonClicked'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QAbstractButton *, std::false_type>,
        // method 'onSaveBackgroundClicked'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onLoadBackgroundClicked'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onCheckBoxStateChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'onSaveCalibrationClicked'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onLoadCalibrationClicked'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onCalibrationCheckBoxChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'onExpertModeStateChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void Display::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Display *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->showEvent((*reinterpret_cast< std::add_pointer_t<QShowEvent*>>(_a[1]))); break;
        case 1: _t->onButtonClicked((*reinterpret_cast< std::add_pointer_t<QAbstractButton*>>(_a[1]))); break;
        case 2: _t->onSaveBackgroundClicked(); break;
        case 3: _t->onLoadBackgroundClicked(); break;
        case 4: _t->onCheckBoxStateChanged((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 5: _t->onSaveCalibrationClicked(); break;
        case 6: _t->onLoadCalibrationClicked(); break;
        case 7: _t->onCalibrationCheckBoxChanged((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 8: _t->onExpertModeStateChanged((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QAbstractButton* >(); break;
            }
            break;
        }
    }
}

const QMetaObject *Display::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Display::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSDisplayENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QDialog::qt_metacast(_clname);
}

int Display::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
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
QT_WARNING_POP
