import QtQuick 2.9
import QtMultimedia 5.9
import "../../BasicComponnet"
Item {
    width: 250
    height:150


    MediaPlayer
    {
        id:player
        source: "http://dict.youdao.com/dictvoice?audio="+english.text+"&type=1"


    }

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


    }






    }

}
