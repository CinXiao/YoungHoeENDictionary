#include "getbookword.h"

GetBookWord::GetBookWord()
{






}

 QString  GetBookWord::getword(int index)
{

    return _words[index]._word;
}
 QString  GetBookWord::gettrans(int index)
{

    return _words[index]._trans;
}


void GetBookWord::openbook(QString path)
{
    _words.clear();
    _file.setFileName(path);
    _file.open(QIODevice::ReadOnly);
    _dom.setContent(&_file);

    //装载单词
    QDomNode p=_dom.firstChild().firstChild();
    while(!p.isNull())
    {
        QDomNode temp=p.firstChild();
        QString t[5];
        for(unsigned int i=0;i<5;++i)
        {
            t[i]=temp.toElement().text();
            temp=temp.nextSibling();
        }
        _words<<Word(t[0],t[1],t[2],t[3],t[4].toInt());
        p=p.nextSibling();
    }

    //装载完成

    qDebug()<<_words.count();
    _file.close();
}

int GetBookWord::count()
{
    return _words.count();
}
void GetBookWord::test()
{


    _words.clear();


}
