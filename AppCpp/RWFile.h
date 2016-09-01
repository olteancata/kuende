#ifndef RWFILE_H
#define RWFILE_H
#include <string>
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QString>

using namespace std;

class RWFile
{
public:
    RWFile();
    public:
            static string read();
            static void write(string text);
};

#endif // RWFILE_H
