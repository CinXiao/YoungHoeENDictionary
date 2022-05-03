#ifndef WORDBOOKS_H
#define WORDBOOKS_H
#include <QDomComment>
#include <QDir>
#include <QFile>
#include<QDebug>
#include<QVector>
#include <QObject>
#include<QFileInfo>
#include<QFileInfoList>
#include"word.h"


class BookInfo
{
public:
    QString name="BOOK";
    QString writer="Write";
    QString path="PATH";
    QString color="COLOR";
};

class WordBooks:public QObject
{

Q_OBJECT
public:
  WordBooks();
    ~WordBooks();
   void init();




public slots:
    QString getbookinfo(int index,QString type);
    int getbookcount();


private:
    QList<BookInfo> _books;
   void initbookinfo();
    void getbookwordsinfo();
   void Parsingnode(QDomNode node);

};


#endif // WORDBOOKS_H
