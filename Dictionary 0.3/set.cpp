#include"widget.h"
#include "./ui_widget.h"



void Widget::set1()
{


    ui->find_btn->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->test_btn->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->top->setStyleSheet("background-color: rgb(235, 185, 255);");
    ui->find_btn->setIcon(QIcon(":/ui/find.png"));
    ui->find_btn->setIconSize(QSize(44,44));
    ui->test_btn->setIcon(QIcon(":/ui/data.png"));
    ui->test_btn->setIconSize(QSize(48,48));

    ui->me_btn->setIcon(QIcon(":/ui/my.png"));
    ui->me_btn->setIconSize(QSize(32,32));


    ui->mind_btn->setIcon(QIcon(":/ui/mind_pink.png"));
    ui->mind_btn->setIconSize(QSize(40,40));
    ui->mind_btn->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");

    ui->delete_btn->setIcon(QIcon(":/ui/delete.png"));

    ui->set_btn->setIcon(QIcon(":/ui/more.png"));
    ui->set_btn->setIconSize(QSize(32,32));
    ui->add_btn ->setIcon(QIcon(":/ui/add2.png"));
    ui->add_btn ->setIconSize(QSize(31,31));


    ui->edit_Box ->setIcon(QIcon(":/ui/edit.png"));
    ui->edit_Box ->setIconSize(QSize(32,32));

    ui->set_ico->setStyleSheet("image:url(:/ui/set.png);");
    ui->color_ico ->setStyleSheet("image:url(:/ui/work.png);");
    ui->en_ico ->setStyleSheet("image:url(:/ui/en.png);");
    ui->my_date->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->check_color1->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->check_color2->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->check_color3->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->check_color4->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->cet4_check->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->find_check->setStyleSheet("color:rgb(157, 38, 111);font: 75 12pt \"微软雅黑\";");
    ui->date_show->setStyleSheet("color:rgb(157, 38, 111);font: 75 10pt \"微软雅黑\";");



}

void Widget::set2()
{
ui->find_btn->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->test_btn->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->top->setStyleSheet("background-color: rgb(128, 213, 255);");
ui->find_btn->setIcon(QIcon(":/ui/blue_find.png"));
ui->find_btn->setIconSize(QSize(44,44));
ui->test_btn->setIcon(QIcon(":/ui/blue_test.png"));
ui->test_btn->setIconSize(QSize(48,48));



ui->set_btn->setIcon(QIcon(":/ui/blue_more.png"));
ui->set_btn->setIconSize(QSize(32,32));
    ui->delete_btn->setIcon(QIcon(":/ui/blue_delete.png"));
ui->me_btn->setIcon(QIcon(":/ui/blue_me.png"));
ui->me_btn->setIconSize(QSize(32,32));

ui->mind_btn->setIcon(QIcon(":/ui/mind_blue.png"));
ui->mind_btn->setIconSize(QSize(40,40));
ui->mind_btn->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->add_btn ->setIcon(QIcon(":/ui/blue_add.png"));
ui->add_btn ->setIconSize(QSize(31,31));
ui->edit_Box ->setIcon(QIcon(":/ui/blue_edit.png"));
ui->edit_Box ->setIconSize(QSize(32,32));
ui->set_ico->setStyleSheet("image:url(:/ui/blue_set.png);");
ui->color_ico ->setStyleSheet("image:url(:/ui/blue_color.png);");
ui->en_ico ->setStyleSheet("image:url(:/ui/blue_en.png);");
ui->my_date->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->check_color1->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->check_color2->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->check_color3->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->check_color4->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->cet4_check->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->find_check->setStyleSheet("color:#80d5ff;font: 75 12pt \"微软雅黑\";");
ui->date_show->setStyleSheet("color:#80d5ff;font: 75 10pt \"微软雅黑\";");

}


void Widget::set3()
{
ui->find_btn->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->test_btn->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->top->setStyleSheet("background-color: rgb(117, 117, 117);");
ui->find_btn->setIcon(QIcon(":/ui/black_find.png"));
ui->find_btn->setIconSize(QSize(44,44));
ui->test_btn->setIcon(QIcon(":/ui/black_test.png"));
ui->test_btn->setIconSize(QSize(48,48));


ui->set_btn->setIcon(QIcon(":/ui/black_more.png"));
ui->set_btn->setIconSize(QSize(32,32));

ui->me_btn->setIcon(QIcon(":/ui/black_me.png"));
ui->me_btn->setIconSize(QSize(32,32));
ui->delete_btn->setIcon(QIcon(":/ui/black_delete.png"));
ui->mind_btn->setIcon(QIcon(":/ui/black_mind.png"));
ui->mind_btn->setIconSize(QSize(40,40));
ui->mind_btn->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");


ui->add_btn ->setIcon(QIcon(":/ui/black_add.png"));
ui->add_btn->setIconSize(QSize(31,31));
ui->edit_Box ->setIcon(QIcon(":/ui/black_edit.png"));
ui->edit_Box ->setIconSize(QSize(32,32));
ui->set_ico->setStyleSheet("image:url(:/ui/black_set.png);");
ui->color_ico ->setStyleSheet("image:url(:/ui/black_color.png);");
ui->en_ico ->setStyleSheet("image:url(:/ui/black_en.png);");
ui->my_date->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->check_color1->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->check_color2->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->check_color3->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->check_color4->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->cet4_check->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->find_check->setStyleSheet("color:#757575;font: 75 12pt \"微软雅黑\";");
ui->date_show->setStyleSheet("color:#757575;font: 75 10pt \"微软雅黑\";");
}

void Widget::set4()
{
ui->find_btn->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->test_btn->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->top->setStyleSheet("background-color: rgb(69, 167, 77);");
ui->find_btn->setIcon(QIcon(":/ui/green_find.png"));
ui->find_btn->setIconSize(QSize(44,44));
ui->test_btn->setIcon(QIcon(":/ui/green_test.png"));
ui->test_btn->setIconSize(QSize(48,48));
ui->delete_btn->setIcon(QIcon(":/ui/green_delete.png"));

ui->set_btn->setIcon(QIcon(":/ui/green_more.png"));
ui->set_btn->setIconSize(QSize(32,32));




ui->me_btn->setIcon(QIcon(":/ui/green_me.png"));
ui->me_btn->setIconSize(QSize(32,32));

ui->mind_btn->setIcon(QIcon(":/ui/book.png"));
ui->mind_btn->setIconSize(QSize(40,40));
ui->mind_btn->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->add_btn->setIcon(QIcon(":/ui/green_add.png"));
ui->add_btn->setIconSize(QSize(31,31));
ui->edit_Box ->setIcon(QIcon(":/ui/green_edit.png"));
ui->edit_Box ->setIconSize(QSize(32,32));
ui->set_ico->setStyleSheet("image:url(:/ui/green_set.png);");
ui->color_ico ->setStyleSheet("image:url(:/ui/green_color.png);");
ui->en_ico ->setStyleSheet("image:url(:/ui/green_en.png);");
ui->my_date->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->check_color1->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->check_color2->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->check_color3->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->check_color4->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->cet4_check->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->find_check->setStyleSheet("color:#45a74d;font: 75 12pt \"微软雅黑\";");
ui->date_show->setStyleSheet("color:#45a74d;font: 75 10pt \"微软雅黑\";");

}

