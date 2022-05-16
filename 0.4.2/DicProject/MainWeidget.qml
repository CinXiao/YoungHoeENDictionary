import QtQuick 2.0
import QtQuick.Controls 2.5
import "../BasicComponnet"
import "RootWidget"
Item {

    property int courrentindex:1
    SwipeView
    {
        id:view
        clip: true
        interactive: false
        anchors.fill: parent
        currentIndex:courrentindex
        Page{HomeWidget{}}
        Page{LearnWidget{}}
        Page{DictionaryWidget{}}
        Page{CollectWidget{id:collect}}




onCurrentIndexChanged:
{


    switch(currentIndex)
    {
     case 3:
     {
    collect.load()
     }break;

    }

}



    }

}
