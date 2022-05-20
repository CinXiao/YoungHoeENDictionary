#include "searchword.h"

SearchWord::~SearchWord()
{
    delete _wordfilesystem;
}


SearchWord::SearchWord()
{
    _wordfilesystem=new WordFileSystem("SystemWordBooks/Core.xml");
    _list=_wordfilesystem->getwordlist();

}



 int SearchWord::getcount()
 {



     if(_max_check>=7)return 7;
     return _max_check;
 }


QString SearchWord::search(QString word,QString type)
{


  auto finder=_check.begin();

  while(finder!=_check.end())
  {

      if(finder->_word==word)
      {
          if(type=="word")
          {
              return finder->_word;
          }
          else if(type=="trans")
          {
               return finder->_trans;
          }else if(type=="phonetic")
          {

              return finder->_phonetic;

          }
          else if(type=="tags")
          {

              return finder->_tags;
          }else if(type=="progress")
          {
              return QString::number(finder->_progress);

          }else
          {

              return "搜索类型错误";
          }

      }
      ++finder;
  }



  return "";

}

QString SearchWord::search(QString word,int index,QString type)//目标单词
{



    _check.clear();//清空寄存列表
    _max_check=0;


    //迭代器迭代list，模糊查找目标
    auto finder=_list.begin();
    while(finder!=_list.end())
    {
        if(finder->_word.contains(word))
        {
            _max_check++;
             _check<<*finder;//录入指定单词到寄存器
        }
        finder++;
    }
    if(word=="")return "字段为空";
    if(index>=_max_check)return "*";
    if(_max_check==0)return "找不到数据";



    if(type=="word")
    {
        return _check[index]._word;
    }
    else if(type=="trans")
    {
         return _check[index]._trans;
    }else if(type=="phonetic")
    {

        return _check[index]._phonetic;

    }
    else if(type=="tags")
    {

        return _check[index]._tags;
    }else if(type=="progress")
    {
        return QString::number(_check[index]._progress);

    }else
    {

        return "搜索类型错误";
    }

    return "未知错误";

}
