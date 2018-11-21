import QtQuick 2.0

Rectangle{
    property string yazi
    width:  parent.height
    height: 25
    color: "#d2d2d2"
    y: parent.height/2 - height / 2
    Text {
        id: kobliText
        text: qsTr(yazi)
        anchors.centerIn: parent
    }

    transform: Rotation {origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: -90 }
}
