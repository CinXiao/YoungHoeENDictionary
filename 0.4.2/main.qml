import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.9
import GetInfo 1.0
import "DicProject"
import "DicProject/OtherWidget"

Window {



    InfoCore
    {
     id:softwearinfo
    }


    width: 800
    height: 600
    visible: true
    title:"DIC词典"


    Component.onCompleted:
    {

         if(softwearinfo.getisfrist())
         {
            fristview.visible=true
         }else
         {
         fristview.visible=false
         }

    }
    MainWindow
    {

    }


    Begainpage
    {
        visible: false
     id:fristview
    }







    }

