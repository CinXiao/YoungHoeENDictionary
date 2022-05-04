#include "getbookword.h"

GetBookWord::GetBookWord()
{






}

  QString GetBookWord::insbookinfo(QString filepath,QString bookname,QString writername,QString color)
  {
      QDomDocument dom;
      QFile file("UserData/UserSeting/BookInfo.xml");
      if(!file.open(QIODevice::ReadOnly))
      {
         return "文件打开失败";
      }

      file.close();
      file.open(QIODevice::ReadWrite);

     /*信息重新写入文件*/
      /*（暂时不修改源文件）*/



      /*修改文件引导文件*/
      dom.setContent(&file);

      file.close();
      //获取单个单词本节点信息
      QDomNode item=dom.firstChild().firstChild();


      while(!item.isNull())
      {

          //路径相同，修改值
          if(item.firstChild().nextSibling().nextSibling().toElement().text()==filepath)
          {

              /*移除节点*/
              item.removeChild(item.firstChild());
              item.removeChild(item.firstChild());
              item.removeChild(item.firstChild());
              item.removeChild(item.firstChild());

              //重新生成节点
              QDomNode booknamenode=dom.createElement("BookName");
              booknamenode.appendChild(dom.createTextNode(bookname));
              QDomNode writenode=dom.createElement("WriterName");
               writenode.appendChild(dom.createTextNode(writername));
               QDomNode pathnode=dom.createElement("BookPath");
                pathnode.appendChild(dom.createTextNode(filepath));
                QDomNode colornode=dom.createElement("BookColor");
                colornode.appendChild(dom.createTextNode(color));
               item.appendChild(booknamenode);
               item.appendChild(writenode);
               item.appendChild(pathnode);
               item.appendChild(colornode);

              file.open(QIODevice::ReadWrite);
              file.write(dom.toString().toUtf8());
               return "修改成功,【颜色】重启软件生效";
          }
          item=item.nextSibling();
      }

    return "修改失败,原因未知";
  }

   QString  GetBookWord::getphonetic(int index)
   {

       return _words[index]._phonetic;
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
