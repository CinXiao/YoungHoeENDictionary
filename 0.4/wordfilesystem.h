#ifndef WORDFILESYSTEM_H
#define WORDFILESYSTEM_H
#include"word.h"
#include <QDomComment>
#include <QDir>
#include <QFile>
#include<QDebug>
#include<QVector>

/*
**用来打开单词库，返回一个list
**
**
*/
class WordFileSystem
{

public:
    WordFileSystem();
    ~WordFileSystem();
    WordFileSystem(QString file);
    QVector<Word>getwordlist();
    int count();//获取单词数量


    QString getwordinfo(int index,QString type);//获取单词信息



private:
    void Parsingnode(QDomNode item);//解析节点


private:

QDomDocument _dom;   //dom流
QFile _file;         //文件
QVector<Word> _wordlist;//word list

};

#endif // WORDFILESYSTEM_H
