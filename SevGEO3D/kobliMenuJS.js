var menuAcik = false;
var broMenuAcik = false;
var childMenuAcik = false;

function getMenu() {
    return menuAcik;
}
function setMenu(deger){
    menuAcik = deger;
}
function myBrosHide(mySelf)
{
    findMyBrosAndExecuteFunc(mySelf,myBroShowingFunc);
}
function myBroShowingFunc(myBro)
{
    myBro.color = myBro.renk;
    myBro.border.width = 0;
    myBro.acilirMenuSelf.visible = false;
}
function myBroShowing(mySelf)
{
    findMyBrosAndExecuteFunc(mySelf,myBroVisible)
}
function myBroVisible(myBro)
{
    if(myBro.acilirMenuSelf.visible)
    {
        broMenuAcik = true;
    }
}

function findMyBrosAndExecuteFunc(mySelf,func)
{
    //find brothers and sisters bas
    for(var ii = 0;ii<mySelf.parent.children.length;ii++)
    {
        if(mySelf.parent.children[ii].objectName === mySelf.objectName)
        {
            if(mySelf.parent.children[ii] != mySelf)
            {
                func(mySelf.parent.children[ii]);
            }
        }
    }
}
