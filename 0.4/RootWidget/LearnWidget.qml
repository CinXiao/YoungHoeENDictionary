import QtQuick 2.9
import "../../BasicComponnet"
import "../OtherWidget"
import QtQuick.Controls 2.5

    ScrollView
    {
        anchors.fill: parent
        anchors.margins: 10
        id:root

        clip: true


            Column
            {
             spacing: 10
             width:root.width
             //音标学习界面
             LearnPhonetic{}


             Rectangle
             {
             width:200
             height:2000
             color:"#cccccc"

             }

            }

    }



