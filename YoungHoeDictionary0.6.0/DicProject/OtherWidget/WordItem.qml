import QtQuick 2.9
import QtQuick.Controls 2.5
import"../javascript/CollectData.js" as DATA
import "../../BasicComponnet"
Rectangle {
    property  alias text: t.text
    property  alias trans: trans.text
    property  alias datainfo: d.text


    signal remove(var word);
    id: worditem
    color: "#cccccc"
    radius: 5
    width: 100
    height: 100
    border.color: "#cccccc"
    Text {id:d
        text: "Dat"
        font.family: "微软雅黑"
        font.pixelSize: 10
        color: "#EDEDED"
        anchors
        {
         right:parent.right
         bottom:parent.bottom
         rightMargin:2
          bottomMargin:2
        }
    }



    Text {id:t
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
         anchors.top:worditem.top
        text: "Word"
        font.family: "微软雅黑"
        font.pixelSize: 30
        color: "#ffffff"
    }


    Rectangle
    {
        id:info
        visible: false
        width: parent.width-10
        height:parent.height-30
            radius:3
            clip: true
        anchors
        {

            horizontalCenter:parent.horizontalCenter
            bottom:parent.bottom
            bottomMargin:5

        }
        ScrollView
        {
         width: info.width
         height: info.height
          Text {
             id:trans
                 text: ""
                 width: info.width
                 wrapMode: Text.WordWrap
                 font.family: "微软雅黑"
                 font.pixelSize: 18
                 anchors.left: parent.left
                   anchors.leftMargin:3
                   color: "#3B3B3B"
            }
        }




  }


    Component.onCompleted:
    {
      worditem.width=(t.text.length*10)+100
      worditem.height=100+t.text.length
       switch(t.text.length)
       {
       case 1:{worditem.color="#46485f"}break;
       case 2:{worditem.color="#5c7a29"}break;
       case 3:{worditem.color="#9b95c9"}break;
       case 4:{worditem.color="#d2553d"}break;
       case 5:{worditem.color="#375830"}break;
       case 6:{worditem.color="#70a19f"}break;
       case 7:{worditem.color="#5e7c85"}break;
       case 8:{worditem.color="#6e6b41"}break;
       case 9:{worditem.color="#3c3645"}break;
       case 10:{worditem.color="#1b315e"}break;
       case 11:{worditem.color="#7c8577"}break;
       }

    }



    MouseArea
    {
     hoverEnabled: true
     anchors.fill: parent

     onClicked:
     {

         if(!info.visible)
         {
         info.visible=true
         t.anchors.topMargin=2
         t.font.pixelSize=20
             playbtn.visible=true
               deletebtn.visible=true
         }else
         {
           info.visible=false
           playbtn.visible=false
             deletebtn.visible=false
           t.font.pixelSize=30
           t.anchors.topMargin=30
         }

     }


    }
    PlayBtn
    {
        id:playbtn
        visible: false
        width: 20
        height:20
     audio:t.text
     type:2
     anchors
     {
         top:worditem.top
         topMargin:3
        left:worditem.left
        leftMargin:3
     }
    }
    DeleteButton
    {
        id:deletebtn
        visible: false
        anchors
        {
         right:parent.right
         top:parent.top
         rightMargin:2
         topMargin:2

        }
        width: 20
        height:20
    onClicked: {worditem.remove(t.text)}
    }
}
