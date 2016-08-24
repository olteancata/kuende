import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    width: parent.width
    ListView {
        anchors.fill: parent
        spacing : 5
        model: str.data
        delegate :Rectangle {
            id:element
            width: parent.width
            height: listCppText.height
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(0, parent.height)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 1.0; color: "#ff6066" }
                }
            }
            Text {
                id: listCppText
                anchors.left: parent.left
                anchors.top: parent.top
                text: model.modelData
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                width: parent.width - parent.border.width
                font.family: "Ubuntu"
            }
        }
    }
}
