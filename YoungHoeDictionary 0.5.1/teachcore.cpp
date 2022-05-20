#include "teachcore.h"

TeachCore::TeachCore()
{

    QFile f(_infofilename);


        //写入教材文件引导表
        f.open(QIODevice::WriteOnly);
        QDomDocument dom;
        QDir dir;
        dir.setPath("TeachingMaterials");
        QStringList filterlist=dir.entryList(dir.filter() | QDir::NoDotAndDotDot);
        //写入主菜单
        for(int i=0;i<filterlist.length();++i)
        {
           _menu.push_back(filterlist[i]);
        }

        //xml文件构建部分///////////
        /*************************/

        QDomElement root=dom.createElement("ROOT");

        for(int i=0;i<getmenucount();++i)
        {

            QDomElement menu=dom.createElement("MENU");

            QDomElement menuname=dom.createElement("NAME");
            menuname.appendChild(dom.createTextNode(_menu[i]));
            menu.appendChild(menuname);

            //章节部分
            dir.setPath("TeachingMaterials/"+_menu[i]);
            QStringList chapterlist=dir.entryList(dir.filter() | QDir::NoDotAndDotDot);


                for(int i=0;i<chapterlist.count();++i)
                {
                    QDomElement chapter=dom.createElement("CHAPTER");
                    chapter.appendChild(dom.createTextNode(chapterlist[i]));
                    menu.appendChild(chapter);
                }

            root.appendChild(menu);
        }



        dom.appendChild(root);

        //写入
        f.write(dom.toString().toUtf8());



    f.close();


}

QString TeachCore::getaudiourl()
{


return _audiourl;
}


void TeachCore::initactive(QString menu)
{
        _active.clear();
        QFile f(_infofilename);
        QDomDocument dom;
        dom.setContent(&f);

        QDomNode root=dom.firstChildElement();

        QDomNode finder=root.firstChildElement();
        while(!finder.isNull())
        {
           if(finder.firstChild().toElement().text()==menu)
           {
               QDomNode item=finder.firstChild().nextSibling();


               while(!item.isNull())
               {

                   _active.push_back(item.toElement().text());

                   item=item.nextSibling();
               }


           }

            finder=finder.nextSibling();
        }
f.close();
}


QString TeachCore::getlesson(int index)
{
return _lesson[index];
}

QString TeachCore::gettext(QString path)
{
    QFile f("TeachingMaterials/"+path);

    f.open(QIODevice::ReadOnly);
    QDomDocument dom;
    dom.setContent(&f);
    f.close();
    _audiourl=dom.firstChild().firstChild().toElement().text();
    return dom.firstChild().firstChild().nextSibling().toElement().text();
 }


void TeachCore::initlesson(QString path)
{

    _lesson.clear();
    QDir dir;
    dir.setPath("TeachingMaterials/"+path);
    QStringList filelist=dir.entryList(dir.Files);

    for(int i=0;i<filelist.count();++i)
    {
        _lesson.push_back(filelist[i]);
    }
    qDebug()<<_lesson.count();

};
unsigned TeachCore::getlessoncount()
{

    return _lesson.count();
};
QString TeachCore::getactive(int index)
{


    return _active[index];
}
unsigned TeachCore::getactivecount()
{
    return _active.count();
};

unsigned TeachCore::getmenucount()
{
    return _menu.count();
};
QString TeachCore::getmenu(int index)
{


    if(index>getmenucount()-1)
    {
        return "NULL";
    }

    return _menu[index];
}
