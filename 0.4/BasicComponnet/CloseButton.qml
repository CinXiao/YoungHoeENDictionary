import QtQuick 2.9
Rectangle
{
        id:closebtn
        width: 25
        height:25
        radius:5
        signal clicked();
        Behavior on color
        {
            ColorAnimation {
                duration: 300
            }
        }

        Image
        {
            anchors.fill: parent
            width: 15
            height: 15
            mipmap: true
            source:"../DicProject/ico/close.png"
            MouseArea{

            anchors.fill: parent

            hoverEnabled: true
            onEntered:
            {


               closebtn.color="#cccccc"
            }
            onExited:
            {

              closebtn.color="#ffffff"
            }
            onClicked:
            {

              closebtn.clicked();

            }

        }
        }
 }
