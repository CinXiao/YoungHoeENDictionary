#include"widget.h"
#include "./ui_widget.h"


/*文件系统
 *
 * 数据储存
 * 系统文件操作
 * 单词文件操作
 *创建日期：2021年2月15日12点08分
 *
 *
 */




//加载CET词汇
void Widget::cet_load()
{
    CET_file.setFileName("CET/CET4_A-D.dictionary");
    CET_file.open(QIODevice::ReadOnly);
    for(int i=0;i<5;i++)
    {
    cet4_s[i]=CET_file.readLine();
    }
    cet4[0]=new dat(cet4_s[0],cet4_s[1],cet4_s[2],cet4_s[3],cet4_s[4]);

             for(int i=0;i<cet4[0]->word_value;++i)
             {
                 cet4[0]->w[i].w=CET_file.readLine();
                 cet4[0]->w[i].w.chop(1);
                 cet4[0]->w[i].explain =CET_file.readLine();
                 cet4[0]->w[i].explain.chop(1);
                 cet4[0]->w[i].note =CET_file.readLine();
                 cet4[0]->w[i].note.chop(1);
                 cet4[0]->w[i].proficient_value =(CET_file.readLine()).toInt();

             }
     CET_file.close();
     CET_file.setFileName("CET/CET4_E-I.dictionary");
     CET_file.open(QIODevice::ReadOnly);
     for(int i=0;i<5;i++)
     {
     cet4_s[i]=CET_file.readLine();
     }
     cet4[1]=new dat(cet4_s[0],cet4_s[1],cet4_s[2],cet4_s[3],cet4_s[4]);

              for(int i=0;i<cet4[1]->word_value;++i)
              {
                  cet4[1]->w[i].w=CET_file.readLine();
                  cet4[1]->w[i].w.chop(1);
                  cet4[1]->w[i].explain =CET_file.readLine();
                  cet4[1]->w[i].explain.chop(1);
                  cet4[1]->w[i].note =CET_file.readLine();
                  cet4[1]->w[i].note.chop(1);
                  cet4[1]->w[i].proficient_value =(CET_file.readLine()).toInt();
              }
      CET_file.close();
      CET_file.setFileName("CET/CET4_J-N.dictionary");
      CET_file.open(QIODevice::ReadOnly);
      for(int i=0;i<5;i++)
      {
      cet4_s[i]=CET_file.readLine();
      }
      cet4[2]=new dat(cet4_s[0],cet4_s[1],cet4_s[2],cet4_s[3],cet4_s[4]);

               for(int i=0;i<cet4[2]->word_value;++i)
               {
                   cet4[2]->w[i].w=CET_file.readLine();
                   cet4[2]->w[i].w.chop(1);
                   cet4[2]->w[i].explain =CET_file.readLine();
                   cet4[2]->w[i].explain.chop(1);
                   cet4[2]->w[i].note =CET_file.readLine();
                   cet4[2]->w[i].note.chop(1);
                   cet4[2]->w[i].proficient_value =(CET_file.readLine()).toInt();
               }
               CET_file.close();
               CET_file.setFileName("CET/CET4_O-T.dictionary");
               CET_file.open(QIODevice::ReadOnly);
               for(int i=0;i<5;i++)
               {
               cet4_s[i]=CET_file.readLine();
               }
               cet4[3]=new dat(cet4_s[0],cet4_s[1],cet4_s[2],cet4_s[3],cet4_s[4]);

                for(int i=0;i<cet4[3]->word_value;++i)
                {
                    cet4[3]->w[i].w=CET_file.readLine();
                    cet4[3]->w[i].w.chop(1);
                    cet4[3]->w[i].explain =CET_file.readLine();
                    cet4[3]->w[i].explain.chop(1);
                    cet4[3]->w[i].note =CET_file.readLine();
                    cet4[3]->w[i].note.chop(1);
                    cet4[3]->w[i].proficient_value =(CET_file.readLine()).toInt();
                }
                CET_file.close();
                CET_file.setFileName("CET/CET4_U-Z.dictionary");
                CET_file.open(QIODevice::ReadOnly);
                for(int i=0;i<5;i++)
                {
                cet4_s[i]=CET_file.readLine();
                }
                cet4[4]=new dat(cet4_s[0],cet4_s[1],cet4_s[2],cet4_s[3],cet4_s[4]);
                for(int i=0;i<cet4[4]->word_value;++i)
                 {
                     cet4[4]->w[i].w=CET_file.readLine();
                     cet4[4]->w[i].w.chop(1);
                     cet4[4]->w[i].explain =CET_file.readLine();
                     cet4[4]->w[i].explain.chop(1);
                     cet4[4]->w[i].note =CET_file.readLine();
                     cet4[4]->w[i].note.chop(1);
                     cet4[4]->w[i].proficient_value =(CET_file.readLine()).toInt();
                 }
         CET_file.close();
}

//加载用户单词本
 void Widget::dic_load()
 {
                file.open(QIODevice::ReadOnly);
                for(int i=0;i<5;i++)
                {
                s[i]=file.readLine();
                }
                a=new dat(s[0],s[1],s[2],s[3],s[4]);
                for (int i=0;i<a->word_value;++i)
                {
                 a->w[i].w=file.readLine();
                 a->w[i].w.chop(1);
                 a->w[i].explain =file.readLine();
                 a->w[i].explain.chop(1);
                 a->w[i].note =file.readLine();
                 a->w[i].note.chop(1);
                 a->w[i].proficient_value =(file.readLine()).toInt();
                }
               file.close();

 }

//保存用户单词本文件
void Widget::save()
  {
      file.open(QIODevice::WriteOnly);
      file.write(a->sys[0].toUtf8());
      file.write((QString("%1").arg(a->word_value).toUtf8())+"\n");
      file.write(a->sys[2].toUtf8());
      file.write(a->sys[3].toUtf8());
      file.write(a->sys[4].toUtf8());
      for(int i=0;i<a->word_value;i++)
      {
          file.write(a->w[i].w.toUtf8()+"\n");
          file.write( a->w[i].explain.toUtf8()+"\n");
          file.write( a->w[i].note.toUtf8()+"\n");
          QString temp=QString("%1").arg(a->w[i].proficient_value);
         file.write(temp.toUtf8()+"\n");
      }
      file.close();
  }




//加载系统文件
void Widget::sys_load()
{

    sys.open(QIODevice::ReadOnly);
    QString temp= sys.readLine();
    if(temp=="强力搜索关闭\n")
    {
       startTimer(500);
       ui->find_check->setChecked(false);
    }else
    {
         startTimer(5);
         ui->find_check->setChecked(true);
    }
    temp= sys.readLine();
    if(temp=="默认紫\n")
    {
        ui->check_color1->setChecked(true);
        set1();
     }else if(temp=="加强蓝\n")
    {

        ui->check_color2->setChecked(true);
        set2();
    }else if(temp=="黑\n")
    {
        ui->check_color3->setChecked(true);
        set3();
    }else if(temp=="绿\n")
    {
        ui->check_color4->setChecked(true);
        set4();
    }

     temp= sys.readLine();
    if(temp=="CET4打开\n")
    {
        ui->cet4_check->setChecked(true);
    }else
    {
        ui->cet4_check->setChecked(false);
    }
    temp= sys.readLine();
    if(temp=="页面模式\n")
    {
        ui->page_mod->setChecked(true);
        ui->wordlist->hide();
        ui->mind_show->show();

    }else if(temp=="列表模式\n")
    {
        ui->list_mod->setChecked(true);
        ui->wordlist->show();
        ui->mind_show->hide();
    }
    sys.close();
}

//保存系统文件
void Widget::save_sysflie()
{
         sys.open(QIODevice::WriteOnly);
    if(ui->find_check->isChecked())
    {
         sys.write("强力搜索打开\n");
    }else{
          sys.write("强力搜索关闭\n");
         }
    if(ui->check_color1->isChecked())
    {
        sys.write("默认紫\n");
    }
    if(ui->check_color2->isChecked())
    {
            sys.write("加强蓝\n");
    }
    if(ui->check_color3->isChecked())
    {
            sys.write("黑\n");
    }
    if(ui->check_color4->isChecked())
    {
            sys.write("绿\n");
    }
    if(ui->cet4_check->isChecked())
    {
     sys.write("CET4打开\n");
    }else{

     sys.write("CET4关闭\n");
    }

    if(ui->page_mod->isChecked())
    {
          sys.write("页面模式\n");
    }
    if(ui->list_mod->isChecked())
    {
          sys.write("列表模式\n");
    }
          sys.close();
 }
