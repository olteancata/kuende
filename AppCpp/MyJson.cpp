#include "MyJson.h"

MyJson::MyJson()
{

}

string  MyJson::getJson()
{
    QEventLoop eventLoop;
    QNetworkAccessManager mgr;
    QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));
    QNetworkRequest req( QUrl( QString("http://www.reddit.com/.json") ) );
    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec();
    string data = QString(reply->readAll()).toStdString();
    RWFile::write(data);
    return data;
}
