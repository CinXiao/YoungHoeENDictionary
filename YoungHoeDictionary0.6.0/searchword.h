#ifndef SEARCHWORD_H
#define SEARCHWORD_H
#include<QList>
#include<QObject>
#include<QVector>
#include<QNetworkAccessManager>
#include<QNetworkReply>
#include<QDebug>
#include<QJsonObject>
#include<QJsonArray>
#include<QJsonDocument>
#include"word.h"
#include"wordfilesystem.h"
/*
 * 2022年4月9日
**用来查询词库单词 v 0.0.1
**
**
**2022年5月29日22点33分
**用来查询词库单词 v 0.0.2
**增加百度翻译接口，从web查询单词
**可以查询中文
**
**
*/


//代码一些地方不符合设计规范，后期要好好改！！


class SearchWord:public QObject
{
    Q_OBJECT

public:
    SearchWord();
    ~SearchWord();
//信号
signals:

//槽函数
public slots:
     QString search(QString word,int index,QString type);
     QString search(QString word,QString type);

     //网络查找
     void search_from_web(QString word,QString type);
     void requestFinished(QNetworkReply* reply);
     int getcount();

signals:
    void fromweb_word_dat(QString word_from_web);
    void fromweb_explan_dat(QString explan_from_web);
private:

    int _max_check=0;
    QVector<Word>_check;  //查找结果寄存器
    QVector<Word> _list;//单词列表
    WordFileSystem *_wordfilesystem;




    QNetworkAccessManager *networkaccess;
};



#endif // SEARCHWORD_H
