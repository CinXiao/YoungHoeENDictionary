import QtQuick 2.9
import QtGraphicalEffects 1.15
import "../../BasicComponnet"
Item {



    signal openbook(string name);
    id:root

    property alias color:book.color
    property alias writename:writename.text
    property alias bookname:bookname.text
    width: 150
    height:200
    DropShadow
    {
     anchors.fill: book
     color:"#cccccc"
     samples: 20
     radius:10
     source:book
     horizontalOffset: 2
    verticalOffset: 2
    }

    Rectangle
    {

        id:book
        anchors.fill: parent
        radius:5
        color:"#5A5882"
        Text {
            id:bookname
            anchors
            {
            top:parent.top
           topMargin:10
           horizontalCenter:parent.horizontalCenter
            }
              font.pixelSize: 15
              color:"#ffffff"
            font.family: "微软雅黑"
            text:"CET4-EASY"
        }

        Text {
                id:writename
            anchors
            {
               top:bookname.bottom
               topMargin:5
               horizontalCenter:bookname.horizontalCenter
            }
             color:"#ffffff"
            font.pixelSize: 12
            font.family: "微软雅黑"
            text:"System"
        }

        //展开按钮
        ShowAllButton
        {


            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            onClicked:
            {
                openbook(bookname.text)
            }
        }


    }




}
