import QtQuick 2.9
import QtQuick.Controls 2.5
import Collect 1.0
import"../javascript/CollectData.js" as DATA
Item {
    anchors.fill: parent
function load()
{
DATA.loading();
}



    clip: true




    CollectCore {
        id: collecter
    }

    id: worditempage
    Rectangle {
        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: 35

        clip: true
        ScrollView {
            anchors.fill: parent
            Flow {
                spacing: 5
                width: worditempage.width
                id: worditemview
                Component.onCompleted: {
                    DATA.parent=worditemview;
                    DATA.datacore=collecter;
                    DATA.loading()
                   // DATA.remove("hi")
                }
            }
        }
    }
}
