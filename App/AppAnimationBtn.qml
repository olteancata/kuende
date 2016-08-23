import QtQuick 2.0

Rectangle {

    property string text
    property bool textStrikeout: false
    width:62
    height: 24
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 20
    border.width: 2
    border.color: '#222'

    Text {
        font.bold: true
        text: parent.text
        color: '#222'
        anchors.centerIn: parent
        font.strikeout: textStrikeout
    }
}
