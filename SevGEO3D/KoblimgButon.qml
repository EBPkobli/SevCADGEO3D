import QtQuick 2.0

Rectangle{
    id : imgButon
    width: parent.width - 6
    x : 3
    height: 18
    color : parent.color
    property string btnTag: "YOK"
    property string imgYol: ""
    Text {
        id: myText
        text: qsTr(btnTag)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
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
        anchors.leftMargin: 2
        antialiasing: true
        smooth: true
        fillMode: Image.PreserveAspectFit
    }
    MouseArea{
        anchors.fill: imgButon
        hoverEnabled: true
        onEntered: {
            imgButon.color = "#cce4f7";
            imgButon.border.color = "#0000ff";
            imgButon.border.width = 1;
        }
        onExited: {
            imgButon.color = imgButon.parent.color
            imgButon.border.width = 0;
        }
    }
}
