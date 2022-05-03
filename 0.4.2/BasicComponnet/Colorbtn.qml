import QtQuick 2.9

Rectangle
{
 width: 20
 height:20
 radius:20
 color:"#c00142"
id:root
signal click
 MouseArea{

 anchors.fill: parent
 hoverEnabled:true
 onEntered:
 {
        root.border.color="#000000"

 }
 onExited:
 {
        root.border.color="#ffffff"

 }
 onClicked:
 {
     root.click()

 }
 }

}
