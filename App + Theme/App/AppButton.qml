import QtQuick 2.0

Rectangle {

    property string buttonText
    property string buttonImg
    property color buttonTextAndImgColor
    width: parent.width / 4
    anchors.top: parent.top
    height: parent.height


    Text {
        id: buttonImg
        text: parent.buttonImg
        font.family: awesomeFont.name
        font.pixelSize: parent.height * 0.44
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.21
        color: parent.buttonTextAndImgColor
    }

    Text {
        id: buttonText
        text: parent.buttonText
        font.family: "Ubuntu"
        font.pixelSize: parent.height * 0.14
        anchors.top: buttonImg.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: parent.buttonTextAndImgColor

    }
}
