import QtQuick 2.0

Rectangle {
    property string text
    height: 85
    width : parent.width
    anchors.bottomMargin: 2
    border.width: 2
    border.color: "#222222"

    Text {
        anchors.centerIn: parent
        text: parent.text
    }
}
