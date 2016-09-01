import QtQuick 2.0

Rectangle {

    property string text
    property string symbol: ""
    property string fontFamily: "Ubuntu"
    property bool textStrikeout: false

    width: parent.width / 5
    height: width / 2.7
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * 0.03
    border.width: height * 0.04
    border.color: '#222'
    color: "#DC3E5D"

    Text {
        id: buttonText
        font.pixelSize: parent.height * 0.5
        font.family: awesomeFont.name
        text: parent.text
        color: "white"
        anchors.centerIn: parent
        font.strikeout: textStrikeout
    }
}
