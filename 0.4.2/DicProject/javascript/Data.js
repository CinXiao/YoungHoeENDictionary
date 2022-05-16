

var worditem=[]
var parent;
var datacore;


function insertitem( item)
{

    worditem[worditem.length]=item;


}

function loading()
{

     clear()
    datacore.loaddata()
    for (var i = 0; i < datacore.length(); i++) {
        var worditem = Qt.createComponent(
                    "../OtherWidget/WordItem.qml")
       var itemobject= worditem.createObject(parent, {
                                  "text": datacore.getdat(
                                              i, "word"),
                                  "trans": datacore.getdat(
                                               i, "trans")
                              })
       insertitem(itemobject);

    }

}
function clear()
{

    for(var i=0;i<worditem.length;++i)
    {
      worditem[i].destroy();
    }

    worditem.length=0;
}
