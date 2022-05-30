#include "collect.h"

static QFile _file;
static QDomDocument _dom;
static QList<worddat> _dat;
Collect::Collect()
{


    _file.setFileName("UserData/UserBook/CollectInfo.xml");
   if(!_file.open(QIODevice::ReadOnly))
    {
       _file.open(QIODevice::WriteOnly);
       _dom.appendChild(_dom.createElement("Root"));
       _file.write(_dom.toString().toUtf8());
       _file.close();
    }

 _file.close();

   loaddata();





}


void Collect::loaddata()
{
    _file.open(QIODevice::ReadOnly);
    _dat.clear();
    _dom.setContent(&_file);

    QDomNode f=_dom.firstChild().firstChild();
    while(!f.isNull())
    {
        worddat temp;
        temp.year=f.toElement().attribute("Year").toInt();
        temp.month=f.toElement().attribute("Month").toInt();
        temp.day=f.toElement().attribute("Day").toInt();

        temp._word._word=f.firstChild().toElement().text();
        temp._word._trans =f.firstChild().nextSibling().toElement().text();
        temp._word._phonetic=f.firstChild().nextSibling().nextSibling().toElement().text();
        _dat.push_front(temp);
        f=f.nextSibling();
    }
    _file.close();


}

bool Collect::iscollected(QString word)
{

  for(auto i=_dat.begin();i!=_dat.end();++i)
  {
    if(i->_word._word==word)
    {
        return true;
    }
  }



    return false;
}

void Collect::collect(QString _word, QString trans,QString phonetic,int progress)
{



        QDate date;
        unsigned int year=date.currentDate().year();
        unsigned int month=date.currentDate().month();
        unsigned int day=date.currentDate().day();
        worddat dat;


        //写入到内部文件
        dat._word._word=_word;
        dat._word._phonetic=phonetic;
        dat._word._trans=trans;
        dat.year=year;
        dat.month=month;
        dat.day=day;
        _dat.push_front(dat);


        //写入到XML文件
         _file.setFileName("UserData/UserBook/CollectInfo.xml");
        _file.open(QIODevice::ReadWrite);
        _dom.setContent(&_file);
        _file.close();
        QDomElement word=_dom.createElement("Word");
        word.setAttribute("Year",year);
        word.setAttribute("Month",month);
        word.setAttribute("Day",day);
        _dom.appendChild(word);

        QDomElement text=_dom.createElement("Text");
        text.appendChild(_dom.createTextNode(_word));
        text.setAttribute("Progress",progress);
        word.appendChild(text);

        QDomElement t=_dom.createElement("Trans");
        t.appendChild(_dom.createTextNode(trans));
        word.appendChild(t);

        QDomElement p=_dom.createElement("Phonetic");
        t.appendChild(_dom.createTextNode(phonetic));
        word.appendChild(p);


        _dom.firstChild().appendChild(word);
        _file.open(QIODevice::WriteOnly);
        _file.write(_dom.toString().toUtf8());
        _file.close();

        //发送收藏完成的信号
        emit collected(_word,trans,phonetic,progress);

}

void  Collect::remove(QString word)
{




    //xml移除节点

    _file.setFileName("UserData/UserBook/CollectInfo.xml");
   _file.open(QIODevice::ReadWrite);
   _dom.setContent(&_file);
   _file.close();




   QDomNode root=_dom.firstChild();

   QDomNode f=root.firstChild();
   while(!f.isNull())
   {
       if(f.firstChild().toElement().text()==word)
       {
              root.removeChild(f);
              _file.open(QIODevice::WriteOnly);
              _file.write(_dom.toString().toUtf8());
              _file.close();
              emit removed(word);//发送移除信号
              loaddata();
              return;
       }
   f=f.nextSibling();
   }



}


QString Collect::getdat(int index,QString type)
{

    if(index>=_dat.length()) return "";
    if(type=="word")return _dat[index]._word._word;
    if(type=="trans") return _dat[index]._word._trans;
    if(type=="phonetic")return _dat[index]._word._phonetic;
    if(type=="progress")return QString("%1").arg(_dat[index]._word._progress);
    if(type=="date")return  QString("%1/%2/%3").arg(_dat[index].year).arg(_dat[index].month).arg(_dat[index].day);

    return "";
}

int Collect::length()
{

    return _dat.length();
}
