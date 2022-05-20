#ifndef GETINFO_H
#define GETINFO_H
#include<QObject>
#include<QFile>
class GetInfo:public QObject
{
Q_OBJECT

public:
    GetInfo();



public slots:
   bool getisfrist();
   QString getsoftwear();
private:
bool _isfrist;

};

#endif // GETINFO_H
