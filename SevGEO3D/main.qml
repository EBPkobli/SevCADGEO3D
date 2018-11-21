import QtQuick 2.4
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.4

import "glcode.js" as GLCode

Window {
    id : anaEkran
    title: qsTr("SevGEO3D")
    visible: true
    color : "black"

    width: 1280
    height: 720
    minimumWidth: 1280
    minimumHeight: 720

    Rectangle{
        id : dosyaFrame
        width: anaEkran.width
        height: anaEkran.height / (720 / 20)
        color: "#dddddd"
        z:999


        RowLayout{
            width:  dosyaMenu.width + duzenleMenu.width + girisMenu.width + ciktiMenu.width + ayarMenu.width + yardimMenu.width
            height:  dosyaFrame.height
            spacing: 0
            KobliMenu{
                id : dosyaMenu
                yazi : qsTr("<u>D</u>osya")
                renk : "#dddddd"
            }
            KobliMenu{
                id : duzenleMenu
                yazi : qsTr("<u>D</u>üzenle")
                sizeDuzelt: 1
                renk : "#dddddd"
            }
            KobliMenu{
                id : girisMenu
                yazi : qsTr("<u>G</u>iriş")
                renk : "#dddddd"
            }
            KobliMenu{
                id : ciktiMenu
                yazi : qsTr("<u>Ç</u>ıktılar")
                sizeDuzelt: 2
                renk : "#dddddd"
            }
            KobliMenu{
                id : ayarMenu
                yazi : qsTr("<u>A</u>yarlar")
                sizeDuzelt: 1
                renk : "#dddddd"
            }
            KobliMenu{
                id : yardimMenu
                yazi : qsTr("<u>Y</u>ardım")
                renk : "#dddddd"
            }
        }
    }
    Rectangle{
        id : ustFrame
        anchors.top: dosyaFrame.bottom
        width: anaEkran.width
        height: anaEkran.height / (720 / 60 /*60 px*/)
        color: "#bbbbbb"
        YatayRect{
            x: 3-width / 2 + height / 2
            yazi: "Dosya"
        }

    }
    Rectangle{
        id : solFrame
        anchors.top: ustFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width / (1280 / 60)
        height: anaEkran.height / (720 / 400)
        color: "#bbbbbb"

        KobliButon{
         id : twodbtn
         x : 3
         y : 2
         renk: "#bbbbbb"
         imgYol: "imgs/twod.png"
         clickFonks: [GLCode.convertTo]
         args: ["2D"]
         checkableBtn: true
         checked: true
        }

        KobliButon{
         id : threedbtn
         x : 3
         y : 1
         anchors.top : twodbtn.bottom
         renk: "#bbbbbb"
         imgYol: "imgs/threed.png"
         clickFonks: [GLCode.convertTo]
         args: ["3D"]
         checkableBtn: true
         checked: false
        }
    }
    Rectangle{
        id : sagFrame
        anchors.topMargin: 1
        anchors.right: ustFrame.right
        anchors.top: ustFrame.bottom
        width: anaEkran.width / (1280/139)
        height: anaEkran.height / (720/611)
        color: "#bbbbbb"

    }
    Rectangle{
        id : altFrame
        anchors.top: solFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width / (1280 / 1140)
        height: anaEkran.height / (720 / 210 )
        color : "#dddddd"
    }
    Rectangle{
        id : enAltFrame
        anchors.top: altFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width
        height: anaEkran.height / (720 / 27 )
        color : "#bbbbbb"
    }

    Canvas3D {
        id: canvas3d
        anchors.top: ustFrame.bottom
        width: anaEkran.width - (sagFrame.width + solFrame.width) - anaEkran.width / (1280) * 2
        height: anaEkran.height - (dosyaFrame.height + ustFrame.height + altFrame.height + enAltFrame.height) - anaEkran.height / (720) * 3
        anchors.left : solFrame.right
        anchors.margins: 1
        focus: true


        onInitializeGL: {
            GLCode.initializeGL(canvas3d);
        }

        onPaintGL: {
            GLCode.paintGL(canvas3d);
        }

        onResizeGL: {
            GLCode.resizeGL(canvas3d);
        }
    }

}
