import QtQuick 2.9
import QtMultimedia 5.9

Rectangle
{
        id:playbtn
        width: 25
        height:25
        radius:5
        property int type:1
        property string audio:"test"
        MediaPlayer
        {
            id:player
              }
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

            hoverEnabled: true
            onEntered:
            {
                 player.source="https://ssl.gstatic.com/dictionary/static/sounds/oxford/"+audio+"--_gb_1.mp3"
                 playbtn.color="#cccccc"
                 player.play();

             }
            onExited:
            {
                player.stop();
            playbtn.color="#ffffff"
            }

        }
        }
        function play()
        {

             player.source="https://ssl.gstatic.com/dictionary/static/sounds/oxford/"+audio+"--_gb_1.mp3"
            player.play();
        }
 }


