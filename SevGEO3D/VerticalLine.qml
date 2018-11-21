import QtQuick 2.0

Rectangle
{

    property real genislik: 1
    property real aralik: 1
    height: genislik
    x : aralik
    width: parent.width - 2 * aralik
    color: "#101010"

}
