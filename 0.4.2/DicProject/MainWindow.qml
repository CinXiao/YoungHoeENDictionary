import QtQuick 2.0

Item {
    anchors.fill: parent




Rectangle
{
    color:"#F7F7F7"
    anchors.fill: parent


  Menu
  {
        id:menu
        height1:parent.height
        anchors
        {
        left:parent.left
        top:parent.top
        bottom:parent.bottom
        }


   }
  MainWeidget
  {
      courrentindex: menu.current
      id:weidget
      anchors
      {
       left:menu.right
       leftMargin:5
       top:parent.top
       bottom:parent.bottom
       right:parent.right
      }
  }



}
}
