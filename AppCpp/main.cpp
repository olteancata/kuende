#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtGui>
#include <QtQml>
#include <QQmlComponent>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <MyModel.h>
#include <MyModelList.h>

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    ////////
    qmlRegisterType <MyElement>();
    QQmlApplicationEngine engine;
    MyModelList *myModelList = new MyModelList;
    myModelList->addElements();

    engine.rootContext()->setContextProperty("str", new MyModel);
    engine.rootContext()->setContextProperty("myList", myModelList);
    QQmlComponent component(&engine, QUrl::fromLocalFile("Element.qml"));
    component.create();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
