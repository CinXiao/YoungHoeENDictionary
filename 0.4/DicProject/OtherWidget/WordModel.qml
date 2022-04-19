import QtQuick 2.0
import QtGraphicalEffects 1.15
import "../../BasicComponnet"
Rectangle
{

    property alias word:word_text.text
    property alias phonetic: word_phonetic.text
    property alias trans:word_trans.text
    anchors.fill: parent


    DropShadow
    {
     anchors.fill: word_rect
     color:"#cccccc"
     samples: 20
     radius:11
     source:word_rect
     horizontalOffset: 2
    verticalOffset: 2
    }

        Rectangle
        {
            clip: true
            height:parent.height-35
            width:parent.width
            id:word_rect
            anchors
            {
            top:parent.top
            left:parent.left
            topMargin: 20

            }

            radius:5


            Column
            {

                anchors.fill: parent
                spacing: 30
                Row
                {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width
                    height:35
                    spacing: 5
                    Text {
                        color:"#696969"
                        id:word_text
                        font.pixelSize:30
                        font.bold: true
                        font.family: "微软雅黑"
                        text:""

                    }
                    Text {
                        color:"#696969"
                        id:word_phonetic
                        font.pixelSize:20
                        font.bold: true
                        font.family: "微软雅黑"
                        text:""
                    }

                }


                Row
                {

                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    spacing: 20


                    Row{
                        Text {
                            font.family: "微软雅黑"
                            text: "有道1"
                        }
                        PlayBtn
                        {
                            audio:word_text.text
                            type:1
                        }  }

                    Row{Text {
                            font.family: "微软雅黑"
                            text: "有道2"
                        }

                        PlayBtn
                        {
                         audio:word_text.text
                         type:2
                        }}

                    Row{
                        Text {
                            font.family: "微软雅黑"
                            text: "有道3"
                        }

                        PlayBtn
                        {
                         audio:word_text.text
                         type:3
                        }}
                    Row{
                    Text {
                        font.family: "微软雅黑"
                        text: "Google[Bug]"
                    }
                     PlayBtn
                        {
                         audio:word_text.text
                         type:4
                        }
                    }


                }

                Text {
                    id: word_trans

                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    color:"#696969"
                    font.pixelSize:15
                    font.bold: true
                    font.family: "微软雅黑"
                    text:""
                }


            }




        }






}


