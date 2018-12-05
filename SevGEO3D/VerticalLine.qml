import QtQuick 2.0

Rectangle
{

    property real genislik: 1
    property real aralik: 1
    property color renk: "#101010"
    height: genislik
    x : aralik
    width: parent.width - 2 * aralik
    color: renk;

}
