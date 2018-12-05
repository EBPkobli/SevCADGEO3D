import QtQuick 2.0

import "kobliMenuJS.js" as JsCode

Rectangle{
    id : kobliMenu
    property string yazi
    property color renk
    property int sizeDuzelt: 0
    property alias acilirMenuSelf: acilirMenu
    property var glCodeChangeObj
    width: (yazi.length - 7/*underline için<u>*/) * kobliText.font.pointSize - sizeDuzelt * kobliText.font.pointSize
    height: parent.height
    color : renk
    objectName: "kobliMenu"

    Text {
        id: kobliText
        text: qsTr(yazi)
        color: "#262626"
        anchors.centerIn: parent
    }
    MouseArea{
        anchors.fill : kobliMenu
        hoverEnabled: true
        onEntered: {
            kobliMenu.color = "#cce4f7";
            kobliMenu.border.color = "#bbbbff";
            kobliMenu.border.width = 1;
            JsCode.myBroShowing(kobliMenu);
            if(JsCode.broMenuAcik)
            {
                acilirMenu.visible = true;
                JsCode.setMenu(true);
                JsCode.myBrosHide(kobliMenu);
                JsCode.broMenuAcik = false;
            }
        }
        onExited: {
            if(!JsCode.getMenu()){
                kobliMenu.color = renk;
                kobliMenu.border.width = 0;
            }
        }
        onClicked: {
            acilirMenu.visible = true;
            JsCode.setMenu(true);
            JsCode.myBrosHide(kobliMenu);
        }
    }
    Rectangle{
        id : acilirMenu
        anchors.top: kobliMenu.bottom
        anchors.left: kobliMenu.left

        visible: false
        width: 200
        height: 305
        color: "#f0f0f0"
        border.color: "#606060"
        border.width: 1
        MouseArea{
            anchors.fill: acilirMenu
            hoverEnabled: true

            onEntered: {
                acilirMenu.visible = true;
            }
            onExited: {
                acilirMenu.visible = false;
                kobliMenu.color = renk;
                kobliMenu.border.width = 0;
                JsCode.setMenu(false);
            }

            HorizantalLine{
                z : 3
                id : hLine;
            }

            KoblimgButon{
                id : yeniDosyaBtn
                y : 5
                parentColor: parent.parent.color;
                btnTag: "Yeni..."
                rightText: "Ctrl+N"
                textSagMargin: 5
                imgYol: "imgs/newFile.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : acDosyaBtn
                anchors.top: yeniDosyaBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Aç"
                rightText: "Ctrl+O"
                textSagMargin: 5
                imgYol: "imgs/openFile.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : kaydetDosyaBtn
                anchors.top: acDosyaBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Kaydet"
                rightText: "Ctrl+S"
                textSagMargin: 5
                imgYol: "imgs/saveFile.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }



            KoblimgButon{
                id : farkliKaydetBtn
                anchors.top: kaydetDosyaBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Farklı Kaydet"
                rightText: "Shift+Ctrl+S"
                textSagMargin: 5
                imgYol: ""
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }
            VerticalLine{
                id : vLine1
                anchors.top: farkliKaydetBtn.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }

            KoblimgButon{
                id : tekrarAcBtn
                anchors.top: vLine1.bottom
                anchors.topMargin: 5
                parentColor: parent.parent.color;
                btnTag: "Tekrar Aç"
                rightText: ""
                textSagMargin: 5
                imgYol: ""
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : klasorlerBtn
                anchors.top: tekrarAcBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Klasörler"
                rightText: ""
                textSagMargin: 5
                imgYol: ""
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            VerticalLine{
                id : vLine2
                anchors.top: klasorlerBtn.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }

            KobliMenuBtn{
                z : 2
                id : aktarBtn
                anchors.top: vLine2.bottom
                anchors.topMargin: 5
                parentColor: parent.parent.color;
                btnTag: "Aktar"

                glCode : glCodeChangeObj;
                height: 23
                imgSagMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : gonderBtn
                anchors.top: aktarBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Gönder"
                rightText: ""
                textSagMargin: 5
                imgYol: ""
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            VerticalLine{
                id : vLine3
                anchors.top: gonderBtn.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }

            KoblimgButon{
                id : belgeyiYazdirBtn
                anchors.top: vLine3.bottom
                anchors.topMargin: 5
                parentColor: parent.parent.color;
                btnTag: "Belgeyi yazdır"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/printFile.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : resmiYazdirBtn
                anchors.top: belgeyiYazdirBtn.bottom
                parentColor: parent.parent.color;
                btnTag: "Resmi yazdır"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/printPhoto.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            VerticalLine{
                id : vLine4
                anchors.top: resmiYazdirBtn.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }

            KoblimgButon{
                id : cikisBtn
                anchors.top: vLine4.bottom
                anchors.topMargin: 5
                parentColor: parent.parent.color;
                btnTag: "Çıkış"
                rightText: "Alt+F4"
                textSagMargin: 5
                imgYol: ""
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    Qt.quit();
                }

                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }
        }

        Component.onCompleted: {

        }
    }

}
