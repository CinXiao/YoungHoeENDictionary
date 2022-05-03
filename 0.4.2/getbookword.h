#ifndef GETBOOKWORD_H
#define GETBOOKWORD_H
#include<QObject>
#include<QFile>
#include<QDomDocument>
#include<QVector>
#include"word.h"
#include<QDebug>

class GetBookWord:public QObject
{
Q_OBJECT

public:
    GetBookWord();

public slots:
    void openbook(QString path);
    int count();
    QString getword(int index);
    QString  gettrans(int index);
    QString  getphonetic(int index);
private:

    void test();
    QVector<Word> _words;
    QDomDocument _dom;
    QFile _file;

};

#endif // GETBOOKWORD_H
