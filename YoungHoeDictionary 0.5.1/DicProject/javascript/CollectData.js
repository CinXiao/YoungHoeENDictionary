

 var worditem=[]
 var parent;
var datacore;


function insertitem( item)
{

    worditem[worditem.length]=item;
}
function remove(word)
{

datacore.remove(word);

    loading();

}

function loading()
{

     clear()
    datacore.loaddata()
    for (var i = 0; i < datacore.length(); i++) {
        var worditem = Qt.createComponent("../OtherWidget/WordItem.qml")

       var itemobject= worditem.createObject(parent, {
                                  "text": datacore.getdat(
                                              i, "word"),
                                  "trans": datacore.getdat(
                                               i, "trans"),
                                                 "datainfo": datacore.getdat(
                                                              i, "date")
                              })
       itemobject.remove.connect(remove)
       insertitem(itemobject);

    }

}
function clear()
{

    for(var i=0;i<worditem.length;++i)
    {
       if(worditem[i])
      worditem[i].destroy();
    }

    worditem.length=0;
}
