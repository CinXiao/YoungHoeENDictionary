import QtQuick 2.9
import QtQuick.Controls 2.5
import"../../BasicComponnet"

Item {

    anchors.fill: parent

id:root



    Row
    {
        id:title
        spacing: 5
        anchors
        {
            top:parent.top
            topMargin:10
            left:parent.left
            leftMargin:10


        }

        Image {
            mipmap: true
            id: ico
            source: "qrc:/ico.png"
            width: 80

            height: 80
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
          font.family: "微软雅黑"
          font.pixelSize:35
            text:"Welcome to"
             font.bold: true
            color: "#2b2b2b"
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
          font.family: "微软雅黑"
          font.pixelSize:35
          font.bold: true
            text:"Learn Home"
            color: "#297BCC"
        }
    }

    Rectangle
    {

        id:tools

        anchors
        {

            top:title.bottom
            bottom:parent.bottom
            bottomMargin:10
            left:parent.left
            right:parent.right

            topMargin:10
            leftMargin:50
            rightMargin:50

        }

        Column
        {
            spacing: 10
            Rectangle
            {
            height: 1
            width: tools.width
            color:"#cccccc"
            }
            Rectangle
            {
            height: 300
            width: tools.width

            Text {

                anchors.fill: parent
                wrapMode: Text.WordWrap
                font.pixelSize: 20
                font.family: "微软雅黑"
                color: "#2b2b2b"
                text: "*在这里可以进行听力、阅读的学习。\n*也可以创建教程，或者使用他人创建的教程。\n*目前创建教程的流程比较繁琐，作者正在开发便捷创建的工具"
            }
            }
            Row
            {
               spacing: 5
              IcoBtn
              {
                  title: "如何创建教程？"
               ico: "qrc:/DicProject/ico/how.png"
                 onClicked: how_to_create.visible=true
              }

            }


        }




    }


    Rectangle
    {
        id:how_to_create
        visible: false
        anchors
    {
     top:parent.top
     topMargin:5
    left:parent.left
    leftMargin:5
    bottom:parent.bottom
    bottomMargin:5
    right:parent.right
    rightMargin:5
    }

        ScrollView
        {
            clip: true
            width: how_to_create.width-20
            height: how_to_create.height-20
            anchors.centerIn: parent

            Column
            {

                spacing: 15
                Text {
                    font.pixelSize: 35
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "如何创建教程"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "1.打开程序位置，找到TechingMaterials文件夹【所有的教程都是基于这个文件夹创建的】"
                }
                Image {

                     source: "qrc:/DicProject/img/step1.png"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "2.打开TechingMaterials文件夹，里面的各个文件夹就是学习页面的菜单了【例：当前创建了一个新教程-我的教程】"
                }
                Image {

                   source: "qrc:/DicProject/img/step2.png"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "3.重启软件就可以在学习页面看见刚刚创建的新教程了"
                }
                Image {

                    source: "../img/step3.png"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "4.打开刚刚创建的【我的教程】文件夹，创建章节"
                }
                Image {

                    source: "../img/step4.png"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "5.就可以在学习页面教程菜单看见刚刚创建的章节了"
                }
                Image {

                     source: "../img/step5.png"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "6.在章节文件夹下就可以创建教程材料了"
                }
                Image {

                    source: "../img/step6.png"
                }
                Text {
                    font.pixelSize: 35
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "教程文件格式说明"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "<audiourl>标签下放入听力URL地址，可以是网络的Url,或者本地URL【或者放入一首歌~~】"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "<text>标签下放入文章"
                }
                Text {
                    width: how_to_create.width-10
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#2b2b2b"
                  font.family: "微软雅黑"
                    text: "<note>标签下是笔记【正在开发】"
                }
            }

        }
        Button
        {
            anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 10

            }

            text:"知道了"

            onClicked: how_to_create.visible=false

        }


    radius:5
    border.color: "#cccccc"

    }





}
