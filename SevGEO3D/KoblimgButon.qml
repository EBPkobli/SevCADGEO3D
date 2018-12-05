import QtQuick 2.0

Rectangle{
    id : imgButon
    width: parent.width - 6
    x : 3
    height: 18
    color : (parent.color === undefined) ? parentColor : parent.color;
    property string btnTag: "YOK"
    property string rightText: ""
    property string imgYol: ""
    property int imgSolMargin: 0
    property int textSolMargin: 0
    property int textSagMargin: 0
    property alias btnMouseArea: myMouseArea
    property color parentColor : parent.color;
    Text {
        id: myLeftText
        text: qsTr(btnTag)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20 + textSolMargin
    }

    Text {
        id: myRightText
        text: qsTr(rightText)
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5 + textSagMargin
    }
    Image {
        id: myImage
        source: imgYol
        width: 16
        height: 16
        sourceSize.width: 16
        sourceSize.height: 16
        anchors.left: imgButon.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 2 + imgSolMargin
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
        }
        onExited: {
            imgButon.color = imgButon.parentColor
            imgButon.border.width = 0;
        }
    }
}
