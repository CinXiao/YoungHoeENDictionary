import QtQuick 2.9
import "../../BasicComponnet"

Rectangle
{

id:root
radius:5
width:parent.width
height:300
color:"#EDEDED"



Column
{
    anchors.fill: parent
    anchors.margins: 5
    spacing: 20
    Text {
        text:"音标(KK)"
        font.family: "微软雅黑"
        font.pixelSize: 15
        anchors.horizontalCenter: parent.horizontalCenter

    }
    Row
    {
        spacing:3
        Text {
              anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize:12
            text:"长元音"
        }
        PhoneticButton
        {
            text: "iː"
            audio:"../DicProject/sound/s1.mp3"
        }
        PhoneticButton
        {
            text: "ɜː"
        }
        PhoneticButton
        {
            text: "ɑː"
        }
        PhoneticButton
        {
            text: "ɔː"
        }
        PhoneticButton
        {
            text: "uː"
        }

    }
    Row
    {spacing:3
        Text {
              anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize:12
            text:"短元音"
        }
        PhoneticButton
        {
            text: "ɪ"
        }
        PhoneticButton
        {
            text: "e"
        }
        PhoneticButton
        {
            text: "æ"
        }
        PhoneticButton
        {
            text: "ə"
        }
        PhoneticButton
        {
            text: "ʌ"
        }
        PhoneticButton
        {
            text: "ɒ"
        }
        PhoneticButton
        {
            text: "ʊ"
        }

    }
    Row
    {spacing:3
        Text {
            anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize:12
            text:"双元音"
        }
        PhoneticButton
        {
            text: "eɪ"
        }

        PhoneticButton
        {
            text: "aɪ"
        }
        PhoneticButton
        {
            text: "ɔɪ"
        }
        PhoneticButton
        {
            text: "əʊ"
        }
        PhoneticButton
        {
            text: "aʊ"
        }
        PhoneticButton
        {
            text: "ɪə"
        }
        PhoneticButton
        {
            text: "eə"
        }
        PhoneticButton
        {
            text: "ʊə"
        }

    }
    Row
    {spacing:3
        Text {
              anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize:12
            text:"清辅音"
        }
        PhoneticButton
        {
            text: "p"
        }
        PhoneticButton
        {
            text: "t"
        }        PhoneticButton
        {
            text: "k"
        }        PhoneticButton
        {
            text: "f"
        }        PhoneticButton
        {
            text: "θ"
        }  PhoneticButton
        {
            text: "s"
        }
        PhoneticButton
        {
                  text: "ʃ"
         }
        PhoneticButton
         {
                  text: "h"
          }
        PhoneticButton
         {
                  text: "tʃ"
          }
        PhoneticButton
         {
                  text: "ts"
          }
        PhoneticButton
         {
                  text: "tr"
          }


    }
    Row
    {spacing:3
        Text {
              anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize:12
            text:"浊辅音"
        }



        PhoneticButton
         {
                  text: "b"
          }
        PhoneticButton
         {
                  text: "d"
          }
        PhoneticButton
         {
                  text: "ɡ"
          }        PhoneticButton
        {
                 text: "v"
         }
        PhoneticButton
         {
                  text: "ð"
          }        PhoneticButton
        {
                 text: "z"
         }
        PhoneticButton
         {
                  text: "ʒ"
          }
        PhoneticButton
         {
                  text: "r"
          }
        PhoneticButton
         {
                  text: "dʒ"
          }
        PhoneticButton
         {
                  text: "dz"
          }
        PhoneticButton
         {
                  text: "dr"
          }
        PhoneticButton
         {
                  text: "dz"
          }
        PhoneticButton
         {
                  text: "m"
          }
        PhoneticButton
         {
                  text: "n"
          }
        PhoneticButton
         {
                  text: "ŋ"
          }
        PhoneticButton
         {
                  text: "l"
          }
        PhoneticButton
         {
                  text: "j"
          }
        PhoneticButton
         {
                  text: "w"
          }}


        }



}
