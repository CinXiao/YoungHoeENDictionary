import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../../BasicComponnet"




Item {
    anchors.fill: parent
    SwipeView
    {

        id:rootview
        anchors.fill: parent
        clip: true
       interactive: false

        Page
        {


            DropShadow
            {

            anchors.fill:page1
            radius:2
            samples: 4
            source: page1

            }

            Rectangle
            {

              anchors.centerIn: parent
              width: parent.width*0.7
              height:parent.height*0.7
              x:200
              color: "#FAFAFA"
              radius: 5
              id:page1

              Column
              {

                  anchors.centerIn: parent
                  spacing: 30
                   Text {
                       anchors.horizontalCenter: parent.horizontalCenter

                       font.family: "微软雅黑"
                       font.pixelSize: 30
                       text:"Hello,欢迎"
                   }
                  TextEdit
                   {
                       enabled: false
                       anchors.horizontalCenter: parent.horizontalCenter
                       height:250
                       font.family: "微软雅黑"
                       wrapMode: Text.WordWrap
                       clip: true
                       width:page1.width-20
                       text: "1．许可证的授予。\n  .本《协议》授予您此软件所有权利，即您可以随意传播、复制、作为商业用途。\n    ．本《协议》授予您此软件所有图标、照片、标志。\n\n2.其它权利和限制的说明。\n    ．本软件若对您的夫妻生活、家庭、子女、工作、身心健康造成重大伤害，软件作者无任何责任\n    ．若因您本人使用本软件后,对自然、人类、世界和平、银河系的安宁造成重大影响，软件作者无任何责任\n"
                   }


                  Row{
                      anchors.horizontalCenter: parent.horizontalCenter
                      spacing:150
                      Button
                      {
                          text:"退出"
                          onClicked: {
                          rootview.destroy()

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
        Page{}
        Page{}

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
