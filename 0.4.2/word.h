#ifndef WORD_H
#define WORD_H
#include<QString>
class Word
{

public:
    Word();
    Word(QString word, QString trans,QString phonetic="NULL",QString tags="NULL",int progress=-1);

    QString gettrans();
    QString _word;       //单词
    QString _trans;      //翻译
    QString _phonetic;   //音标
    QString _tags;       //标签
    int _progress;      //熟练度

};

#endif // WORD_H
