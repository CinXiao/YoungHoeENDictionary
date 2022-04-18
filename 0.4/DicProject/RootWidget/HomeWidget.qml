import QtQuick 2.9
import Searchword 1.0
import "../OtherWidget"
import "../../BasicComponnet"
Item
{

    //搜索核心算法模块
    SearchCore
    {
        id:finder//查找er (^~^)
    }



    anchors.fill: parent
    /**
    ***
    ***输入框，当文字发生改变时，调用C++搜索单词，返回到Model List
    ***
    **/
    Rectangle
    {

        id:input_background
        width: parent.width-50
        height:100
        radius:5
        color:"#EDEDED"
        TextInput
        {

            selectByMouse: true
            height:35
            id:input
            font.family: "微软雅黑"
            font.pixelSize: 20

             anchors
            {
            fill:parent
            margins:10
            }
             onTextChanged:
             {

               finder.search(input.text,0,"word")
               console.log(finder.getcount())

                list_background.height=(input.length!=0)?finder.getcount()*30:0
                input_background.height=(input.length!=0)?40:100
                defaultmodel.visible=(input.length!=0)?false:true
                wordmodel.visible=(input.length!=0)?true:false
             }
        }
        anchors
        {
            horizontalCenter:parent.horizontalCenter
        }

        Behavior on height
        {
         NumberAnimation
         {
            duration: 150
         }

        }

    }

    /**
    ***查找按钮
    **/
    Button
    {
        id:find_btn
        text:"查询"
        width:50
        anchors
        {
            top:input_background.bottom
            right:input_background.right
            topMargin:-(height+5)
            rightMargin:5
        }
        onClicked:
        {
        list_background.height=0
        }

    }


   /**
   ***显示列表
   ***Model从C++获取
   ***
   **/
    Rectangle
    {
     id:list_background
     width:input_background.width
     height:0
     clip: true
     z:1
     radius:5
     color:"#EDEDED"
     anchors
     {
     top:input_background.bottom
     topMargin:5
     left:input_background.left
     }


   ListModel
   {
       id:m
     ListElement{w:"A";e:"n.测试"}
     ListElement{w:"B";e:"n.测试"}
     ListElement{w:"C";e:"n.测试"}
     ListElement{w:"D";e:"n.测试"}
     ListElement{w:"E";e:"n.测试"}
     ListElement{w:"F";e:"n.测试"}
     ListElement{w:"F";e:"n.测试"}
     ListElement{w:"F";e:"n.测试"}
   }


   Component
   {
    id:d
    Rectangle
    {

        width:list_background.width
        color:"#EDEDED"
        height:30
        radius:5
       Text {
           id:word_text
           font.family: "微软雅黑"
           color:"#000000"
           text:finder.search(input.text,index,"word")
           anchors
           {
                left:parent.left
                leftMargin:20
           }
       }

       MouseArea
       {

        hoverEnabled: true
        anchors.fill: parent
        onEntered:
        {
            parent.color="#cccccc"

        }
        onExited:
        {
            parent.color="#EDEDED"

        }
        onClicked:
        {
           input.text=word_text.text
           list_background.height=0
           // console.log(input.text.toString())

        }

       }



    }

   }


     ListView
     {
      anchors.fill: parent
      model: m
      delegate: d

      interactive: false
     }
    }


    /**
    ***显示
    ***默认显示和单词查询显示
    ***
    **/
    Rectangle
    {
        radius:5
        color:"#EDEDED"
        width: input_background.width
        anchors
        {
        top:input_background.bottom
        left:input_background.left
        topMargin:5
        bottom:parent.bottom
        bottomMargin:5
        }

        //默认显示
       Rectangle
        {
            anchors.fill: parent
            id:defaultmodel
            visible: true
           // color:"#EDEDED"
            clip:true
            NewsWidget
            {
                anchors
                {
                    horizontalCenter:parent.horizontalCenter
                    bottom:parent.bottom
                    bottomMargin:20
                }
            }
        }

        //单词查询显示
       WordModel
        {
            anchors.fill: parent
            id:wordmodel
            visible: false

        }


    }




}
