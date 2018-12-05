import QtQuick 2.0
import "kobliMenuJS.js" as JsCode
Rectangle{
    id : imgButon
    width: parent.width - 6
    x : 3
    height: 18
    color : (parent.color === undefined) ? parentColor : parent.color;
    property string btnTag: "YOK"
    property int textSolMargin: 0
    property int imgSagMargin: 0
    property alias btnMouseArea: myMouseArea
    property color parentColor : parent.color;
    property var glCode
    Text {
        id: myLeftText
        text: qsTr(btnTag)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20 + textSolMargin
    }
    Image {
        id: myImage
        source: "imgs/sagMenu.png"
        width: 16
        height: 16
        sourceSize.width: 16
        sourceSize.height: 16
        anchors.right: imgButon.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 2 + imgSagMargin
        antialiasing: true
        smooth: true
        fillMode: Image.PreserveAspectFit
    }
    MouseArea{
        id : myMouseArea
        anchors.fill: imgButon
        hoverEnabled: true
        onEntered: {
            imgButon.color = "#cce4f7";
            imgButon.border.color = "#0000ff";
            imgButon.border.width = 1;
            sagMenu.visible = true;
        }
        onExited: {
            if(JsCode.childMenuAcik) return;
            imgButon.color = imgButon.parentColor
            imgButon.border.width = 0;
            sagMenu.visible = false;
        }
        Rectangle{
            id : sagMenu
            width: 150;
            height: 215;
            anchors.left: myMouseArea.right;
            anchors.leftMargin: -1;
            anchors.top: myMouseArea.top;
            anchors.topMargin: -5;
            border.width: 1
            color: "#f0f0f0"
            border.color: "#606060"
            visible: false;
            MouseArea{
                id : sagMenuMouseArea
                anchors.fill: sagMenu
                hoverEnabled: true
                onEntered: {
                    JsCode.childMenuAcik = true;
                }
                onExited: {
                    JsCode.childMenuAcik = false;
                }
            }

            HorizantalLine{
                z : 3
                id : hLine;
            }
            KoblimgButon{
                id : mesh1
                y : 5
                parentColor: parent.color;
                btnTag: "Küp"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    glCode("kup");
                }

                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : mesh2
                anchors.top: mesh1.bottom
                parentColor: parent.color;
                btnTag: "Torus"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    glCode("torus");
                }

                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : mesh3
                anchors.top: mesh2.bottom
                parentColor: parent.color;
                btnTag: "Dodeca"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    glCode("dodeca");
                }
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : mesh4
                anchors.top: mesh3.bottom
                parentColor: parent.color;
                btnTag: "Küre"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    glCode("circle");
                }
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            VerticalLine{
                id : vLine1
                anchors.top: mesh4.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }

            KoblimgButon{
                id : mesh5
                anchors.top: vLine1.bottom
                anchors.topMargin: 5
                parentColor: parent.color;
                btnTag: "Mesh Style"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    //glCode("cone");
                }
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }

            KoblimgButon{
                id : mesh6
                anchors.top: mesh5.bottom
                parentColor: parent.color;
                btnTag: "Mesh Style"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    //glCode("dodeca");
                }
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }
            VerticalLine{
                id : vLine2
                anchors.top: mesh6.bottom
                anchors.topMargin: 5
                x : hLine.x
                width: parent.width - hLine.x;
                renk: "#a0a0a0";
            }
            KoblimgButon{
                id : mesh7
                anchors.top: vLine2.bottom
                anchors.topMargin: 5
                parentColor: parent.color;
                btnTag: "Mesh Style"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onClicked: {
                    //glCode("parametric");
                }
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }
            KoblimgButon{
                id : mesh8
                anchors.top: mesh7.bottom
                parentColor: parent.color;
                btnTag: "Mesh Style"
                rightText: ""
                textSagMargin: 5
                imgYol: "imgs/threed.png"
                height: 23
                imgSolMargin: 5
                textSolMargin: 20
                btnMouseArea.onEntered: {
                }
                btnMouseArea.onExited: {
                }
            }
        }
    }
}
