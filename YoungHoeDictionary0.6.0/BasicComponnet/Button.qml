import QtQuick 2.0
import QtGraphicalEffects 1.15


Item
{
    id:root

    property int w: 100
    property int h:30
    property int r: 5
    property alias text: m_text.text

    signal clicked()
    width:w
    height:h







    //状态
    states:
        [
        //按下状态
        State {
            name: "Pressed"
            PropertyChanges {
                target: btn
                color:"#409AE0"
            }

            PropertyChanges {
                target: m_text
                font.pixelSize:11
            }
        },
        //点击后状态
        State
        {
            name:"Clicked"
            PropertyChanges {
                target: btn
                color:"#409AE0"

            }

        },
        //进入后状态
        State
        {
            name:"Entered"
            PropertyChanges {
                target: btn
                color:"#409AE0"
            }
        },
        State {
            name: "Exited"
            PropertyChanges {
                target: btn
                color:"#3282F6"

            }
        }
        ]









    //组件

    Rectangle
    {
        anchors.fill:parent
        id:btn
        radius:root.r
        color:"#3282F6"

        Text {
            anchors.centerIn: parent
            id:m_text
            font.family: "微软雅黑"
            text:"Hello,你好"
            color:"#ffffff"
        }


        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onClicked:
            {
              root.state="Clicked"
              root.clicked()
            }
            onPressed:
            {
              root.state="Pressed"
            }
            onExited:
            {
               root.state="Exited"
            }
            onEntered:
            {
              root.state="Entered"
            }


        }
        Behavior on color
        {

            ColorAnimation {

                duration: 200
            }

        }




    }


}


