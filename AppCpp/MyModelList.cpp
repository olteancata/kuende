#include "MyModelList.h"

using namespace std;

void    MyModelList::addNewElement(MyElement *elem)
{
    this->m_myModelList.append(static_cast<QObject*>(elem));
    qDebug() << "New element was added!";
    qDebug() << this->m_myModelList.size();
    emit myModelListChanged(this->myModelList());
}

int    MyModelList::size()
{
    return this->myModelList().size();
}

void    MyModelList::addElements()
{

    Json::Value root;
    Json::Reader reader;
    Json::Value rootFile;
    MyJson *myJson = new MyJson();
    bool parsingFileSuccessful = reader.parse(RWFile::read(), rootFile );
    bool parsingSuccessful = reader.parse(myJson->getJson(), root );

    if ( !parsingFileSuccessful )
    {
        cout  << "\n\n\n Json Error  -> Failed to parse file! \n\n\n" << reader.getFormattedErrorMessages();
        return;
    }
    else if ( !parsingSuccessful )
    {
        cout  << "\n\n\n Json Error -> Failed to parse request! \n\n\n" << reader.getFormattedErrorMessages();
        return;
    }
    else
    {
        Json::Value value = root["data"]["children"];
        Json::Value valueFile = rootFile["data"]["children"];

        for (unsigned int index = 0; index < value.size(); ++index )
        {
            qDebug() << index << ":";
            if (QString::fromStdString(value[index]["data"]["thumbnail"].asString()) == QString("") ||
                    QString::fromStdString(value[index]["data"]["thumbnail"].asString()) == QString("self") ||
                    QString::fromStdString(value[index]["data"]["thumbnail"].asString()) == QString("nsfw"))
                value[index]["data"]["thumbnail"] = "qrc:/ProjectResources/placeholder_purchase_icon@2x-fe3b08515247cd8b389dac40d2a4251cae186bc7c090dbd918bf8a7be54bdb3e.png";

            value[index]["data"]["color"] = "#ffffff";
            for (unsigned int index2 = 0; index2 < valueFile.size(); ++index2 )
            {
                if (QString::fromStdString(valueFile[index2]["data"]["title"].asString()) ==
                        QString::fromStdString(value[index]["data"]["title"].asString()))
                {
                    qDebug() << index << " vs " << index2;
                    if (index == index2)
                        value[index]["data"]["color"] = "#ffff00";
                    else if (index > index2)
                        value[index]["data"]["color"] = "#00ff00";
                    else if (index < index2)
                        value[index]["data"]["color"] = "#ff0000";
                    break;
                }
            }
            qDebug() << "color     : " << QString::fromStdString(value[index]["data"]["color"].asString());
            qDebug() << "url       : " << QString::fromStdString(value[index]["data"]["url"].asString());
            qDebug() << "title     : " << QString::fromStdString(value[index]["data"]["title"].asString());
            qDebug() << "ups       : " << QString::fromStdString(value[index]["data"]["ups"].asString());
            qDebug() << "author    : " << QString::fromStdString(value[index]["data"]["author"].asString());
            qDebug() << "subreddit : " << QString::fromStdString(value[index]["data"]["subreddit"].asString());
            qDebug() << "thumbnail : " << QString::fromStdString(value[index]["data"]["thumbnail"].asString());

            MyElement* elem = new MyElement(
                        QString::fromStdString(value[index]["data"]["url"].asString()),
                    QString::fromStdString(value[index]["data"]["title"].asString()),
                    QString::fromStdString(value[index]["data"]["ups"].asString()),
                    QString::fromStdString(value[index]["data"]["author"].asString()),
                    QString::fromStdString(value[index]["data"]["subreddit"].asString()),
                    QString::fromStdString(value[index]["data"]["thumbnail"].asString()),
                    QString::fromStdString(value[index]["data"]["color"].asString()));

            this->addNewElement(elem);
        }
    }
}


MyModelList::MyModelList(QObject *parent) : QObject(parent)
{
    qDebug() << "New MyModelList was created!";
}
