import QtQuick 2.4
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.4

import "glcode.js" as GLCode

Window {
    id : anaEkran
    title: qsTr("SevGEO3D")
    visible: true
    color : "black"

    width: 1280
    height: 720
    minimumWidth: 1280
    minimumHeight: 720

    Rectangle{
        id : dosyaFrame
        width: anaEkran.width
        height: anaEkran.height / (720 / 20)
        color: "#f5f6f7"
        z:999


        RowLayout{
            width:  dosyaMenu.width + duzenleMenu.width + girisMenu.width + ciktiMenu.width + ayarMenu.width + yardimMenu.width
            height:  dosyaFrame.height
            spacing: 0
            KobliMenu{
                id : dosyaMenu
                yazi : qsTr("<u>D</u>osya")
                renk : "#f5f6f7"
                glCodeChangeObj : GLCode.changeActiveOBJ;
            }
            KobliMenu{
                id : duzenleMenu
                yazi : qsTr("<u>D</u>üzenle")
                sizeDuzelt: 1
                renk : "#f5f6f7"
            }
            KobliMenu{
                id : girisMenu
                yazi : qsTr("<u>G</u>iriş")
                renk : "#f5f6f7"
            }
            KobliMenu{
                id : ciktiMenu
                yazi : qsTr("<u>Ç</u>ıktılar")
                sizeDuzelt: 2
                renk : "#f5f6f7"
            }
            KobliMenu{
                id : ayarMenu
                yazi : qsTr("<u>A</u>yarlar")
                sizeDuzelt: 1
                renk : "#f5f6f7"
            }
            KobliMenu{
                id : yardimMenu
                yazi : qsTr("<u>Y</u>ardım")
                renk : "#f5f6f7"
            }
        }
    }
    Rectangle{
        id : ustFrame
        anchors.top: dosyaFrame.bottom
        width: anaEkran.width
        height: anaEkran.height / (720 / 60 /*60 px*/)
        color: "#f0f0f0"
        YatayRect{
            id: dosyaYazi
            x: 3-width / 2 + height / 2
            yazi: "Dosya"
        }

        KobliButon{
            id : yeniBtn
            anchors.left: dosyaYazi.right
            anchors.leftMargin:- dosyaYazi.width /2 + dosyaYazi.height / 2
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/yeni.png"
        }
        KobliButon{
            id : veriacbtn
            anchors.left: yeniBtn.right
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/dosyadanAc.png"
            myFriend: ucgenBtn
        }
        KobliButon{
            id : ucgenBtn
            anchors.left: veriacbtn.right
            renk: "#f0f0f0"
            width: 15
            height: ustFrame.height
            rBuyukluk: 25
            imgYol: "imgs/ucgenAc.png"
            myFriend: veriacbtn
        }

        KobliButon{
            id : kaydetbtn
            anchors.left: ucgenBtn.right
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/kaydet.png"
            myFriend: ucgenBtnk
        }
        KobliButon{
            id : ucgenBtnk
            anchors.left: kaydetbtn.right
            renk: "#f0f0f0"
            width: 15
            height: ustFrame.height
            rBuyukluk: 25
            imgYol: "imgs/ucgenAc.png"
            myFriend: kaydetbtn
        }

        YatayRect{
            id: duzenleYazi
            anchors.left: ucgenBtnk.right
            anchors.leftMargin:- duzenleYazi.width /2 + duzenleYazi.height / 2
            yazi: "Düzenle"
        }
        KobliButon{
            id : geribtn
            anchors.left: duzenleYazi.right
            anchors.leftMargin:-duzenleYazi.width /2 + duzenleYazi.height / 2
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/geriAl.png"
            myFriend: ucgenBtng
            myEnable: false
        }
        KobliButon{
            id : ucgenBtng
            anchors.left: geribtn.right
            renk: "#f0f0f0"
            width: 15
            height: ustFrame.height
            rBuyukluk: 25
            imgYol: "imgs/ucgenAc.png"
            myFriend: geribtn
            myEnable: false
        }
        KobliButon{
            id : ileralbtn
            anchors.left: ucgenBtng.right
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/ileriAl.png"
            myFriend: ucgenBtni
            myEnable: false
        }
        KobliButon{
            id : ucgenBtni
            anchors.left: ileralbtn.right
            renk: "#f0f0f0"
            width: 15
            height: ustFrame.height
            rBuyukluk: 25
            imgYol: "imgs/ucgenAc.png"
            myFriend: ileralbtn
            myEnable: false
        }
        YatayRect{
            id: sablonYazi
            anchors.left: ucgenBtni.right
            anchors.leftMargin:- sablonYazi.width /2 + sablonYazi.height / 2
            yazi: "Şablon"
        }
        KobliButon{
            id : sablonbtn
            anchors.left: sablonYazi.right
             anchors.leftMargin:-sablonYazi.width /2 + sablonYazi.height / 2
            renk: "#f0f0f0"
            width: 50
            height: ustFrame.height
            rBuyukluk: 40
            imgYol: "imgs/sablon.png"
        }
        YatayRect{
            id: asamaYazi
            anchors.left: sablonbtn.right
            anchors.leftMargin:- asamaYazi.width /2 + asamaYazi.height / 2
            yazi: "Aşama"
        }


    }
    Rectangle{
        id : solFrame
        anchors.top: ustFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width / (1280 / 60)
        height: anaEkran.height / (720 / 400)
        color: "#f0f0f0"

        KobliButon{
            id : twodbtn
            x : 3
            y : 2
            renk: "#f0f0f0"
            imgYol: "imgs/twod.png"
            clickFonks: [GLCode.convertTo , GLCode.animCam]
            args: ["2D" , false]
            checkableBtn: true
            checked: true
        }

        KobliButon{
            id : threedbtn
            x : 3
            y : 1
            anchors.top : twodbtn.bottom
            renk: "#f0f0f0"
            imgYol: "imgs/threed.png"
            clickFonks: [GLCode.convertTo , GLCode.animCam]
            args: ["3D" , true]
            checkableBtn: true
            checked: false
        }

        VerticalLine{
            id : vl1
            anchors.top: threedbtn.bottom
            anchors.topMargin: 5
            aralik: 7
        }

        KobliButon{
            id : yorungebtn
            x : 3
            y : 1
            anchors.top : vl1.bottom
            anchors.topMargin: 5
            renk: "#f0f0f0"
            imgYol: "imgs/yorunge.png"
        }

        KobliButon{
            id : buyutbtn
            x : 3
            y : 1
            anchors.top : yorungebtn.bottom
            renk: "#f0f0f0"
            imgYol: "imgs/buyut.png"
        }

        VerticalLine{
            id : vl2
            anchors.top: buyutbtn.bottom
            anchors.topMargin: 5
            aralik: 7
        }

        KobliButon{
            id : sigdirbtn
            x : 3
            y : 1
            anchors.top : vl2.bottom
            anchors.topMargin: 5
            renk: "#f0f0f0"
            imgYol: "imgs/sigdir.png"
        }

        KobliButon{
            id : ayarbtn
            x : 3
            y : 1
            anchors.bottom : solFrame.bottom
            anchors.bottomMargin: 5
            renk: "#f0f0f0"
            imgYol: "imgs/ayar.png"
        }
    }
    Rectangle{
        id : sagFrame
        anchors.topMargin: 1
        anchors.right: ustFrame.right
        anchors.top: ustFrame.bottom
        width: anaEkran.width / (1280/139)
        height: anaEkran.height / (720/611)
        color: "#f0f0f0"

        KobliKategori{
            id : m_Kategori
            kategoriAd : "Modlar"
            clip : true
            yukseklik: projeBtn.height * 15 + vl3.height * 3 + 6*4 + 12*1 /*marginler*/ + 1
            KoblimgButon{
                id : projeBtn
                anchors.top: m_Kategori.bolmeKat.bottom
                anchors.topMargin: 4
                btnTag: "Proje"
                imgYol: "imgs/project.png"
                height: 23
            }
            KoblimgButon{
                id : ayarlarBtn
                anchors.top: projeBtn.bottom
                anchors.topMargin: 1
                btnTag: "Ayarlar"
                imgYol: "imgs/setting.png"
                height: 23
            }

            VerticalLine{
                id : vl3
                anchors.top: ayarlarBtn.bottom
                anchors.topMargin: 4
                aralik: 4
            }

            KoblimgButon{
                id : araYuzeyBtn
                anchors.top: vl3.bottom
                anchors.topMargin: 4
                btnTag: "Ara yüzey"
                imgYol: "imgs/arayuzey.png"
                height: 23
            }

            KoblimgButon{
                id : zeminlerBtn
                anchors.top: araYuzeyBtn.bottom
                anchors.topMargin: 1
                btnTag: "Zeminler"
                imgYol: "imgs/soil.png"
                height: 23
            }

            KoblimgButon{
                id : rigidBtn
                anchors.top: zeminlerBtn.bottom
                anchors.topMargin: 1
                btnTag: "Rijit Cisimler"
                imgYol: "imgs/rigid.png"
                height: 23
            }

            KoblimgButon{
                id : atamaBtn
                anchors.top: rigidBtn.bottom
                anchors.topMargin: 1
                btnTag: "Atama"
                imgYol: "imgs/zemin.png"
                height: 23
            }

            VerticalLine{
                id : vl4
                anchors.top: atamaBtn.bottom
                anchors.topMargin: 4
                aralik: 4
            }

            KoblimgButon{
                id : ankrajBtn
                anchors.top: vl4.bottom
                anchors.topMargin: 4
                btnTag: "Ankrajlar"
                imgYol: "imgs/ankraj.png"
                height: 23
            }
            KoblimgButon{
                id : civiBtn
                anchors.top: ankrajBtn.bottom
                anchors.topMargin: 1
                btnTag: "Çiviler"
                imgYol: "imgs/civi.png"
                height: 23
            }
            KoblimgButon{
                id : donatiBtn
                anchors.top: civiBtn.bottom
                anchors.topMargin: 1
                btnTag: "Donatılar"
                imgYol: "imgs/donati.png"
                height: 23
            }
            KoblimgButon{
                id : pasifKazikBtn
                anchors.top: donatiBtn.bottom
                anchors.topMargin: 1
                btnTag: "Pasif Kazıklar"
                imgYol: "imgs/kazik.png"
                height: 23
            }
            KoblimgButon{
                id : sürsarjBtn
                anchors.top: pasifKazikBtn.bottom
                anchors.topMargin: 1
                btnTag: "Sürşarj"
                imgYol: "imgs/sursarj.png"
                height: 23
            }
            KoblimgButon{
                id : suBtn
                anchors.top: sürsarjBtn.bottom
                anchors.topMargin: 1
                btnTag: "Su"
                imgYol: "imgs/su.png"
                height: 23
            }
            KoblimgButon{
                id : depremBtn
                anchors.top: suBtn.bottom
                anchors.topMargin: 1
                btnTag: "Deprem"
                imgYol: "imgs/deprem.png"
                height: 23
            }
            KoblimgButon{
                id : asamaAyarBtn
                anchors.top: depremBtn.bottom
                anchors.topMargin: 1
                btnTag: "Aşama Ayarları"
                imgYol: "imgs/asama.png"
                height: 23
            }
            VerticalLine{
                id : vl5
                anchors.top: asamaAyarBtn.bottom
                anchors.topMargin: 4
                aralik: 4
            }
            KoblimgButon{
                id : analizBtn
                anchors.top: vl5.bottom
                anchors.topMargin: 4
                btnTag: "Analiz"
                imgYol: "imgs/analiz.png"
                height: 23
            }

        }

    }
    Rectangle{
        id : altFrame
        anchors.top: solFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width / (1280 / 1140)
        height: anaEkran.height / (720 / 210 )
        color : "#dddddd"
    }
    Rectangle{
        id : enAltFrame
        anchors.top: altFrame.bottom
        anchors.topMargin: 1
        width: anaEkran.width
        height: anaEkran.height / (720 / 27 )
        color : "#f0f0f0"
    }

    Canvas3D {
        id: canvas3d
        anchors.top: ustFrame.bottom
        width: anaEkran.width - (sagFrame.width + solFrame.width) - anaEkran.width / (1280) * 2
        height: anaEkran.height - (dosyaFrame.height + ustFrame.height + altFrame.height + enAltFrame.height) - anaEkran.height / (720) * 3
        anchors.left : solFrame.right
        anchors.margins: 1
        focus: true


        onInitializeGL: {
            GLCode.initializeGL(canvas3d);
        }

        onPaintGL: {
            GLCode.paintGL(canvas3d);
        }

        onResizeGL: {
            GLCode.resizeGL(canvas3d);
        }
    }

}
