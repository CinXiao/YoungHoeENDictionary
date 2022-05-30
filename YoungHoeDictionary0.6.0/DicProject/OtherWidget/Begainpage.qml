import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../../BasicComponnet"
import GetInfo 1.0



Item {
    anchors.fill: parent
    id:root
    SwipeView
    {

        id:rootview
        anchors.fill: parent
        clip: true
       interactive: false

       InfoCore
       {
        id:info

       }
        Page
        {

            MouseArea
            {
            width: 100
            height: 100
            onClicked:
            {

            we.visible=true}

            }


            Rectangle
            {


              anchors.centerIn: parent
              width: parent.width*0.7
              height:parent.height*0.7
              x:200
              color: "#FAFAFA"
              border.color: "#cccccc"
              radius: 5
              id:page1
              Rectangle
              {
                  width: 50
                  height:50
                  visible: false
                  id:we
                    z:2
                    anchors
                    {
                    left:parent.left
                    top:parent.top
                    leftMargin:3
                    topMargin:3


                    }
                    Behavior on width
                    {


                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }

                    }
                    Behavior on height
                    {


                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }

                    }

                    Image {

                        anchors.fill: parent
                        source: "../img/we.jpg"
                        mipmap: true
                    }
                    MouseArea
                    {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                    {

                        parent.width=400
                        parent.height=400



                    }
                    onExited:
                    {
                        parent.width=50
                        parent.height=50


                    }

                    }
              }

              Column
              {

                  anchors.centerIn: parent
                  spacing: 30
                   Text {
                       anchors.horizontalCenter: parent.horizontalCenter

                       font.family: "微软雅黑"
                       font.pixelSize: 30
                       text:"Hello 你好呀"
                   }

                   ScrollView{

                       height:250
                       width:400
                       clip: true
                       Rectangle
                       {
                           height:400
                           width:400
                           TextEdit
                            {
                                anchors.fill: parent
                                enabled: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: "微软雅黑"
                                wrapMode: Text.WordWrap
                                clip: true
                                text: info.getsoftwear()
                            }

                       }

                        }




                  Row{
                      anchors.horizontalCenter: parent.horizontalCenter
                      spacing:150
                      Button
                      {
                       text:"下一步"
                      opacity: 0.0

                      }
                      Button
                      {
                       text:"下一步"
                       onClicked:
                       {
                           rootview.currentIndex=rootview.currentIndex+1
                       }

                      }

                  }

              }







            }

        }
        Page
        {
            Rectangle
            {

              anchors.centerIn: parent
              width: parent.width*0.7
              height:parent.height*0.7
              x:200
              color: "#FAFAFA"
              border.color: "#cccccc"
              radius: 5
              id:page2

              Column
              {

                  anchors.centerIn: parent
                  spacing: 30
                   Text {
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.family: "微软雅黑"
                       font.pixelSize: 30
                       text:"Welcome 欢迎使用"
                   }
                 Rectangle
                   {
                       enabled: false
                       anchors.horizontalCenter: parent.horizontalCenter
                       height:250
                       clip: true
                       width:page1.width-20

                       Column
                       {
                           spacing: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                        Row
                        {
                            Image {

                                id:im1
                                width: 80
                                height: 80
                                source: "../img/f1.png"
                            }
                            Text {
                               anchors.verticalCenter: im1.verticalCenter
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               color:"#6b6b6b"
                                text: "极简界面"
                            }
                        }
                        Row
                        {
                            spacing: 10
                            Image {

                                id:im2
                                width: 80
                                height: 80
                                source: "../img/f2.png"
                            }
                            Text {
                               anchors.verticalCenter: im2.verticalCenter
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               color:"#6b6b6b"
                               text: "灵活扩展"
                            }
                        }
                        Row
                        {
                            spacing: 35
                            Image {

                                id:im3
                                width: 60
                                height: 60
                                source: "../img/f3.png"
                            }
                            Text {
                               anchors.verticalCenter: im3.verticalCenter
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               color:"#6b6b6b"
                                text: "词汇丰富"
                            }
                        }
                       }


                   }


                  Row{
                      anchors.horizontalCenter: parent.horizontalCenter
                      spacing:150

                      Button
                      {
                       text:"上一步"
                       onClicked:
                       {
                           rootview.currentIndex=rootview.currentIndex-1
                       }

                      }
                      Button
                      {
                       text:"下一步"
                       onClicked:
                       {
                           rootview.currentIndex=rootview.currentIndex+1
                       }

                      }

                  }

              }







            }
        }
        Page
        {

            Rectangle
            {

              anchors.centerIn: parent
              width: parent.width*0.7
              height:parent.height*0.7
              x:200
              color: "#FAFAFA"
              border.color: "#cccccc"
              radius: 5
              id:page3

              Column
              {

                  anchors.centerIn: parent
                  spacing: 30
                   Text {
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.family: "微软雅黑"
                       font.pixelSize: 30
                       text:"Go 让我们开始吧"
                   }
                   Rectangle
                   {
                       height:250
                       width:page1.width-20
                  Row
                   {
                       enabled: false
                       anchors.horizontalCenter: parent.horizontalCenter
                       spacing: 5
                       Image {
                           width: 100
                           height: 100
                           source: "../img/cpp.png"
                       }
                       Image {
                           width: 100
                           height: 100
                           source: "../img/qt.png"
                       }
                       Image {
                           width: 100
                           height: 100
                           source: "../img/qml.png"
                       }

                   }

                   }


                  Row{
                      anchors.horizontalCenter: parent.horizontalCenter
                      spacing:150

                      Button
                      {
                       text:"上一步"
                       onClicked:
                       {
                           rootview.currentIndex=rootview.currentIndex-1
                       }

                      }
                      Button
                      {
                       text:"确认"
                       onClicked:
                       {
                           root.visible=false
                       }

                      }

                  }

              }







            }
        }

    }
}
/*
     Rectangle{

         width:800
         height:600

    Rectangle
    {

        anchors.verticalCenter: parent.verticalCenter
        width: 10000
        height:500

         id:root
         color: "#E3E3E3"


         NumberAnimation
         {
         id:move
         target: root
         properties: "x"
         to:root.x-800
         duration: 500
         easing.type: "OutQuart"
         }

         NumberAnimation
         {
         id:move2
         target: root
         properties: "x"
         to:root.x+800
         duration: 500
         easing.type: "OutQuart"
         }












         Rectangle
         {
             anchors.verticalCenter: parent.verticalCenter
             width: 400
             height:400
             x:1000
             color: "#ffffff"
             radius: 5
             id:page2


             Column
             {


                 width:390
                 height:390

                 anchors.centerIn: parent
                  spacing: 30



             Text {
                 anchors.horizontalCenter: parent.horizontalCenter

                 font.family: "微软雅黑"
                 font.pixelSize: 30
                 text:"Welcome,初次见面"
             }

             Column
             {
                  anchors.horizontalCenter: parent.horizontalCenter
                 spacing: 70
                   Rectangle{

                       width: 200
                       radius: 5
                       height: 40
                       color: "#3580BB"

                       Row
                       {
                           RadioButton
                           {

                           }
                           Text {
                               color:"#ffffff"
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               text:"登录"
                           }
                       }

                   }

                   Rectangle{

                       width: 200
                       radius: 5
                       height: 40
                       color: "#3580BB"

                       Row
                       {
                           RadioButton
                           {
                           }
                           Text {
                               color:"#ffffff"
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               text:"注册"
                           }
                       }

                   }
                   Rectangle{

                       width: 200
                       radius: 5
                       height: 40
                       color: "#3580BB"

                       Row
                       {
                           RadioButton
                           {
                           }
                           Text {
                               color:"#ffffff"
                               font.family: "微软雅黑"
                               font.pixelSize: 30
                               text:"试用"
                           }
                       }

                   }
             }
                 Row{
                      anchors.horizontalCenter: parent.horizontalCenter
                     spacing:150
                     XButton
                     {
                         text:"后退"
                         onClicked: {move2.start()}
                     }
                     XButton
                     {
                      text:"下一步"
                      onClicked:
                      {
                          move.start()

                      }
                     }

                 }


               }


          }






         }


}

    }*/
