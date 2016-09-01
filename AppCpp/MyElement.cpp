#include "MyElement.h"

MyElement::MyElement(QString url, QString title, QString ups, QString author, QString subreddit, QString thumbnail, QString color)
{
    this->setUrl(url);
    this->setTitle(title);
    this->setUps(ups);
    this->setAuthor(author);
    this->setSubreddit(subreddit);
    this->setThumbnail(thumbnail);
    this->setColor(color);

    qDebug() << "New MyElement was created!";
}
