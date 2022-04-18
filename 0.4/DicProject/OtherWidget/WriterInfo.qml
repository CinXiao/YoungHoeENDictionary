import QtQuick 2.9
import QtGraphicalEffects 1.15
Item {
    width: 250
    height:150



    Rectangle
    {
     id:root
     radius:5
     width: parent.width
     height:parent.height
     color:"#ffffff"
     Text
     {
      id:title
      font.family: "微软雅黑"
      font.pixelSize: 18
      text:"关于作者"
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.margins: 5
     }





     ListView
     {

         anchors.top: title.bottom
         anchors.horizontalCenter: parent.horizontalCenter
          width: parent.width-10
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 5
         model:ListModel
         {
           ListElement{info:"邮箱地址:";t:"2256530727@qq.com"}
           ListElement{info:"GitHub:";t:"暂时未开源"}

         }
         delegate:Component
         {
             id:i
             Text {

                 font.family: "微软雅黑"
                 font.pixelSize: 14
                 text:info+"  "+t
             }

         }








    }


    }

}
