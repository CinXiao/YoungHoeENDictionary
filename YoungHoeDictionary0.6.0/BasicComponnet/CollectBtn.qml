import QtQuick 2.9
Rectangle
{
       id:btn
        width:40
        height:40
        radius:20
        color: "#ffffff"

        property bool iscollect: false
        signal clicked()
        Behavior on color
        {
            ColorAnimation {
                duration: 300
            }
        }



        Behavior on color
        {

            ColorAnimation {
                duration: 200
            }

        }



        Image
        {

            anchors.centerIn: parent
            width: parent.width-10
            id:img
            height: parent.height-10
            mipmap: true
            source:iscollect?"../DicProject/ico/collected.png":"../DicProject/ico/uncollect.png"
            MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered:
            {

                btn.color="#FFF0B5"
            }
            onExited:
            {
                btn.color="#ffffff"
            }

           onClicked:
            {
                btn.clicked()
            }



        }
        }

 }
