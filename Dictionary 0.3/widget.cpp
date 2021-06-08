#include "widget.h"
#include "./ui_widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{


setWindowIcon(QIcon(":/ui/ditionary_ico.png"));
ui->setupUi(this);
setWindowTitle("Dictionary");
load();//加载
link();//链接




/*
 *
 * 模糊搜框载入单词，（复制一份cet单词）
 *
 *
 *
 *
 */

for(int l=0;l<5;++l)
for(int i=0;i<cet4[l]->word_value;++i)
{
  word<<cet4[l]->w[i].w;
}
find_edit2=new  CompleteLineEdit(word);
find_edit2->setParent(ui->find_edit);
find_edit2->resize(ui->find_edit->width(),ui->find_edit->height());







find_edit2->show();
}

















void Widget::add()
{


    if(ui->find_edit->text()==""||ui->explain->text()=="")
    {
       QDialog s;
       QLabel show(&s);
       show.setText("单词或解释为空，不能添加");
       QPushButton btn(&s);
       btn.move(50,50);
       btn.setText("关闭");
       s.setWindowFlags(Qt::FramelessWindowHint);
       s.resize(150,100);
       connect(&btn,&QPushButton::clicked,&s,&QDialog::close);
       s.exec();
       return;
 }
    a->addword(ui->find_edit->text(),ui->explain->text(),ui->note->text());
    find_edit2->setText("");
    ui->find_edit->setText("");
    ui->explain->setText("");
    ui->note->setText("");
    save();
    resetword_number();
}



void Widget::resetword_number()
{
    if(a->word_value!=0)
    {

    ui->word_number->setMaximum(a->word_value-1);
    ui->mind_show->setText(a->w[ui->word_number->value()].w+"\n"+a->w[ui->word_number->value()].explain);
    ui->word_value->setText(QString("%1").arg(ui->word_number->value()+1)+"/"+QString("%1").arg(ui->word_number->maximum()+1));
     }else
    {
        ui->word_number->setMaximum(0);
        ui->mind_show->setText("你还没有单词");
        ui->word_value->setText("0/0");
    }


    if(a->word_value==1)
    {
        ui->word_number->setMaximum(0);
        ui->mind_show->setText(a->w[0].w+"\n"+a->w[0].explain);
        ui->word_value->setText("1/1");
        return;
    }



}




Widget::~Widget()
{
    delete ui;
}

/*
*
*鼠标拖动标题栏模块
*/
void Widget::mousePressEvent(QMouseEvent *e)
{
now_nouse_x=e->x();
now_mouse_y=e->y();
if(e->button()==Qt::RightButton)
{
this->close();
}



}
void Widget::mouseMoveEvent(QMouseEvent *e)
{

  int h=ui->top->height()-10;
    if(e->y()<h)
    {
       move(e->globalX()-now_nouse_x,e->globalY()-now_mouse_y);
    }


}


//加载
void Widget::load()
{


  //  this->setAttribute(Qt::WA_TranslucentBackground, true);
  ui->explain->hide();
  ui->explain_lab->hide();
  ui->word_lab->hide();
  ui->note->hide();
  ui->set_w->hide();
  ui->note_lab->hide();
  ui->me_w->hide();
  ui->mind->hide();
ui->delete_btn->hide();
ui->add_btn->hide();

  resize(700,500);
  setWindowFlags(Qt::FramelessWindowHint);
  sys.setFileName("set.sys");
  file.setFileName("dic.dictionary");
        if(!file.open(QIODevice::ReadOnly))
        {//首次打开软件
                   file.open(QIODevice::WriteOnly);
                   file.write("V:0.2\n0\n版权所有：AF_XYY\n---关于----\n邮箱：2256530727@qq.com\n");//文件前五行
                   file.close();
                    //设置文件
                   sys.open(QIODevice::WriteOnly);
                   sys.write("强力搜索关闭\n");
                   sys.write("黑\n");
                   sys.write("CET4打开\n");
                   sys.write("页面模式\n");
                   set2();
                   ui->cet4_check->setChecked(true);
                   ui->check_color2->setChecked(true);
                   ui->find_check->setChecked(true);
                   sys.close();
                    resetword_number();

        }else
        {
                sys_load();//系统文件转载
        }
        dic_load();//加载用户词汇
        cet_load();//加载CET单词



if(a->word_value<10)
{
ui->test_btn->hide();
}






    for(int l=0;l<5;++l)
    for(int i=0;i<cet4[l]->word_value;++i)
    {
        ui->wordlist->addItem(cet4[l]->w[i].w+"\t\t"+cet4[l]->w[i].explain);
    }
//莫名其妙的BUG，这一行取消后选择颜色时，必须重新勾选其他选项后，选择颜色的数据设置才能保存倒sys文件，至今没有找到原因
save_sysflie();
 /*
  *别删除上面的一行，这玩意肖哥找了三个星期，都没有找到问题所在
  */

    resetword_number();

save();



}



//信号链接
void Widget::link()
{

    connect(ui->delete_btn,&QPushButton::clicked,[=]()
    {

        if(a->delete_word(a->w[ui->word_number->value()].w))
        {
        save();
        resetword_number();
        }



    });


    connect(ui->page_mod,&QCheckBox::clicked,[=]()
    {
        ui->wordlist->hide();
        ui->mind_show->show();
        save_sysflie();
    });




    connect(ui->list_mod,&QCheckBox::clicked,[=]()
    {
        ui->mind_show->hide();
        ui->wordlist->show();
        save_sysflie();
    });



    connect(ui->word_number,&QSlider::valueChanged,[=](){


        resetword_number();
if(a->word_value==0)return;

        if(ui->word_number->value()<=0)
        {

              ui->mind_show->setText(a->w[0].w+"\n"+a->w[0].explain);
        }

if(a->word_value!=0){
     ui->mind_show->setText(a->w[ui->word_number->value()].w+"\n"+a->w[ui->word_number->value()].explain);
  }



    });








  connect(ui->find_edit,&QLineEdit::textChanged,this,&Widget::find_word);
  connect(ui->set_btn,&QCommandLinkButton::clicked,[=]()
    {
      find_edit2->listView->hide();
            me_w_type=!me_w_type;
            set_w_type=!set_w_type;
            mind_w_type=!mind_w_type;
                if(set_w_type)
                {
                        ui->set_w->show();
                        ui->me_w->hide();
                        ui->mind->hide();
                }else
                {
                ui->set_w->hide();
                }
             me_w_type=0;
             mind_w_type=0;
    });


  connect(ui->mind_btn,&QCommandLinkButton::clicked,[=](){

      find_edit2->listView->hide();
      me_w_type=!me_w_type;
      set_w_type=!set_w_type;
      mind_w_type=!mind_w_type;
      if(mind_w_type)
      {
          ui->mind->show();
          ui->me_w->hide();
          ui->set_w->hide();
      }else
      {
            ui->mind->hide();
      }
      me_w_type=0;
      set_w_type=0;


  });


    connect(ui->me_btn,&QCommandLinkButton::clicked,[=]()
    {

        find_edit2->listView->hide();
        me_w_type=!me_w_type;
        set_w_type=!set_w_type;
        mind_w_type=!mind_w_type;
    if(me_w_type)
    {
            ui->mind->hide();
            ui->set_w->hide();
            ui->me_w->show();
    }else
    {
    ui->me_w->hide();
    }
        set_w_type=0;
        mind_w_type=0;
    });

    connect(ui->find_btn,&QCommandLinkButton::clicked,[=]()
    {

        find_edit2->listView->hide();
        ui->set_w->hide();
        ui->me_w->hide();
        ui->mind->hide();
        set_w_type=0,me_w_type=0,mind_w_type=0;
    });



    connect(ui->find_check,&QCheckBox::clicked,this,&Widget::save_sysflie);

    connect(ui->check_color2 ,&QCheckBox::clicked,this,[=](){
        set2();
        save_sysflie();
    });
    connect(ui->check_color1 ,&QCheckBox::clicked,this,[=](){
        save_sysflie();
        set1();
    });
    connect(ui->check_color3 ,&QCheckBox::clicked,this,[=](){
        set3();
        save_sysflie();
    });
    connect(ui->check_color4 ,&QCheckBox::clicked,this,[=](){
        save_sysflie();
        set4();
    });



    connect(ui->cet4_check,&QCheckBox::clicked,this,&Widget::save_sysflie);
   connect(ui->test_btn,&QCheckBox::clicked,this,[=]()
    {
       test_window.load_word();
        test_window.show();
        test_window.move(this->x(),this->y());
        this->hide();
    });
     connect(ui->edit_Box,&QCheckBox::stateChanged,[=]()
                {

         find_edit2->listView->hide();
                if(ui->edit_Box->isChecked())
                {
                    ui->find_edit->move(180,180);
                    ui->explain->show();
                    ui->explain_lab->show();
                      ui->word_lab->show();
                    ui->note->show();
                    ui->note_lab->show();
                    ui->show_lab->hide();
                    ui->add_btn->show();
                }else
                {
                      ui->word_lab->hide();
                    ui->find_edit->move(180,50);
                    ui->add_btn->hide();
                    ui->show_lab->show();
                    ui->explain->hide();
                    ui->explain_lab->hide();
                    ui->note->hide();
                    ui->note_lab->hide();
                }
                });
 connect(&test_window,&test::closed,this,&Widget::show);
 connect(ui->add_btn,&QPushButton::clicked,this,&Widget::add);
}
