import QtQuick 2.9
import"../../BasicComponnet"

Item {

    anchors.fill: parent





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
                text: "*在这里你可以使用自带的教程进行听力、阅读的学习。\n*你也可以自己创建属于你自己的教程，也可以使用其他人创建的教程。\n*虽然目前创建教程的流程有点繁琐，需要去手动操作文件，但是作者正在开发使创建流程变得便捷和简单的工具"
            }
            }
            Row
            {
               spacing: 5
              IcoBtn
              {
                  title: "如何创建教程？"
               ico: "qrc:/DicProject/ico/how.png"
              }
              IcoBtn
              {
                  title: "如何导入教程？"
               ico: "qrc:/DicProject/ico/how.png"
              }
            }


        }




    }







}
