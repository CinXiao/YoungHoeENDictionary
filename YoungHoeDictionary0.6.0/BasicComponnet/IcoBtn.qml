import QtQuick 2.9

   Rectangle
{
    id:root


    property alias title: m_text.text
    property alias ico: img.source
     property alias text: img.source
    signal clicked()

border.color: "#cccccc"
    radius:5
    width: 250
    height:80




    Image {
        anchors
        {
          left:parent.left
          verticalCenter:parent.verticalCenter
          leftMargin:5
        }

mipmap: true

        id: img
        source: "qrc:/ico.png"
        width:50
        height: 50
    }


        Rectangle
        {
            width:parent.width-70
            height: parent.height-5
        anchors{
            verticalCenter: img.verticalCenter
                left:img.right
                leftMargin: 5

            }
        Text {
            anchors.centerIn: parent
            id:m_text
            font.family: "微软雅黑"
            font.pixelSize: 25
            text:"如何创建教程?"
            color:"#2b2b2b"
            Behavior on color
            {
                ColorAnimation {
                    duration: 200
                }

            }
        }



        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onClicked:
            {

              root.clicked()
            }
            onPressed:
            {

            }
            onExited:
            {
                 m_text.color="#2b2b2b"
                root.border.color= "#cccccc"
            }
            onEntered:
            {

                 m_text.color="#297BCC"
                 root.border.color= "#297BCC"
            }


        }
        Behavior on border.color
        {

            ColorAnimation {
                duration: 200
            }

        }







}


