import QtQuick 2.9
import QtGraphicalEffects 1.15
import "../../BasicComponnet"
Item {


    property string color:""
    property string writer:""
    property string name:""

    property string path:""

    signal openbook(string path);
    signal insbook(string path,string name,string write,string color);
    id:root



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

        Image {
            anchors.fill: parent
            opacity: 0.2
           source: "../img/bookback.jpg"
        }
        clip: true
        id:book
        anchors.fill: parent
        radius:5
        color:root.color
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
            text:name
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
            text:writer
        }
    }



    Row
    {


        id:buttons
        anchors.horizontalCenter: book.horizontalCenter
        anchors.bottom: book.bottom
        anchors.bottomMargin: 20
        spacing: 3


        SetingButton
        {
            onClicked:
            {
                root.insbook(root.path,root.name,root.writer,root.color)
               // console.log("clicked"+bookname.text)
            }
        }
        ShowAllButton
        {




            onClicked:
            {
                root.openbook(root.path)
                console.log("clicked"+bookname.text)
            }
        }




    }





}
