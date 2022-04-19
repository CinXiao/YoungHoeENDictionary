import QtQuick 2.9
import QtGraphicalEffects 1.15
import "../OtherWidget"
import"../../BasicComponnet"
Rectangle
{
    clip: true
    anchors.fill: parent
    Flow
    {

        id:bookslist

        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        spacing: 10

         DicBook
         {

             onOpenbook:
             {
              showlist.visible=true
             }
         }


         Component.onCompleted:
         {

             //获取所有单词本信息

             for(var i=0;i<10;++i)
             Qt.createQmlObject('
                       import "../OtherWidget"
                       DicBook
                        {
                           bookname:'+'bookslist.objectName'+'
                             onOpenbook:
                             {
                              showlist.visible=true
                             }
                        }
                    ',bookslist)


         }







    }




    Rectangle
    {

        visible: false
        id:showlist
        width:parent.width-20
        height:parent.height-20
        radius:5
        border.color: "#cccccc"
        anchors.centerIn: parent
        color:"#ffffff"
        CloseButton
        {
            id:close
            onClicked:
            {
             showlist.visible=false
            }
            anchors.top: parent.top
            anchors.topMargin:5
            anchors.rightMargin:5
            anchors.right: parent.right
        }
        Behavior on width
        {

            NumberAnimation
            {

            duration: 100
            }
        }
        Behavior on height
        {

            NumberAnimation
            {

            duration: 100
            }
        }

    }





}
