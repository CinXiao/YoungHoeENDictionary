#ifndef TEST_H
#define TEST_H
#include<QLabel>
#include <QWidget>
#include<QEvent>
#include"dat.h"
#include<QTime>
#include<qfile.h>
namespace Ui {
class test;
}

class test : public QWidget
{
    Q_OBJECT

public:
    explicit test(QWidget *parent = nullptr);
    ~test();
    int r;//随机数
    void savefile();//保存文件
   void rand_word();//随机出题
   void load_word();//装载单词
 int max,sure,num;
  dat *word;
  QString s[5];
 void up_data(int cas);

private:
    Ui::test *ui;
QFile file;
    void closeEvent(QCloseEvent *event);
    public slots:


  signals :
  void closed();

};

#endif // TEST_H
