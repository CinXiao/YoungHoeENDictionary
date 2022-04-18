#include "word.h"
Word::Word(QString word, QString trans,QString phonetic,QString tags,int progress):
     _word(word),_trans(trans),_phonetic(phonetic),_tags(tags),_progress(progress)
 {




}


Word::Word(){}

  QString Word::gettrans()
  {

      return _trans;

  }
