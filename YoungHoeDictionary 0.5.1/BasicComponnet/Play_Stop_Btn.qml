import QtQuick 2.9
Rectangle
{
       id:btn
        width:40
        height:40
        radius:20
        color: "#ffffff"

        signal playing();
        signal stoped();

        function deful()
        {
            isplaying=false
            img.source="../DicProject/ico/play.png"

        }

        property bool isplaying: false
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
            state: "unplay_def"

            anchors.centerIn: parent
            width: parent.width-10
            id:img
            height: parent.height-10
            mipmap: true
            source:"../DicProject/ico/play.png"
            MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered:
            {

                if(isplaying)
                {
                    img.source="../DicProject/ico/stop2.png"
                }else
                {
                    img.source="../DicProject/ico/play2.png"

                }

                btn.color="#cccccc"


            }
            onExited:
            {
                if(isplaying)
                {
                    img.source="../DicProject/ico/stop.png"
                }else
                {
                    img.source="../DicProject/ico/play.png"

                }
                btn.color="#ffffff"

            }
           onClicked:
            {

            isplaying=!isplaying
             if(isplaying)
             {

                 btn.playing()
                   img.source="../DicProject/ico/stop2.png"
               }else
               {
                 btn.stoped()
                 img.source="../DicProject/ico/play2.png"
              }


            }

        }
        }

 }
