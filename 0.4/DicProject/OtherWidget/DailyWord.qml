import QtQuick 2.9

import "../../BasicComponnet"
Item {
    width: 250
    height:150



    Column{
        width:parent.width
        height:parent.height-50
    Text {
        wrapMode: Text.WordWrap
        id:english

        width:parent.width
        height:parent.height/2
        font.family: "微软雅黑"
        text:"You can't let the mistakes of the past determine your future."
    }
    Text {
        wrapMode: Text.WordWrap
        id:chinese

        width:parent.width
        height:parent.height/2
        font.family: "微软雅黑"
        text:"不要让过去的错误决定你的未来。"
    }

    PlayBtn
    {
        anchors.horizontalCenter: parent.horizontalCenter
        audio: english.text

    }






    }

}
