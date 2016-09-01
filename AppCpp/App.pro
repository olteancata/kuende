TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    MyModel.cpp \
    dist/jsoncpp.cpp \
    MyModelList.cpp \
    MyElement.cpp \
    RWFile.cpp \
    MyJson.cpp \
    MyJsonComparable.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    roleentrymodel.qml

HEADERS += \
    MyModel.h \
    dist/json/json-forwards.h \
    dist/json/json.h \
    MyModelList.h \
    MyElement.h \
    RWFile.h \
    MyJson.h \
    MyJsonComparable.h
