#include "searchword.h"


SearchWord::SearchWord()
{


    WordFileSystem wordfile("WordList/CET-4 EASY.xml");

    std::copy()
    QVector<Word> temp=wordfile.getwordlist();


}
 int SearchWord::getcount()
 {



     return _max_check;
 }


QString SearchWord::search(QString word,int index,QString type)//目标单词
{



   qDebug()<<_list[0]._word;

    return "test";

    check.clear();//清空寄存列表
    _max_check=0;



    //迭代器迭代list，模糊查找目标
    auto finder=_list.begin();
    while(finder!=_list.end())
    {
        if(finder->_word.contains(word))
        {
            _max_check++;
            if(_max_check<7)
             check<<*finder;//录入指定单词到寄存器
        }
        finder++;
    }


    if(word=="")return "字段为空";
    if(index>=_max_check)return "索引越界";
    if(_max_check==0)return "找不到数据";

    if(type=="word")
    {
        return check[index]._word;
    }else if(type=="trans")
    {
         return check[index]._trans;
    }else if(type=="_phonetic")
    {

        return check[index]._phonetic;

    }
    else if(type=="_tags")
    {

        return check[index]._tags;
    }else if(type=="progress")
    {
        return QString::number(check[index]._progress);

    }else
    {

        return "搜索类型错误";
    }

    return "未知错误";

}
