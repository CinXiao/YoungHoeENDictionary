import QtQuick 2.9
Rectangle
{
       id:btn
        width:40
        height:40
        radius:20
        color: "#ffffff"
        signal open(var i);
        property bool isopen: true
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
            width: parent.width-20
            id:img
            height: parent.height-20
            mipmap: true
            source:"../DicProject/ico/opensound.png"
            MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered:
            {

                btn.color="#cccccc"


            }
            onExited:
            {

                btn.color="#ffffff"

            }
           onClicked:
            {
              isopen=!isopen

             if(!isopen)
             {


                 img.source="../DicProject/ico/unsound.png"


               }else{
                 img.source="../DicProject/ico/opensound.png"
                 }
                   btn.open(isopen)


              }



            }

        }
        }


