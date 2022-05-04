import QtQuick 2.9
Rectangle
{
       id:btn
        width:40
        height:40
        radius:20
        color: "#ffffff"
        signal show(var i);
        property bool ispshow: true
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
            source:"../DicProject/ico/show.png"
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
              ispshow=!ispshow

             if(!ispshow)
             {


                 img.source="../DicProject/ico/unshow.png"


               }else{
                 img.source="../DicProject/ico/show.png"
                 }
                   btn.show(ispshow)


              }



            }

        }
        }


