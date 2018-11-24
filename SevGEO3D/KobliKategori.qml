import QtQuick 2.0

import "kategoriJS.js" as JsCode

Rectangle{
    id : myKategori
    color : parent.color
    width: parent.width
    property color kategoriColor: "#d2d2d2"
    property color textColor: "#000000"
    property string kategoriAd: "Kategori"
    property real yukseklik: 0
    property alias bolmeKat: myKategoriBolme
    height: 35 + yukseklik
    Rectangle{
        id : myKategoriBolme
        anchors.top: myKategori.top
        anchors.topMargin: 2
        color : kategoriColor
        x: 4
        width: myKategori.width - 8
        radius: 2
        height: 25
        Text {
            id: myText
            text: qsTr(kategoriAd)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 4
        }
        Image {
            id: myImage
            source: "imgs/minus.png"
            width: 16
            height: 16
            sourceSize.width: 16
            sourceSize.height: 16
            anchors.right: myKategoriBolme.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 2
            antialiasing: true
            smooth: true
            fillMode: Image.PreserveAspectFit
        }
    }
    MouseArea{
        anchors.fill: myKategori
        onClicked: {
            if(JsCode.kategoriKont)
            {
                JsCode.kategoriKont = false;
                myKategori.height = 29;
                myImage.source = "imgs/plus.png";

            }else
            {
                JsCode.kategoriKont = true;
                myKategori.height = 29 + yukseklik;
                myImage.source = "imgs/minus.png";
            }
        }
    }
}
