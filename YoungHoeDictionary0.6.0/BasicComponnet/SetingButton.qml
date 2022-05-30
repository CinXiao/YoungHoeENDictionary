import QtQuick 2.9
Rectangle
{
        id:showallbtn
        width: 30
        height:30
        radius:5
        color: "#ffffff"
        signal clicked();
        Behavior on color
        {
            ColorAnimation {
                duration: 300
            }
        }

        Image
        {

            anchors.centerIn: parent
            width: parent.width-5
            height: parent.height-5
            mipmap: true
            source:"../DicProject/ico/seting.png"

   }


        MouseArea{
        anchors.fill: parent
        propagateComposedEvents: true
        hoverEnabled: true

        onEntered:
        {
            showallbtn.color="#cccccc"
        }
        onExited:
        {

          showallbtn.color="#ffffff"
        }
        onClicked:
        { mouse.accepted = false
         showallbtn.clicked();
        }

    }
 }
