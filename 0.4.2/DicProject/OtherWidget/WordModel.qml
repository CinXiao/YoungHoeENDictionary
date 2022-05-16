import QtQuick 2.0
import QtGraphicalEffects 1.15
import "../../BasicComponnet"
import Collect 1.0
import "../javascript/Data.js" as DATA
Rectangle {

    property alias word: word_text.text
    property alias phonetic: word_phonetic.text
    property alias trans: word_trans.text

    border.color: "#cccccc"
    anchors.fill: parent
    radius: 5

    CollectCore {
        id: collecter
    }

    Rectangle {
        clip: true
        height: parent.height - 35
        width: parent.width - 35
        id: word_rect
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 20
            leftMargin: 10
        }

        radius: 5

        Column {

            spacing: 30
            Row {

                CollectBtn {
                    id: collectbtn
                    iscollect: false
                    onClicked: {
                        //没有收藏
                        if (!collecter.iscollected(word_text.text)) {
                            collecter.collect(word, trans, phonetic, 0)

                        } else { //取消收藏
                            collecter.remove(word);

                        }
                        iscollect = !iscollect
                    }
                }
                anchors.left: parent.left
                anchors.leftMargin: 10
                width: parent.width
                height: 35
                spacing: 5
                Text {
                    color: "#696969"
                    id: word_text
                    font.pixelSize: 30
                    font.bold: true
                    font.family: "微软雅黑"
                    text: ""
                    onTextChanged: {
                        collectbtn.iscollect = collecter.iscollected(
                                    word_text.text)
                    }
                }
                Text {
                    color: "#696969"
                    id: word_phonetic
                    font.pixelSize: 20
                    font.bold: true
                    font.family: "微软雅黑"
                    text: ""
                }
            }

            Row {

                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 20

                Row {
                    Text {
                        font.family: "微软雅黑"
                        text: "Google"
                    }
                    PlayBtn {
                        audio: word_text.text
                        type: 4
                    }
                }
            }

            Text {
                id: word_trans
                anchors.left: parent.left
                anchors.leftMargin: 20
                color: "#696969"
                font.pixelSize: 15
                font.bold: true
                font.family: "微软雅黑"
                text: ""
            }
        }
    }
}
