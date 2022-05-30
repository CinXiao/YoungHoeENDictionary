#include "getinfo.h"

GetInfo::GetInfo()
{

}


   QString GetInfo::getsoftwear()
   {

       QFile f("Data/sortwearinfo.dat");
       f.open(QIODevice::ReadOnly);
       QString info=f.readAll();
        f.close();
        return info;
   }

bool GetInfo::getisfrist()
{

    QFile f("UserData/UserSeting/isfrist");
    if(f.open(QIODevice::ReadOnly))
    {
     _isfrist=false;

    }else
    {
    _isfrist=true;
    f.open(QIODevice::ReadWrite);

    }

     f.close();
        return _isfrist;
}
