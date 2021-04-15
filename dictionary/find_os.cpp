#include"widget.h"
#include "./ui_widget.h"



//timerevent事件）
void Widget::timerEvent(QTimerEvent *e)
{

    if(a->word_value<10)
    {
        ui->test_btn->hide();
    }else
    {
           ui->test_btn->show();
    }
if(a->word_value!=0)
{
    ui->delete_btn->show();
}else
{
    ui->delete_btn->hide();
}
ui->find_edit->setText(this->find_edit2->text().toLower());

if(find_edit2->text()=="")
{
ui->show_lab->setText("");

}
}




//搜索引擎2.5
void Widget::find_word()
{

            QString op=(ui->find_edit->text()+"\n").toLower();
            QString op2=ui->find_edit->text().toLower();






    //CET文件中寻找单词****************/
     if(ui->cet4_check->isChecked()){




//         if(op=="\n")
//           {
//                ui->show_lab->setText("");
//                 ui->explain->setText("");
//                return;
//           }

//         for(int i=0;i<a->word_value;i++)
//          {
//              if(QString::compare(op,a->w[i].w)>=0)
//              {
//               ui->show_lab->setText("单词:  "+a->w[i].w+"\n解释: "+a->w[i].explain+"\n\n笔记:  "+a->w[i].note+"\n");
//                ui->explain->setText(a->w[i].explain);
//                return;
//              }else
//              {
//                    ui->show_lab->setText("");
//              }
//           }









          if((op[0]>="a"&&op[0]<="d")||(op[0]>="A"&&op[0]<="D"))
            {




                  for(int i=0;i<cet4[0]->word_value;i++)
                   {




                      if(cet4[0]->w[i].w==op||cet4[0]->w[i].w==op2||cet4[0]->w[i].explain ==op||cet4[0]->w[i].explain==op2)
                       {
                        ui->show_lab->setText("单词:  "+cet4[0]->w[i].w+"\n解释: "+cet4[0]->w[i].explain);
                        ui->explain->setText(cet4[0]->w[i].explain);
                        break;
                       }else
                      {
                            ui->show_lab->setText("");
                      }



                  }




          }else if((op[0]>="e"&&op[0]<="i")||(op[0]>="E"&&op[0]<="I"))
          {
               for(int i=0;i<cet4[1]->word_value;i++)
                {
                    if(cet4[1]->w[i].w==op||cet4[1]->w[i].w==op2||cet4[1]->w[i].explain ==op||cet4[1]->w[i].explain==op2)
                    {
                     ui->show_lab->setText("单词:  "+cet4[1]->w[i].w+"\n解释: "+cet4[1]->w[i].explain);
                          ui->explain->setText(cet4[1]->w[i].explain);
                     break;
                    }else
                    {
                          ui->show_lab->setText("");
                    }
               }
          }else if((op[0]>="J"&&op[0]<="N")||(op[0]>="j"&&op[0]<="n"))
          {

               for(int i=0;i<cet4[2]->word_value;i++)
                {
                    if(cet4[2]->w[i].w==op||cet4[2]->w[i].w==op2||cet4[2]->w[i].explain ==op||cet4[2]->w[i].explain==op2)
                    {
                     ui->show_lab->setText("单词:  "+cet4[2]->w[i].w+"\n解释: "+cet4[2]->w[i].explain);
                          ui->explain->setText(cet4[2]->w[i].explain);
                     break;
                    }else
                    {
                          ui->show_lab->setText("");
                    }
               }
          }else if((op[0]>="o"&&op[0]<="t")||(op[0]>="O"&&op[0]<="T"))
          {
               for(int i=0;i<cet4[3]->word_value;i++)
                {
                    if(cet4[3]->w[i].w==op||cet4[3]->w[i].w==op2||cet4[3]->w[i].explain ==op||cet4[3]->w[i].explain==op2)
                    {
                     ui->show_lab->setText("单词:  "+cet4[3]->w[i].w+"\n解释: "+cet4[3]->w[i].explain);
                          ui->explain->setText(cet4[3]->w[i].explain);
                     break;
                    }else
                    {
                          ui->show_lab->setText("");
                    }
               }
          }else if((op[0]>="U"&&op[0]<="Z")||(op[0]>="u"&&op[0]<="z"))
          {
               for(int i=0;i<cet4[4]->word_value;i++)
                {
                    if(cet4[4]->w[i].w==op||cet4[4]->w[i].w==op2||cet4[4]->w[i].explain ==op||cet4[4]->w[i].explain==op2)
                    {
                     ui->show_lab->setText("单词:  "+cet4[4]->w[i].w+"\n解释: "+cet4[4]->w[i].explain);
                          ui->explain->setText(cet4[0]->w[i].explain);
                     break;
                    }else
                    {
                          ui->show_lab->setText("");
                    }
               }
          }

    }




}
