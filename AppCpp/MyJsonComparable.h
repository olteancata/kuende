#ifndef MYJSONCOMPARABLE_H
#define MYJSONCOMPARABLE_H
#include <dist/json/json.h>

using namespace std;

class MyJsonComparable
{
public:
    MyJsonComparable();
    static string jsonCompare(string json1, string json2);
};

#endif // MYJSONCOMPARABLE_H
