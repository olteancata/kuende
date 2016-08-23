#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtGui>
#include <QtQml>

#include "roleentrymodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<RoleEntryModel>("org.example", 1, 0, "RoleEntryModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
