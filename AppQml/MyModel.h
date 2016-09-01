#ifndef MYMODEL_H
#define MYMODEL_H

#include <QString>
#include <QObject>
#include <QtQml>

class MyModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList data READ data WRITE setData NOTIFY dataChanged)
public:
    Q_INVOKABLE void appendNewRandomQString();
    MyModel();
    void setData(const QStringList &a) {
        if (a != m_data) {
            m_data = a;
            emit dataChanged();
        }
    }
    QStringList data() const {
        return m_data;
    }
signals:
    void dataChanged();
private:
    QStringList m_data;
};

#endif // MYMODEL_H
