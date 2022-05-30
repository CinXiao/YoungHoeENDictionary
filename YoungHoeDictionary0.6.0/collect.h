#ifndef COLLECT_H
#define COLLECT_H
#include<QDebug>
#include<QObject>
#include<QDomDocument>
#include<QFile>
#include"word.h"
#include<QDate>


class worddat
{
public:
Word _word;
int year;
int month;
int day;
};
class Collect:public QObject
{

    Q_OBJECT
public:
    Collect();

signals:

    void collected(QString word, QString trans,QString phonetic="NULL",int progress=0);
   void removed(QString word);

public slots:

    int length();

    QString getdat(int index,QString type);

    void collect(QString word, QString trans,QString phonetic="NULL",int progress=0);
    void remove(QString word);
    bool iscollected(QString word);
    void loaddata();//加载数据
private:




};


#endif // COLLECT_H
