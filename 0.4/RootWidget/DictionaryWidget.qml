import QtQuick 2.9
import QtGraphicalEffects 1.15
import WordBooks 1.0
import QtQuick.Controls 2.5
import "../OtherWidget"
import"../../BasicComponnet"

Rectangle
{


    BookCore
    {
     id:bookscore
    }


    BookWordList
    {
     id:bookwordlist
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

     listmodel.clear()
    bookwordlist.openbook(path)

    for(var i=0;i<bookwordlist.count();++i)
    {
        listmodel.append({"word":bookwordlist.getword(i),"trans":bookwordlist.gettrans(i)})
    }

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




        Component
        {
            id:listdelegate

         Rectangle
         {
             radius:2

             width:wordlist.width
             height:25


             Text {
                 id:wordtext
                 anchors.verticalCenter:parent.verticalCenter
                 font.family: "微软雅黑"
                 width: 200
                 height:parent.height
                 font.pixelSize: 12
                 text:word
                 anchors.left: parent.left
                 anchors.leftMargin: 5
                 }
             TextInput {
                 id:transtext
                 anchors.verticalCenter:parent.verticalCenter
                 font.family: "微软雅黑"
                 height:parent.height
                 clip: true
                 enabled: false
                 anchors
                 {
                    left:wordtext.right
                    right:parent.right


                 }
                 font.pixelSize: 12
                 text: trans
                 }



             MouseArea
             {
                anchors.fill: parent

                hoverEnabled: true

                onEntered:
                {
                 parent.color="#cccccc"


                }
                onExited:
                {
                    parent.color="#ffffff"

                }
                onClicked:
                {
                     wordinfo.word=wordtext.text
                     wordinfo.trans=transtext.text
                }






             }


         }


        }





        SwipeView
        {

            anchors.fill: parent
            currentIndex: menu.currentIndex
            interactive: false
            anchors.margins: 3
           clip: true
            //列表模式
            Page
            {
                ScrollView
                {

                    anchors.fill: parent
                ListView
                {

                    id:wordlist
                    clip: true
                    anchors{
                    left: parent.left
                    right: parent.right
                    leftMargin: 3
                    rightMargin: 3
                    bottom: parent.bottom
                    top:parent.top
                    topMargin:40
                    }


                    model:listmodel
                    delegate:listdelegate


                }

         }


                Row
                {

                    spacing: 15
                    anchors.top: parent.top
                    anchors.topMargin:5
                    anchors.leftMargin:5
                    anchors.left: parent.left
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
                    }
                    MoreButton
                    {

                        onClicked:
                        {

                            wordinfo.visible=(wordinfo.visible===false)?true:false
                        }
                    }
                }








                    WordModel
                    {
                        id:wordinfo
                        visible: false

                        back.visible: false
                        anchors
                        {
                         top:wordlist.top
                         bottom:wordlist.bottom
                         left:wordlist.left
                         leftMargin:200
                        }

                    }





            }


              //卡片模式
            Page
            {



                Text {

                    text:"正在开发"
                }




            }
             //矩块模式
            Page
            {

                id:rectmodle
                ScrollView
                {
                    anchors.fill: parent
                    Flow
                    {
                      spacing: 3
                     width:rectmodle.width

                     Word{}
                    }

                }

            }


        }

        XMenu
        {
            id:menu
            visible: false
            anchors
            {
                bottom:parent.bottom
                bottomMargin:5
                horizontalCenter:parent.horizontalCenter


            }
        }

    }





}
