#include "wordfilesystem.h"

WordFileSystem::WordFileSystem()
{

}
WordFileSystem::WordFileSystem(QString file)
{

    _file.setFileName(file);
    if(_file.open(QIODevice::ReadOnly))
    {
           _dom.setContent(&_file);

           //获取根节点
           QDomNode root=_dom.firstChild();
           QDomNode fristnode=root.firstChild();

           QDomNode temp=fristnode;
           int count=0;
           while(!temp.isNull())
           {
               count++;
               Parsingnode(temp);
               temp=temp.nextSibling();
           }

           qDebug()<<_wordlist.length();

    }else
    {


        qDebug()<<"文件打开失败";
    }




}

 void WordFileSystem::Parsingnode(QDomNode node)
 {


      QDomNode item = node.firstChild();

      Word word;
      while(!item.isNull())
      {
          if(item.nodeName()=="word")
          {
           word._word=item.toElement().text();

          }else if(item.nodeName()=="trans")
          {
            word._trans=item.toElement().text();
          }else if(item.nodeName()=="phonetic")
          {
            word._phonetic=item.toElement().text();
          }else if(item.nodeName()=="tags")
          {
            word._tags=item.toElement().text();
          }else if(item.nodeName()=="progress")
          {
            word._progress=item.toElement().text().toInt();
          }
          item=item.nextSibling();
      }

    _wordlist<<word;

 }
    QVector<Word>WordFileSystem::getwordlist()
    {

        return _wordlist;
    }


