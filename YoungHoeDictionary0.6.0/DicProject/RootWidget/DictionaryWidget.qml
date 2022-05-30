import QtQuick 2.9
import QtGraphicalEffects 1.15
import WordBooks 1.0
import QtQuick.Controls 2.5
import QtMultimedia 5.9
import "../OtherWidget"
import "../../BasicComponnet"

Rectangle {

    property string filepath: ""
    property string bookname: ""
    property string writename: ""
    property string bookcolor: ""
    property int word_count: 0
    property int cur_index: 0
    property string bookpath:""
    property int count: 0
    property int now_count: 0

    Timer
    {
    id:creater
    interval: 30
    repeat: true
    onTriggered:
    {
        if(now_count<count)
        {

            var _word=bookwordlist.getword(now_count);
            var _trans=bookwordlist.gettrans(now_count);
            listmodel.append({
                                 "word": _word,
                                 "trans":_trans,
                                 "phonetic": bookwordlist.getphonetic(now_count)
                             })

            now_count++;
        }else
        {
         console.log(now_count+"\\"+count);
         creater.running=false
         now_count=0;
         count=0;

        }

    }


   running: false

    }

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
                loadingbook()
            }
        }
    }

    function loadingbook() {
        word_count = bookscore.getbookcount()
        for (var i = 0; i < word_count; ++i) {
            var temp = Qt.createComponent("../OtherWidget/DicBook.qml")
            if (temp.status === Component.Ready) {
                var item = temp.createObject(bookslist, {
                                                 "color": bookscore.getbookinfo(
                                                              i, "color"),
                                                 "path": bookscore.getbookinfo(
                                                             i, "path"),
                                                 "name": bookscore.getbookinfo(
                                                             i, "name"),
                                                 "writer": bookscore.getbookinfo(
                                                               i, "writer")
                                             })

                item.openbook.connect(openwordlistview)
                item.insbook.connect(insbookinfo)
            }


        }
    }

    function insbookinfo(path, name, write, color) {

        bookname = name
        writename = write
        bookcolor = color
        filepath = path
        setview.visible = true
    }



    function openwordlistview(path) {


        bookpath=path;
        listmodel.clear()
        showlist.visible = true
        bookslist.visible = false


        bookwordlist.openbook(bookpath)
        count=bookwordlist.count()


        wordinfo.word = bookwordlist.getword(0)
        wordinfo.trans = bookwordlist.gettrans(0)
        wordinfo.phonetic = bookwordlist.getphonetic(0)
        card_title.text = bookwordlist.getword(0)
        card_p.text = bookwordlist.getphonetic(0)
        card_trans.text = bookwordlist.gettrans(0)
        card_title.text = bookwordlist.getword(0)
        player_btn.audio = card_title.text

        creater.running=true;


        //卡片模式界面初始化
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
            Image {

                id: _image
                anchors.fill: parent
                opacity: 0.2
                source: "../img/bookback.jpg"
            }

            clip: true
            id: bookshow
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 30
            width: 150
            height: 200
            radius: 5
            color: bookcolor
            Text {
                id: book_name
                anchors {
                    top: parent.top
                    topMargin: 10
                    horizontalCenter: parent.horizontalCenter
                }
                font.pixelSize: 15
                color: "#ffffff"
                font.family: "微软雅黑"
                text: booknameinput.text
            }

            Text {
                id: write_name
                anchors {
                    top: book_name.bottom
                    topMargin: 5
                    horizontalCenter: book_name.horizontalCenter
                }
                color: "#ffffff"
                font.pixelSize: 12
                font.family: "微软雅黑"
                text: writenameinput.text
            }
        }

        Column {

            spacing: 5
            anchors.fill: parent
            CloseButton {
                onClicked: {
                    now_count=0;
                     creater.running=false;
                    setview.visible = false
                            }
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
                text: bookname
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
                text: writename
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

                height: 180
                width: 250
                anchors.horizontalCenter: parent.horizontalCenter
                Flow {
                    spacing: 1
                    anchors.fill: parent
                    Colorbtn {
                        color: "#f7acbc"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#ef5b9c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#f15b6c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#f391a9"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#bd6758"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#d71345"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#d93a49"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#bb505d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#973c3f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#aa363d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#f3715c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#7a1723"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#8e453f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#733a31"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#f15a22"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#b4532a"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#b7704f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#c99979"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#f58220"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#ae6642"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#69541b"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#df9464"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#6d5826"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#dec674"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#596032"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#525f42"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#2e3a1f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#4d4f36"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#b2d235"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#5c7a29"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#7fb80e"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#6d8346"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#78a355"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#74905d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#1d953f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#77ac98"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#007d65"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#45b97c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#007947"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#375830"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#65c294"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#00ae9d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#508a88"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#50b7c1"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#00a6ac"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#78cdd1"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#008792"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#009ad6"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#145b7d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#7bbfea"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#228fbd"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#2468a2"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#2570a1"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#1b315e"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#003a6c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#102b6a"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#46485f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#181d4b"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#1a2933"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#6a6da9"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#494e8f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#9b95c9"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#6f60aa"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#594c6d"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#694d9f"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#6f599c"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#543044"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#411445"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#7c8577"
                        onClick: {
                            bookcolor = color
                        }
                    }
                    Colorbtn {
                        color: "#3c3645"
                        onClick: {
                            bookcolor = color
                        }
                    }
                }
            }

            Rectangle {

                id: infomessage
                opacity: 0.0
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#cccccc"
                radius: 5
                width: 300
                height: 35
                Row {
                    spacing: 10
                    anchors.centerIn: parent
                    Image {
                        mipmap: true

                        width: 25
                        height: 25
                        source: "../ico/ok.png"
                    }
                    Text {

                        font.pixelSize: 15
                        font.family: "微软雅黑"
                        id: info
                        text: "   "
                    }
                }

                NumberAnimation {
                    id: showinfo
                    target: infomessage
                    property: "opacity"
                    to: 1.0
                    duration: 1000
                    onStopped: {
                        hideinfo.start()
                    }
                }
                //动画2
                NumberAnimation {
                    id: hideinfo
                    target: infomessage
                    property: "opacity"
                    to: 0.0
                    duration: 1500
                }
            }

            Button {

                id: accpect
                anchors.horizontalCenter: parent.horizontalCenter
                text: "应用并更改"
                onClicked: {
                    info.text = bookwordlist.insbookinfo(filepath,
                                                         booknameinput.text,
                                                         writenameinput.text,
                                                         bookcolor)
                    showinfo.start()
                    //infomessage.opacity=0.0;
                }
            }
        }
    }

    //显示窗口
    Rectangle {

        CloseButton {

            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            z:2
            onClicked: {
                showlist.visible = false
                bookslist.visible = true
                timer.stop()
                player_btn.visible = true
                play_stop.deful()
                count=0;
                now_count=0;
                creater.running=false
            }
        }

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
                    onDoubleClicked:
                    {
                        wordinfo.visible=(wordinfo.visible?false:true)

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

                ScrollView {
                    id: wordlist
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 3
                        rightMargin: 3
                        bottom: parent.bottom
                        top: parent.top
                        topMargin: 40
                    }

                    ListView {

                        clip: true
                        anchors.fill: parent
                        model: listmodel
                        delegate: listdelegate
                    }
                }


                    MoreButton {

                       anchors.verticalCenter: parent.verticalCenter
                        x:160
                        z:2
                        onClicked: {

                            wordinfo.visible = (wordinfo.visible === false) ? true : false
                        }
                    }


                WordModel {
                    id: wordinfo
                    visible: false

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

                            if (slider.value == listmodel.count - 1) {
                                slider.value = 0
                            }
                            slider.value = slider.value + 1
                            player_btn.play()
                        }
                    }

                    ShowBtn {

                        onShow: {
                            if (i) {
                                card_trans.visible = true
                            } else {

                                card_trans.visible = false
                            }
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
                    SoundBtn {
                        onOpen: {
                            if (i) {
                                player_btn.player.volume = 1
                            } else {
                                player_btn.player.volume = 0
                            }
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
                            width: parent.width - 60
                            height: 250
                            wrapMode: Text.WordWrap
                            font.family: "微软雅黑"
                            font.pixelSize: 18
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            color: "#3B3B3B"
                            id: card_trans
                        }
                    }
                }

                Button {
                    width: 25
                    height: 50
                    text: ">"
                    anchors.right: card.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: card.verticalCenter
                    onClicked: slider.value = slider.value + 1
                }
                Button {
                    width: 25
                    height: 50
                    text: "<"
                    anchors.left: card.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: card.verticalCenter
                    onClicked: slider.value = slider.value - 1
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
