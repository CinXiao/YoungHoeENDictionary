import QtQuick 2.0
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.5
Item {

    width: 300
    height:150

    DropShadow
    {
     anchors.fill: view;
     color:"#cccccc"
     samples: 20
     radius:11
     source:view
     horizontalOffset: 2
    verticalOffset: 2
    }

    Rectangle
    {
        id:view

        radius:5
        width: parent.width
        height:parent.height

        SwipeView
        {
            id:sview
            width: 250
            height:parent.height
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter

            Page{DailyWord{}}

            Page{WriterInfo{}}
        }


        PageIndicator
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        count:sview.count
        currentIndex: sview.currentIndex
        }


    }


}
