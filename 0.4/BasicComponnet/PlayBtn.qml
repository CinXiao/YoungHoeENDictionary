import QtQuick 2.9


Rectangle
{
        id:playbtn
        width: 25
        height:25
        radius:5
        anchors.horizontalCenter: parent.horizontalCenter

        Behavior on color
        {
            ColorAnimation {
                duration: 300
            }
        }

        Image
        {
            anchors.fill: parent
            width: parent.width-10
            height: parent.height-10
            mipmap: true
            source:"../DicProject/ico/playsound.png"
            MouseArea{

            anchors.fill: parent
            onClicked:
            {

                player.play()
            }
            hoverEnabled: true
            onEntered:
            {
                playbtn.color="#cccccc"
            }
            onExited:
            {
            playbtn.color="#ffffff"
            }

        }
        }
 }


