import QtQuick 2.9
import QtGraphicalEffects 1.15
import WordBooks 1.0
import QtQuick.Controls 2.5
import QtMultimedia 5.9
import "../OtherWidget"
import "../../BasicComponnet"

Rectangle {

    property int word_count: 0
    property int cur_index: 0

    BookCore {
        id: bookscore
    }

    BookWordList {
        id: bookwordlist
    }

    clip: true
    anchors.fill: parent

    id: root
    ScrollView {
        width: parent.width
        height: parent.height
        Flow {

            id: bookslist

            width: root.width
            height: root.height
            spacing: 10
            Component.onCompleted: {
                word_count = bookscore.getbookcount()
                for (var i = 0; i < word_count; ++i) {
                    var temp = Qt.createComponent("../OtherWidget/DicBook.qml")

                    if (temp.status === Component.Ready) {
                        var item = temp.createObject(bookslist, {
                                                         "color": bookscore.getbookinfo(
                                                                      i,
                                                                      "color"),
                                                         "path": bookscore.getbookinfo(
                                                                     i, "path"),
                                                         "name": bookscore.getbookinfo(
                                                                     i, "name"),
                                                         "writer": bookscore.getbookinfo(
                                                                       i,
                                                                       "writer")
                                                     })
                        item.openbook.connect(openwordlistview)
                        item.insbook.connect(insbookinfo)
                    }
                }
            }
        }
    }

    function insbookinfo(path) {

        console.log("Ins book info")
        setview.visible = true
    }

    function openwordlistview(path) {

        listmodel.clear()
        bookwordlist.openbook(path)
        wordinfo.word = bookwordlist.getword(0)
        wordinfo.trans = bookwordlist.gettrans(0)
        wordinfo.phonetic = bookwordlist.getphonetic(0)

        for (var i = 0; i < bookwordlist.count(); ++i) {
            listmodel.append({
                                 "word": bookwordlist.getword(i),
                                 "trans": bookwordlist.gettrans(i),
                                 "phonetic": bookwordlist.getphonetic(i)
                             })
        }

        showlist.visible = true
        bookslist.visible = false

        //卡片模式界面初始化
        card_title.text = bookwordlist.getword(0)
        card_p.text = bookwordlist.getphonetic(0)
        card_trans.text = bookwordlist.gettrans(0)
        card_title.text = bookwordlist.getword(0)
        player_btn.audio = card_title.text
    }

    //设置窗口
    Rectangle {
        visible: false
        id: setview
        anchors.fill: parent
        color: "#ffffff"

        MouseArea {
            anchors.fill: parent
        }

        Rectangle {
            id: bookshow
            width: 150
            height: 200
            radius: 5
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 30
            anchors.leftMargin: 30
            color: "#cccccc"
        }

        Column {

            spacing: 5
            anchors.fill: parent
            CloseButton {
                onClicked: setview.visible = false
            }

            Text {

                font.pixelSize: 15
                font.family: "微软雅黑"
                text: "词典名"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                id: booknameinput
                font.pixelSize: 15
                font.family: "微软雅黑"
                text: "NULL"
                selectByMouse: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {

                font.pixelSize: 15
                font.family: "微软雅黑"
                text: "作者名"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                id: writenameinput
                font.pixelSize: 15
                font.family: "微软雅黑"
                text: "NULL"
                selectByMouse: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {

                font.pixelSize: 15
                font.family: "微软雅黑"
                text: "书皮颜色"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {

                height: 250
                width: 250
                anchors.horizontalCenter: parent.horizontalCenter
                Flow {
                    spacing: 1
                    anchors.fill: parent
                    Colorbtn {
                        color: "#f7acbc"
                        onClick: {
                            changeinfo(color)
                        }
                    }
                    Colorbtn {
                        color: "#ef5b9c"
                    }
                    Colorbtn {
                        color: "#f15b6c"
                    }
                    Colorbtn {
                        color: "#f391a9"
                    }
                    Colorbtn {
                        color: "#bd6758"
                    }
                    Colorbtn {
                        color: "#d71345"
                    }
                    Colorbtn {
                        color: "#d93a49"
                    }
                    Colorbtn {
                        color: "#bb505d"
                    }
                    Colorbtn {
                        color: "#973c3f"
                    }
                    Colorbtn {
                        color: "#aa363d"
                    }
                    Colorbtn {
                        color: "#f3715c"
                    }
                    Colorbtn {
                        color: "#7a1723"
                    }
                    Colorbtn {
                        color: "#8e453f"
                    }
                    Colorbtn {
                        color: "#733a31"
                    }
                    Colorbtn {
                        color: "#f15a22"
                    }
                    Colorbtn {
                        color: "#b4532a"
                    }
                    Colorbtn {
                        color: "#b7704f"
                    }
                    Colorbtn {
                        color: "#c99979"
                    }
                    Colorbtn {
                        color: "#f58220"
                    }
                    Colorbtn {
                        color: "#ae6642"
                    }
                    Colorbtn {
                        color: "#69541b"
                    }
                    Colorbtn {
                        color: "#df9464"
                    }
                    Colorbtn {
                        color: "#6d5826"
                    }
                    Colorbtn {
                        color: "#dec674"
                    }
                    Colorbtn {
                        color: "#596032"
                    }
                    Colorbtn {
                        color: "#525f42"
                    }
                    Colorbtn {
                        color: "#2e3a1f"
                    }
                    Colorbtn {
                        color: "#4d4f36"
                    }
                    Colorbtn {
                        color: "#b2d235"
                    }
                    Colorbtn {
                        color: "#5c7a29"
                    }
                    Colorbtn {
                        color: "#7fb80e"
                    }
                    Colorbtn {
                        color: "#6d8346"
                    }
                    Colorbtn {
                        color: "#78a355"
                    }
                    Colorbtn {
                        color: "#74905d"
                    }
                    Colorbtn {
                        color: "#1d953f"
                    }
                    Colorbtn {
                        color: "#77ac98"
                    }
                    Colorbtn {
                        color: "#007d65"
                    }
                    Colorbtn {
                        color: "#45b97c"
                    }
                    Colorbtn {
                        color: "#007947"
                    }
                    Colorbtn {
                        color: "#375830"
                    }
                    Colorbtn {
                        color: "#65c294"
                    }
                    Colorbtn {
                        color: "#00ae9d"
                    }
                    Colorbtn {
                        color: "#508a88"
                    }
                    Colorbtn {
                        color: "#50b7c1"
                    }
                    Colorbtn {
                        color: "#00a6ac"
                    }
                    Colorbtn {
                        color: "#78cdd1"
                    }
                    Colorbtn {
                        color: "#008792"
                    }
                    Colorbtn {
                        color: "#009ad6"
                    }
                    Colorbtn {
                        color: "#145b7d"
                    }
                    Colorbtn {
                        color: "#7bbfea"
                    }
                    Colorbtn {
                        color: "#228fbd"
                    }
                    Colorbtn {
                        color: "#2468a2"
                    }
                    Colorbtn {
                        color: "#2570a1"
                    }
                    Colorbtn {
                        color: "#1b315e"
                    }
                    Colorbtn {
                        color: "#003a6c"
                    }
                    Colorbtn {
                        color: "#102b6a"
                    }
                    Colorbtn {
                        color: "#46485f"
                    }
                    Colorbtn {
                        color: "#181d4b"
                    }
                    Colorbtn {
                        color: "#1a2933"
                    }
                    Colorbtn {
                        color: "#6a6da9"
                    }
                    Colorbtn {
                        color: "#494e8f"
                    }
                    Colorbtn {
                        color: "#9b95c9"
                    }
                    Colorbtn {
                        color: "#6f60aa"
                    }
                    Colorbtn {
                        color: "#594c6d"
                    }
                    Colorbtn {
                        color: "#694d9f"
                    }
                    Colorbtn {
                        color: "#6f599c"
                    }
                    Colorbtn {
                        color: "#543044"
                    }
                    Colorbtn {
                        color: "#411445"
                    }
                    Colorbtn {
                        color: "#7c8577"
                    }
                    Colorbtn {
                        color: "#3c3645"
                    }
                }
            }
            Button {

                anchors.horizontalCenter: parent.horizontalCenter
                text: "应用并更改"
            }
        }
    }

    //显示窗口
    Rectangle {

        visible: false
        id: showlist
        width: parent.width - 20
        height: parent.height - 20
        radius: 5
        border.color: "#cccccc"
        anchors.centerIn: parent
        color: "#ffffff"

        ListModel {
            id: listmodel
        }

        Component {
            id: listdelegate

            Rectangle {
                radius: 2

                width: wordlist.width
                height: 25

                Text {
                    id: wordtext
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "微软雅黑"
                    width: 200
                    height: parent.height
                    font.pixelSize: 12
                    text: word
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                }
                Text {
                    visible: false
                    id: wordphonetic
                    text: phonetic
                }
                TextInput {
                    id: transtext
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "微软雅黑"
                    height: parent.height
                    clip: true
                    enabled: false
                    anchors {
                        left: wordtext.right
                        right: parent.right
                    }
                    font.pixelSize: 12
                    text: trans
                }

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true

                    onEntered: {
                        parent.color = "#cccccc"
                    }
                    onExited: {
                        parent.color = "#ffffff"
                    }
                    onClicked: {
                        cur_index = index
                        wordinfo.word = wordtext.text
                        wordinfo.trans = transtext.text
                        wordinfo.phonetic = wordphonetic.text
                    }
                }
            }
        }

        SwipeView {

            anchors.fill: parent
            currentIndex: menu.currentIndex
            interactive: false
            anchors.margins: 3
            clip: true
            //列表模式
            Page {

                ListView {

                    id: wordlist
                    clip: true
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 3
                        rightMargin: 3
                        bottom: parent.bottom
                        top: parent.top
                        topMargin: 40
                    }

                    model: listmodel
                    delegate: listdelegate
                }

                Row {
                    spacing: 15
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.leftMargin: 5
                    anchors.left: parent.left
                    CloseButton {
                        id: close
                        onClicked: {
                            width: 0
                            height: 0
                            showlist.visible = false
                            bookslist.visible = true
                        }
                    }
                    MoreButton {

                        onClicked: {

                            wordinfo.visible = (wordinfo.visible === false) ? true : false
                        }
                    }
                }

                WordModel {
                    id: wordinfo
                    visible: false

                    back.visible: false
                    anchors {
                        top: wordlist.top
                        bottom: wordlist.bottom
                        left: wordlist.left
                        leftMargin: 200
                    }
                }
            }

            //卡片模式
            Page {

                CloseButton {

                    onClicked: {
                        showlist.visible = false
                        bookslist.visible = true
                        timer.stop()
                        player_btn.visible = true
                        play_stop.deful()
                    }
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: card.top
                    anchors.bottomMargin: 10

                    Timer {
                        id: timer
                        interval: 1500
                        running: false
                        repeat: true
                        onTriggered: {

                            slider.value = slider.value + 1
                            player_btn.play()
                        }
                    }
                    Play_Stop_Btn {

                        id: play_stop
                        onPlaying: {
                            player_btn.play()
                            timer.start()
                            player_btn.visible = false
                        }

                        onStoped: {

                            timer.stop()
                            player_btn.visible = true
                        }
                    }
                }

                Rectangle {

                    anchors.centerIn: parent
                    border.color: "#cccccc"
                    width: 500
                    height: 450
                    radius: 5
                    id: card

                    Column {
                        spacing: 5
                        anchors.fill: parent
                        Row {
                            spacing: 10
                            anchors.horizontalCenter: parent.horizontalCenter

                            Text {

                                font.family: "微软雅黑"
                                font.pixelSize: 30
                                font.bold: true
                                color: "#3B3B3B"
                                id: card_title
                                text: ""
                            }
                            PlayBtn {
                                anchors.verticalCenter: card_title.verticalCenter

                                id: player_btn
                            }
                        }
                        Text {

                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "微软雅黑"
                            font.pixelSize: 22
                            color: "#696969"
                            id: card_p
                            text: ""
                        }
                        Text {
                            width: parent.width
                            height: 250
                            wrapMode: Text.WordWrap
                            font.family: "微软雅黑"
                            font.pixelSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "#3B3B3B"
                            id: card_trans
                        }
                    }
                }

                Text {
                    anchors.bottom: slider.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 18
                    font.family: "微软雅黑"
                    color: "#3B3B3B"
                    font.bold: true
                    id: per
                    text: (slider.value + 1) + " / " + (slider.to + 1)
                }
                Slider {
                    id: slider
                    anchors.top: card.bottom
                    anchors.topMargin: -35
                    width: card.width
                    from: 0
                    stepSize: 1
                    to: listmodel.count - 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    onValueChanged: {
                        card_title.text = bookwordlist.getword(value)
                        card_p.text = bookwordlist.getphonetic(value)
                        card_trans.text = bookwordlist.gettrans(value)
                        player_btn.audio = card_title.text
                    }
                }
            }

            //矩块模式
            Page {

                Text {

                    text: "正在开发"
                }
            }

            onCurrentIndexChanged: {
                timer.stop()
                player_btn.visible = true
                play_stop.deful()
                wordinfo.visible = false
            }
        }

        XMenu {
            id: menu
            anchors {
                bottom: parent.bottom
                bottomMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
        }
    }

    function changeinfo(color) {
        bookshow.color = color
    }
}
