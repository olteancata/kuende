import QtQuick 2.0

Rectangle {

    property string buttonText
    property string buttonImg
    property color buttonColor
    width: parent.width / 4
    anchors.top: parent.top
    anchors.topMargin: parent.border.width
    height: parent.height
    color: "transparent"


    Text {
        id: buttonImg
        text: parent.buttonImg
        font.family: awesomeFont.name
        font.pixelSize: parent.height * 0.65
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: parent.buttonColor
    }

    Text {
        id: buttonText
        text: parent.buttonText
        font.family: "Ubuntu"
        font.pixelSize: parent.height * 0.24
        font.bold: true
        anchors.top: buttonImg.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: parent.buttonColor

    }
}
