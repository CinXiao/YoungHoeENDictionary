import QtQuick 2.15
import QtQuick.Controls 2.5


Rectangle
{

    property int currentIndex:0



    id:root
    width:250
    height:50
    color: "#E8E8E8"
    radius: 5

    Rectangle
    {

        id:selecter
        x:menu1.x
        y:menu1.y
        z:1
        width:parent.width/3
        height:parent.height
        color: "#3282F6"
        radius: 5
        Text {
            id:t
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 15
            font.family: "微软雅黑"
            color: "#ffffff"
            text:"W"
        }




    }




    NumberAnimation
    {
        id:moveanimation
        target:selecter
       // easing.type:modelData
        to:200
        properties: "x"
        duration: 500
        easing.type: "OutQuart"

    }



    Row
    {
        anchors.fill: parent
        Rectangle
        {
            color: root.color
            id:menu1
            width:parent.width/3
            height:parent.height
            Text {id:menu1text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                font.family: "微软雅黑"
                color: "#000000"
                 text: "W"
            }
            MouseArea
            {
                   anchors.fill: parent
                   onClicked:
                   {
                       moveanimation.to=parent.x
                       moveanimation.restart()
                       t.text=menu1text.text
                       currentIndex=0
                   }
            }

        }
        Rectangle
        {
             color: root.color
            id:menu2
            width:parent.width/3
            height:parent.height
            MouseArea
            {
                   anchors.fill: parent
                   onClicked:
                   { t.text=menu2text.text
                       moveanimation.to=parent.x
                       moveanimation.restart()
                         currentIndex=1
                   }
            }
            Text {id:menu2text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                font.family: "微软雅黑"
                color: "#000000"
                 text: "R"

            }
        }
        Rectangle
        {
         color: root.color
         id:menu3
         width:parent.width/3
         height:parent.height
         Text {
             id:menu3text
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
             font.pixelSize: 15
             font.family: "微软雅黑"
             color: "#000000"
               text: "T"
         }
         MouseArea
         {
                anchors.fill: parent
                onClicked:
                {
                   t.text=menu3text.text
                    moveanimation.to=parent.x
                    moveanimation.restart()
                    currentIndex=2
                }
         }
        }

    }



}

