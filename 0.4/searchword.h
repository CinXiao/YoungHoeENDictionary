#ifndef SEARCHWORD_H
#define SEARCHWORD_H
#include<QList>
#include<QObject>
#include<QVector>
#include<QDebug>
#include"word.h"
#include"wordfilesystem.h"
/*
**用来查询词库单词 v 0.0.1
**
**
*/





class SearchWord:public QObject
{
    Q_OBJECT

public:
    SearchWord();

//信号
signals:

//槽函数
public slots:
     QString search(QString word,int index,QString type);
     int getcount();


private:

    int _max_check=0;
    QVector<Word>check;  //查找结果寄存器
    QVector<Word> _list;//单词列表


};

#endif // SEARCHWORD_H
