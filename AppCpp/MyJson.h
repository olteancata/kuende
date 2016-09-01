#ifndef MYJSON_H
#define MYJSON_H
#include <QNetworkReply>
#include <QObject>
#include <QNetworkRequest>
#include <QUrl>
#include <QEventLoop>
#include <QNetworkAccessManager>
#include <RWFile.h>

using namespace std;

class MyJson
{
public:
    MyJson();
    string getJson();
};

#endif // MYJSON_H
