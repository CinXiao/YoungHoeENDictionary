#include "test.h"
#include "ui_test.h"
#include<QDialog>
#include<QDebug>
#include<time.h>
#include<QCommandLinkButton>
test::test(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::test)
{


    srand(time(NULL));
ui->setupUi(this);
setWindowIcon(QIcon(":/ui/blue_test.png"));
setWindowTitle("单词测试");
sure=0,num=0;
load_word();//加载单词
rand_word();//洗牌，哈哈哈
connect(ui->A,&QCommandLinkButton::clicked,[=]()
{
    up_data(1);
    savefile();
}
);
connect(ui->B,&QCommandLinkButton::clicked,[=]()
{
    up_data(2);
    savefile();
}
);
connect(ui->C,&QCommandLinkButton::clicked,[=]()
{
    up_data(3);
    savefile();
}
);
connect(ui->D,&QCommandLinkButton::clicked,[=]()
{
    up_data(4);
savefile();
}
);





}
 void  test::rand_word()
 {


     /***随机出题，核心模块*HX-002**/



         int i=rand()%max+1;
            while(word->w[i].proficient_value<word->w[i+1].proficient_value)
            {
             i=rand()%max;
            }
         num=i;
     ui->text->setText(word->w[num].w);

/*摇号*/
     int r=rand()%4+1;

/*摇号结束*/
     switch (r) {
     case 1:{
         ui->A->setText(word->w[num].explain);
        ui->B->setText(word->w[rand()%max].explain);
         ui->C->setText(word->w[rand()%max].explain);
         ui->D->setText(word->w[rand()%max].explain);
         while(ui->A->text()==ui->B->text()||ui->C->text()==ui->B->text()||ui->D->text()==ui->B->text()||ui->D->text()==ui->C->text()||ui->D->text()==ui->A->text()||ui->C->text()==ui->A->text())
         {
             ui->B->setText(word->w[rand()%max].explain);
             ui->C->setText(word->w[rand()%max].explain);
             ui->D->setText(word->w[rand()%max].explain);
         }
     }break;
     case 2:{


         ui->A->setText(word->w[rand()%max].explain);
         ui->B->setText(word->w[num].explain);
         ui->C->setText(word->w[rand()%max].explain);
         ui->D->setText(word->w[rand()%max].explain);
         while(ui->A->text()==ui->B->text()||ui->C->text()==ui->B->text()||ui->D->text()==ui->B->text()||ui->D->text()==ui->C->text()||ui->D->text()==ui->A->text()||ui->C->text()==ui->A->text())
         {
             ui->A->setText(word->w[rand()%max].explain);
             ui->C->setText(word->w[rand()%max].explain);
             ui->D->setText(word->w[rand()%max].explain);
         }
     }break;
     case 3:{
            ui->A->setText(word->w[rand()%max].explain);
            ui->B->setText(word->w[rand()%max].explain);
            ui->C->setText(word->w[num].explain);
            ui->D->setText(word->w[rand()%max].explain);

            while(ui->A->text()==ui->B->text()||ui->C->text()==ui->B->text()||ui->D->text()==ui->B->text()||ui->D->text()==ui->C->text()||ui->D->text()==ui->A->text()||ui->C->text()==ui->A->text())
            {
                ui->A->setText(word->w[rand()%max].explain);
                ui->B->setText(word->w[rand()%max].explain);
                ui->D->setText(word->w[rand()%max].explain);
            }
     }break;
     case 4:{
         ui->A->setText(word->w[rand()%max].explain);
         ui->B->setText(word->w[rand()%max].explain);
         ui->C->setText(word->w[rand()%max].explain);
         ui->D->setText(word->w[num].explain);
         while(ui->A->text()==ui->B->text()||ui->C->text()==ui->B->text()||ui->D->text()==ui->B->text()||ui->D->text()==ui->C->text()||ui->D->text()==ui->A->text()||ui->C->text()==ui->A->text())
         {
             ui->A->setText(word->w[rand()%max].explain);
             ui->B->setText(word->w[rand()%max].explain);
             ui->C->setText(word->w[rand()%max].explain);
         }

     }break;
     }




 }






void test::up_data(int cas)
{

    switch (cas) {
    case 1:{
        if(ui->A->text()==word->w[num].explain)
        {
          ui->finished->setValue(ui->finished->value()+(100/max));
          sure++;
          word->w[num].proficient_value++;
         }
        rand_word();
    }break;
    case 2:{
        if(ui->B->text()==word->w[num].explain)
        {
           ui->finished->setValue(ui->finished->value()+(100/max));
           sure++;
             word->w[num].proficient_value++;
        }
        rand_word();
    }break;
   case 3:{

        if(ui->C->text()==word->w[num].explain)
        {
            ui->finished->setValue(ui->finished->value()+(100/max));
            sure++;
            word->w[num].proficient_value++;
        }
        rand_word();
        }break;
        case 4:{

        if(ui->D->text()==word->w[num].explain)
        {
           ui->finished->setValue(ui->finished->value()+(100/max));
           sure++;
           word->w[num].proficient_value++;
         }
        rand_word();
        }break;

    }
    if(sure>=max)
    {
        this->close();
    }
}

void test::load_word()
{
file.setFileName("dic.dictionary");
file.open(QIODevice::ReadOnly);
for(int i=0;i<5;i++)
{
s[i]=file.readLine();
}
word=new dat(s[0],s[1],s[2],s[3],s[4]);
for (int i=0;i<word->word_value;++i)
{
 word->w[i].w=file.readLine();
 word->w[i].w.chop(1);
 word->w[i].explain =file.readLine();
 word->w[i].explain.chop(1);
 word->w[i].note =file.readLine();
 word->w[i].note.chop(1);
 word->w[i].proficient_value =(file.readLine()).toInt();
}
file.close();
max=word->word_value;
ui->finished->setValue(0);
}



test::~test()
{
    delete ui;
}

void test::savefile()
{

    file.open(QIODevice::WriteOnly);
    file.write(s[0].toUtf8());
    file.write(s[1].toUtf8());
    file.write(s[2].toUtf8());
    file.write(s[3].toUtf8());
    file.write(s[4].toUtf8());
    for(int i=0;i<word->word_value;i++)
    {
        file.write(word->w[i].w.toUtf8()+"\n");
        file.write( word->w[i].explain.toUtf8()+"\n");
        file.write( word->w[i].note.toUtf8()+"\n");
        QString temp=QString("%1").arg(word->w[i].proficient_value);
       file.write(temp.toUtf8()+"\n");
    }
     file.close();

}


void test::closeEvent(QCloseEvent *event)
{
    sure=0;
   savefile();
    emit closed();
}
