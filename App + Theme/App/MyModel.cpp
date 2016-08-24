#include "MyModel.h"
#include <cstdlib>

QString GetRandomString()
{
   const QString possibleCharacters("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
   const int randomStringLength = rand() % 500;

   QString randomString;
   for(int i=0; i < randomStringLength; ++i)
   {
       int index = rand() % possibleCharacters.length();
       QChar nextChar = possibleCharacters.at(index);
       randomString.append(nextChar);
   }
   return randomString;
}

MyModel::MyModel()
{
    this->m_data << GetRandomString() << GetRandomString();
}

void MyModel::appendNewRandomQString()
{
    this->m_data << GetRandomString();
}
