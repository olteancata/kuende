#include "RWFile.h"
#include <fstream>

RWFile::RWFile()
{

}

void RWFile::write(string text)
{
    QString filename = "/Users/oltean.cata/Desktop/Data.txt";
    QFile file(filename);
    if (file.open(QIODevice::ReadWrite)) {
        qDebug() << "Data was written in the file!";
        QTextStream stream(&file);
        QString toFile = QString::fromStdString(text);
        stream << toFile;
    }
    else
        qDebug() << "RWFile::write() -> Cannot open file!";
}

string RWFile::read()
{
    QFile filename("/Users/oltean.cata/Desktop/Data.txt");
    QString data;
    if (filename.open(QIODevice::ReadOnly))
    {
        QTextStream in(&filename);
        while (!in.atEnd())
            data.append(in.readLine());
        qDebug() << "data: " + data;
        filename.close();
    }
    else
        qDebug() << "RWFile::read() -> Cannot open file!";

    return data.toStdString();
}


