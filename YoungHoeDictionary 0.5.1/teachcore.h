#ifndef TEACHCORE_H
#define TEACHCORE_H
#include<QFile>
#include <QObject>
#include<QDomDocument>
#include<QDir>
#include<QDebug>
class TeachCore:public QObject
{

    Q_OBJECT

public:
    TeachCore();





public slots:
    QString getactive(int index);
    QString getlesson(int index);
    QString getmenu(int index);
    unsigned getmenucount();
    unsigned getlessoncount();
    unsigned getactivecount();

    void initactive(QString menu);
    void initlesson(QString path);
    QString gettext(QString path);
    QString getaudiourl();

private:

   QList<QString> _lesson; //课程目录
   QString _infofilename="UserData/UserSeting/TMGT.xml";   //课程引导表
   QList<QString> _menu;  //教材名称
   QList<QString> _active; //教材章节



   QString _text;    //当前文章
   QString _audiourl;//当前音频文件url



};

#endif // TEACHCORE_H
