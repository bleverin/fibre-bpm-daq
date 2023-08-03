/****************************************************************************
** Meta object code from reading C++ file 'dialogprofiler.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../hit2023/dialogprofiler.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dialogprofiler.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSDialogProfilerENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSDialogProfilerENDCLASS = QtMocHelpers::stringData(
    "DialogProfiler",
    "onHistogramCompleted",
    "",
    "on_pushRun_pressed",
    "on_pushSave_pressed",
    "on_pushRunOnce_pressed",
    "on_pushRunInfinite_pressed",
    "on_pushClear_pressed"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSDialogProfilerENDCLASS_t {
    uint offsetsAndSizes[16];
    char stringdata0[15];
    char stringdata1[21];
    char stringdata2[1];
    char stringdata3[19];
    char stringdata4[20];
    char stringdata5[23];
    char stringdata6[27];
    char stringdata7[21];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSDialogProfilerENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSDialogProfilerENDCLASS_t qt_meta_stringdata_CLASSDialogProfilerENDCLASS = {
    {
        QT_MOC_LITERAL(0, 14),  // "DialogProfiler"
        QT_MOC_LITERAL(15, 20),  // "onHistogramCompleted"
        QT_MOC_LITERAL(36, 0),  // ""
        QT_MOC_LITERAL(37, 18),  // "on_pushRun_pressed"
        QT_MOC_LITERAL(56, 19),  // "on_pushSave_pressed"
        QT_MOC_LITERAL(76, 22),  // "on_pushRunOnce_pressed"
        QT_MOC_LITERAL(99, 26),  // "on_pushRunInfinite_pressed"
        QT_MOC_LITERAL(126, 20)   // "on_pushClear_pressed"
    },
    "DialogProfiler",
    "onHistogramCompleted",
    "",
    "on_pushRun_pressed",
    "on_pushSave_pressed",
    "on_pushRunOnce_pressed",
    "on_pushRunInfinite_pressed",
    "on_pushClear_pressed"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSDialogProfilerENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x0a,    1 /* Public */,
       3,    0,   51,    2, 0x08,    2 /* Private */,
       4,    0,   52,    2, 0x08,    3 /* Private */,
       5,    0,   53,    2, 0x08,    4 /* Private */,
       6,    0,   54,    2, 0x08,    5 /* Private */,
       7,    0,   55,    2, 0x08,    6 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

Q_CONSTINIT const QMetaObject DialogProfiler::staticMetaObject = { {
    QMetaObject::SuperData::link<QDialog::staticMetaObject>(),
    qt_meta_stringdata_CLASSDialogProfilerENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSDialogProfilerENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSDialogProfilerENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<DialogProfiler, std::true_type>,
        // method 'onHistogramCompleted'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushRun_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushSave_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushRunOnce_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushRunInfinite_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'on_pushClear_pressed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void DialogProfiler::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DialogProfiler *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->onHistogramCompleted(); break;
        case 1: _t->on_pushRun_pressed(); break;
        case 2: _t->on_pushSave_pressed(); break;
        case 3: _t->on_pushRunOnce_pressed(); break;
        case 4: _t->on_pushRunInfinite_pressed(); break;
        case 5: _t->on_pushClear_pressed(); break;
        default: ;
        }
    }
    (void)_a;
}

const QMetaObject *DialogProfiler::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DialogProfiler::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSDialogProfilerENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QDialog::qt_metacast(_clname);
}

int DialogProfiler::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
