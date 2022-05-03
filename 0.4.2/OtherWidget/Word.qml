import QtQuick 2.9
import QtQuick.Controls 2.5
Rectangle
{
    property alias word: word.text
    property alias trans: trans.text
    width:150
    height: 150
    radius:5
    color:"#305C41"

    Column
    {
    spacing: 2
    anchors.fill: parent
    anchors.margins: 2
    anchors.horizontalCenter: parent.horizontalCenter
    Text {
        id:word
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 15
        font.family: "微软雅黑"
        color:"#EDEDED"
        text:"Word"
    }

    ScrollView
    {
        clip: true
        anchors
        {
         left:parent.left
         right:parent.right
         bottom:parent.bottom
         bottomMargin:3
         leftMargin:3
         rightMargin:3
         topMargin:3
         top:word.bottom
        }

        Text {

            id:trans
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 10
            font.family: "微软雅黑"
            color:"#EDEDED"
            text:"asds"
        }

    }


    }


}
