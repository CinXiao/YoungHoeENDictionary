import QtQuick 2.9
import QtGraphicalEffects 1.15
import WordBooks 1.0

import "../OtherWidget"
import"../../BasicComponnet"

Rectangle
{


    BookCore
    {
     id:bookscore
    }




    clip: true
    anchors.fill: parent
    Flow
    {

        id:bookslist

        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        spacing: 10


         Component.onCompleted:
         {
             for(var i=0;i<bookscore.getbookcount();++i)
             {
                 var temp=Qt.createComponent("../OtherWidget/DicBook.qml")

                 if(temp.status===Component.Ready)
                 {
                  var item= temp.createObject(bookslist,{"color":bookscore.getbookinfo(i,"color"),"path":bookscore.getbookinfo(i,"path"),"name":bookscore.getbookinfo(i,"name"),"writer":bookscore.getbookinfo(i,"writer")})
                      item.openbook.connect(openwordlistview);
                 }
             }
         }

    }


function openwordlistview(path)
{


    listmodel.append({"word":"test"})
    showlist.visible=true;
    bookslist.visible=false;

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





        ListModel
        {
            id:listmodel
        }



        //列表模式
        ListView
        {

            clip: true
            height: parent.height
            width: parent.width-50
            anchors{
            left: parent.left
            leftMargin: 15
            top:parent.top
            topMargin:20
            }


            model:listmodel
            delegate:Rectangle
                    {
                        width:parent.width
                        height:25

                        TextInput
                        {
                            width: parent.width
                            font.family: "微软雅黑"
                            font.pixelSize: 12
                            enabled: false
                            selectByMouse: true
                            text:word
                        }


                    }


        }




        XMenu
        {
            id:menu
            anchors
            {
                bottom:parent.bottom
                bottomMargin:5
                horizontalCenter:parent.horizontalCenter


            }
        }
        CloseButton
        {
            id:close
            onClicked:
            {
                width:0
                height:0
             showlist.visible=false
             bookslist.visible=true
            }
            anchors.top: parent.top
            anchors.topMargin:5
            anchors.rightMargin:5
            anchors.right: parent.right
        }

    }





}
