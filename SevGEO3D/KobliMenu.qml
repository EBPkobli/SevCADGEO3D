import QtQuick 2.0

import "kobliMenuJS.js" as JsCode

Rectangle{
    id : kobliMenu
    property string yazi
    property color renk
    property int sizeDuzelt: 0
    width: (yazi.length - 7/*underline için<u>*/) * kobliText.font.pointSize - sizeDuzelt * kobliText.font.pointSize
    height: parent.height
    color : renk
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
        }
    }
    Rectangle{
        id : acilirMenu
        anchors.top: kobliMenu.bottom
        anchors.left: kobliMenu.left
        visible: false
        width: 200
        height: 400
        color: "#000000"
        border.color: "#262626"
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
        }
    }

}
