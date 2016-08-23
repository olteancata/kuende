#include "roleentrymodel.h"

QString GetRandomString()
{
   const QString possibleCharacters("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
   const int randomStringLength = qrand() % 1000; // assuming you want random strings of 12 characters

   QString randomString;
   for(int i=0; i<randomStringLength; ++i)
   {
       int index = qrand() % possibleCharacters.length();
       QChar nextChar = possibleCharacters.at(index);
       randomString.append(nextChar);
   }
   return randomString;
}

RoleEntryModel::RoleEntryModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_roleNames[RandomString] = "randomstring";

    for (int i = 0; i < 10; i++)
    {
        m_randomstring.append(GetRandomString());
    }

}

RoleEntryModel::~RoleEntryModel()
{
}


int RoleEntryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_randomstring.count();
}

QVariant RoleEntryModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 || row >= m_randomstring.count()) {
        return QVariant();
    }
    const QString string = m_randomstring.at(row);
    switch(role) {
    case RandomString:
        //string.randomstring();
        break;
    }
    return QVariant();
}

QHash<int, QByteArray> RoleEntryModel::roleNames() const
{
    return m_roleNames;
}
