import QtQuick 2.0
import "../../BasicComponnet"
Item
{
    anchors.fill: parent


    Row
    {
    anchors.fill: parent
    spacing: 10
    Rectangle
    {

        width: 150
        height: 200
        color: "#cccccc"
        Image {
            width: 100
            height:30
            source: "../ico/NE1.png"
        }

        Button
        {
            width: 50
            height: 25
            text: "打开"
            anchors
            {
                bottom:parent.bottom
                horizontalCenter:parent.horizontalCenter
                bottomMargin:10

            }

        }
    }
    Rectangle
    {

        width: 150
        height: 200
        color: "#cccccc"
        Image {
            width: 100
            height:30
            source: "../ico/NE2.png"
        }
    }
    Rectangle
    {

        width: 150
        height: 200
        color: "#cccccc"
        Image {
            width: 100
            height:30
            source: "../ico/NE3.png"
        }
    }
    Rectangle
    {

        width: 150
        height: 200
        color: "#cccccc"
        Image {
            width: 100
            height:30
            source: "../ico/NE4.png"
        }
    }
    }







}
