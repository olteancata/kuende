#ifndef MYMODELLIST_H
#define MYMODELLIST_H
#include <QObject>
#include <MyElement.h>
#include <RWFile.h>
#include <QNetworkAccessManager>
#include <QEventLoop>
#include <QDebug>
#include <QUrl>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrlQuery>
#include <qjsonobject.h>
#include <QVariant>
#include <qjsonarray.h>
#include <QStringList>
#include <QString>
#include <QJsonValue>
#include <QJsonDocument>
#include <dist/json/json.h>
#include "MyElement.h"
#include <iostream>
#include "MyJson.h"
#include <QColor>


class MyModelList: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QObject*> myModelList READ myModelList WRITE setMyModelList NOTIFY myModelListChanged)

    QList<QObject*> m_myModelList;

public:
    explicit MyModelList(QObject *parent = 0);
    Q_INVOKABLE int size();
    void addElements();
    void addNewElement(MyElement *elem);


    QList<QObject*> myModelList() const
    {
        return m_myModelList;
    }

public slots:

    void setMyModelList(QList<QObject*> myModelList)
    {
        if (m_myModelList == myModelList)
            return;

        m_myModelList = myModelList;
        emit myModelListChanged(myModelList);
    }

signals:
    void myModelListChanged(QList<QObject*> myModelList);
};

#endif // MYMODELLIST_H
