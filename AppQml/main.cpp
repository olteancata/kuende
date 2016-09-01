#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtGui>
#include <QtQml>
#include <QQmlComponent>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <MyModel.h>


int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    ////////
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("str", new MyModel);
    QQmlComponent component(&engine, QUrl::fromLocalFile("Element.qml"));
    component.create();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
