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
    WordFileSystem(QString file);
    QVector<Word>getwordlist();




private:
    void Parsingnode(QDomNode item);//解析节点


private:

QDomDocument _dom;   //dom流
QFile _file;         //文件
QVector<Word> _wordlist;//word list

};

#endif // WORDFILESYSTEM_H
