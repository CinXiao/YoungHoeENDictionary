#ifndef WIDGET_H
#define WIDGET_H

#include <QGraphicsDropShadowEffect>
#include<completelineedit.h>
#include<QMouseEvent>
#include<QEvent>
#include <QWidget>
#include<QFile>
#include"word.h"
#include"dat.h"
#include<QPushButton>
#include<QByteArray>
#include<QCheckBox>
#include<QTimerEvent>
#include<QIcon>
#include<QLabel>
#include<QDialog>
#include<QObject>
#include<QRadioButton>
#include<qdebug.h>
#include<QSlider>
#include<QCommandLinkButton>
#include<QListWidget>
#include"test.h"
#include<QStringList>
QT_BEGIN_NAMESPACE
namespace Ui { class Widget; }
QT_END_NAMESPACE
class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();
   test test_window;//测试窗口
CompleteLineEdit *find_edit2;


private:
QFile file;//用户单词本
QFile sys;//系统单词本
QFile CET_file;//自带的四级和六级词汇表
int now_nouse_x,now_mouse_y;//点击鼠标位置记录
bool set_w_type=0,me_w_type=0,mind_w_type=0;
dat *a,*cet4[5],*cet6;//用户数据，四级词汇数据，六级词汇数据
QStringList word;
QString s[5],cet4_s[5];//系统设置
void cet_load();//cet数据装载
void dic_load();//用户单词本数据装载
void sys_load();//系统设置装载
void load();//初始化
void link();//链接数据
void save();//保存
void file_updata();//更新数据
Ui::Widget *ui;
void mouseMoveEvent(QMouseEvent *e);
void mousePressEvent(QMouseEvent *e);
void timerEvent(QTimerEvent *e);

void resetword_number();



public slots:
    void set1();//样式1
    void set2();//样式2
    void set3();//样式3
    void set4();//样式4

void save_sysflie();//保存设置文件
void find_word();//查找文本
void add();//添加单词

};
#endif // WIDGET_H
