import QtQuick 2.0

Rectangle{
    id : kobliBtn
    objectName: "myBtn"
    width: parent.width / 1.1
    height: 45
    property string imgYol
    property color renk
    property var clickFonks
    property var args
    property bool checkableBtn: false
    property bool checked: false
    property int checkGroup : 0
    property int rBuyukluk: 30
    property var myFriend:undefined
    property bool myEnable: true
    color : renk
    Image {
        width: rBuyukluk
        height: rBuyukluk
        sourceSize.width: rBuyukluk
        sourceSize.height: rBuyukluk
        anchors.centerIn: parent
        antialiasing: true
        id: threeD
        smooth: true
        fillMode: Image.PreserveAspectFit
        source: imgYol
    }
    MouseArea{
        anchors.fill : kobliBtn
        hoverEnabled: true
        onEntered: {
            if(myEnable){
                kobliBtn.color = "#cce4f7";
                kobliBtn.border.color = "#0000ff";
                kobliBtn.border.width = 1;
                if(myFriend != undefined)
                {
                    myFriend.color = "#cce4f7";
                    myFriend.border.color = "#0000ff";
                    myFriend.border.width = 1;
                }
            }
        }
        onExited: {
            if(!checkableBtn){
                kobliBtn.color = renk;
                kobliBtn.border.width = 0;
                if(myFriend != undefined)
                {
                    myFriend.color = renk;
                    myFriend.border.width = 0;
                }
            }else
            {
                if(!checked)
                {
                    kobliBtn.color = renk;
                    kobliBtn.border.width = 0;
                    if(myFriend != undefined)
                    {
                        myFriend.color = renk;
                        myFriend.border.width = 0;
                    }
                }
            }
        }
        onClicked: {
            if(myEnable){
                clickFonks[0](args[0]);
                clickFonks[1](args[1]);
                if(checkableBtn)
                {
                    //find brothers and sisters bas
                    for(var ii = 0;ii<kobliBtn.parent.children.length;ii++)
                    {
                        if(kobliBtn.parent.children[ii].objectName === "myBtn")
                        {
                            if(kobliBtn.parent.children[ii] != kobliBtn)
                            {
                                if(kobliBtn.parent.children[ii].checkGroup == kobliBtn.checkGroup){
                                    kobliBtn.parent.children[ii].checked = false;
                                    kobliBtn.parent.children[ii].color = kobliBtn.parent.children[ii].renk;
                                    kobliBtn.parent.children[ii].border.width = 0;
                                }

                            }
                        }
                    }
                    kobliBtn.checked = true;
                }
            }
        }
    }
    Component.onCompleted: {
        if(checkableBtn)
        {
            if(checked)
            {
                kobliBtn.color = "#cce4f7";
                kobliBtn.border.color = "#0000ff";
                kobliBtn.border.width = 1;
                if(myFriend != undefined)
                {
                    myFriend.color = "#cce4f7";
                    myFriend.border.color = "#0000ff";
                    myFriend.border.width = 1;
                }
            }
        }
    }

}
