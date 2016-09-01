#ifndef MYLIST_H
#define MYLIST_H

#include <QObject>
#include <QNetworkReply>
#include <QMap>

class MyElement : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString thumbnail READ thumbnail WRITE setThumbnail NOTIFY thumbnailChanged)
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString ups READ ups WRITE setUps NOTIFY upsChanged)
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QString subreddit READ subreddit WRITE setSubreddit NOTIFY subredditChanged)
    Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)

    QString m_url;

    QString m_title;

    QString m_ups;

    QString m_author;

    QString m_subreddit;

    QString m_thumbnail;

    QString m_color;

public:

    explicit MyElement(QString url, QString title, QString ups, QString author, QString subreddit, QString thumbnail, QString color);

    QString url() const
    {
        return m_url;
    }

    QString title() const
    {
        return m_title;
    }

    QString ups() const
    {
        return m_ups;
    }

    QString author() const
    {
        return m_author;
    }

    QString subreddit() const
    {
        return m_subreddit;
    }

    QString thumbnail() const
    {
        return m_thumbnail;
    }

    QString color() const
    {
        return m_color;
    }

public slots:

    void setUrl(QString url)
    {
        if (m_url == url)
            return;

        m_url = url;
        emit urlChanged(url);
    }

    void setTitle(QString title)
    {
        if (m_title == title)
            return;

        m_title = title;
        emit titleChanged(title);
    }

    void setUps(QString ups)
    {
        if (m_ups == ups)
            return;

        m_ups = ups;
        emit upsChanged(ups);
    }

    void setAuthor(QString author)
    {
        if (m_author == author)
            return;

        m_author = author;
        emit authorChanged(author);
    }

    void setSubreddit(QString subreddit)
    {
        if (m_subreddit == subreddit)
            return;

        m_subreddit = subreddit;
        emit subredditChanged(subreddit);
    }

    void setThumbnail(QString thumbnail)
    {
        if (m_thumbnail == thumbnail)
            return;

        m_thumbnail = thumbnail;
        emit thumbnailChanged(thumbnail);
    }

    void setColor(QString color)
    {
        if (m_color == color)
            return;

        m_color = color;
        emit colorChanged(color);
    }

signals:
    void urlChanged(QString url);
    void titleChanged(QString title);
    void upsChanged(QString ups);
    void authorChanged(QString author);
    void subredditChanged(QString subreddit);
    void thumbnailChanged(QString thumbnail);
    void colorChanged(QString color);
};

#endif // MYLIST_H
