import QtQuick 2.9
import QtGraphicalEffects 1.15
Item{

    property int height1: 400
    property int width1: 150
    property int width2: 70
    property int current:0
    property color color1:"#429FE8"
    property int r: 5
    width:width1
    height:height1
    id:root





    Rectangle
    {
        id:menubar
        color: color1

        width:root.width
        height:root.height
        radius:r
        clip: true

        ListModel
        {
            id:m
            ListElement{t:"首页";ico:"ico/home.png"}
            ListElement{t:"学习";ico:"ico/learn.png"}
            ListElement{t:"词典";ico:"ico/dictionary.png"}
            ListElement{t:"收藏";ico:"ico/collect.png"}
        }

        Component
        {
            id:item
            Rectangle
            {
            id:rect
            width:width1
            height:50
                color:color1
                radius:5


                Image{
                    anchors.left: parent.left
                    anchors.leftMargin:15
                    width:40;height:40;source: ico
                    anchors.verticalCenter: parent.verticalCenter
                    id:img
                    mipmap:true
                }
                Text{

                    font.family: "微软雅黑"
                    anchors.left: img.right
                    anchors.leftMargin: 30
                    text:t
                    font.bold: true
                  font.pixelSize: 25
                  color:"#F2F2F2"
                  anchors.verticalCenter:img.verticalCenter
                }

            MouseArea
            {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rect.color="#398AC9"
            onExited: rect.color=color1
            onClicked:
            {
                current=index;
            }
            }
            Behavior on color
            {
                ColorAnimation
                {

                    duration: 100
                }
            }



            }
        }

        GridView
        {
            anchors.top: parent.top
            anchors.left: parent.left
            interactive: false
            height:parent.height-10
            width:parent.width-10
            cellHeight: 60;
            model: m
            delegate:item
        }



    }



    Behavior on width
    {
        NumberAnimation
        {
         duration: 300
        }
    }


    Rectangle
    {
    id:changebtn
    width:30
    height:30
    radius:15
    border.width: 2
    border.color: "#F2F2F2"
    anchors.left: menubar.right
    anchors.leftMargin: -width/2
    anchors.verticalCenter:menubar.verticalCenter
    color:"#ffffff"
    Image
    {
     height:20
     width:20
     anchors.centerIn: parent
     source:"ico/unfold.png"
    id:unfold
    rotation:180
     mipmap:true
    }

        MouseArea
        {
        anchors.fill: parent
        onClicked:
        {
            unfold.rotation=(unfold.rotation==0)?180:0
          root.width=(root.width==width1)?width2:width1
        }

        }

    }


    Text {
        font.family: "微软雅黑"
        font.bold: true
        font.pixelSize: 10
        color:"#ffffff"
        anchors.bottom: menubar.bottom
        text: "For YH\nGithub\\CinXiao\nEmali:2256530727@qq.com"
    }
}
