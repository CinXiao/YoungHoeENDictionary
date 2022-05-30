#include"wordbooks.h"



WordBooks::WordBooks()
{

 init();
}

void WordBooks::init()
{
    //创建用户文件夹
    QDir dir;
    if(!dir.exists("UserData"))
    {
        dir.mkdir("UserData");
        dir.setPath("UserData");
        dir.mkdir("UserInfo");      //用户信息
        dir.mkdir("UserSeting");    //用户设置
        dir.mkdir("UserBook");      //用户词典
    }



   //打开用户单词本设置
   QFile file("UserData/UserSeting/BookInfo.xml");
   if(!file.open(QIODevice::ReadOnly))
   {
       /*
       *首次运行初始化
       *
       */
        file.open(QIODevice::WriteOnly);

        //获取系统单词本文件写入词典文信息
        dir.setPath("SystemWordBooks");//设置路径为系统单词本文件夹
        QStringList filelist=dir.entryList(QDir::Files);
        for(int i=0;i<filelist.length();++i)
        {

            qDebug()<<filelist[i];

        }

        //写入单词本文件信息
        QDomDocument dom;
        QDomNode root=dom.createElement("Root");

        for(int i=0;i<filelist.length();++i)
        {

        QDomNode book=dom.createElement("Book");
        QDomNode bookname=dom.createElement("BookName");
        QFileInfo fileinfo(filelist[i]);
         if(fileinfo.baseName()=="Core")continue;
        bookname.appendChild(dom.createTextNode(fileinfo.baseName()));

        book.appendChild(bookname);

        QDomNode writername=dom.createElement("WriterName");
        writername.appendChild(dom.createTextNode("System"));
        book.appendChild(writername);

        QDomNode bookpath=dom.createElement("BookPath");
        bookpath.appendChild(dom.createTextNode("SystemWordBooks/"+filelist[i]));
        book.appendChild(bookpath);

        QDomNode bookcolor=dom.createElement("BookColor");
        bookcolor.appendChild(dom.createTextNode("#5A5882"));
        book.appendChild(bookcolor);

        root.appendChild(book);
        }

        dom.appendChild(root);
        file.write(dom.toString().toUtf8());

   }

  file.close();

   initbookinfo();

}


void WordBooks::initbookinfo()
{
    QFile bookinfofile("UserData/UserSeting/BookInfo.xml");
    QDomDocument dom;
    dom.setContent(&bookinfofile);

    //获取根节点
    QDomNode root=dom.firstChild();
    QDomNode fristnode=root.firstChild();

    QDomNode node=fristnode;
    while(!node.isNull())
    {
        Parsingnode(node);
        node=node.nextSibling();

    }
    bookinfofile.close();
}




void WordBooks::Parsingnode(QDomNode node)
{
     QDomNode item = node.firstChild();
     BookInfo book;
     while(!item.isNull())
     {
         if(item.nodeName()=="BookName")
         {
         book.name=item.toElement().text();

         }else if(item.nodeName()=="WriterName")
         {
           book.writer=item.toElement().text();
         }else if(item.nodeName()=="BookPath")
         {
           book.path=item.toElement().text();
         }else if(item.nodeName()=="BookColor")
         {
           book.color=item.toElement().text();
         }

         item=item.nextSibling();
     }
    _books<<book;
}


 QString WordBooks::getbookinfo(int index,QString type)
 {
     if(index>=_books.count())
     {
         return "NAN";
     }

     if(type=="name")
     {
         return _books[index].name;
     }else if(type=="writer")
     {
         return _books[index].writer;
     }else if(type=="path")
     {
         return _books[index].path;
     }else if(type=="color")
     {
         return _books[index].color;
     }
     return "NAN";
 }

void WordBooks::getbookwordsinfo()
{


}


int WordBooks::getbookcount()
{
    return _books.count();
}

WordBooks::~WordBooks()
{



}


