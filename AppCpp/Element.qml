import QtQuick 2.0

Rectangle {
    id:element
    width: parent.width
    height: 85
    border.color: "#333333"
    border.width: 2
    Text {
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        text: str.data
    }
}
