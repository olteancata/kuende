import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: win
    width: parent.width
    Background{}
    ListView {
        anchors.fill: parent
        spacing : win.height * 0.01
        model: str.data
        delegate :Rectangle {
            id:element
            width: win.width
            height: listCppText.height
            opacity: 0.65
            color: "black"

            Text {
                id: listCppText
                anchors.left: parent.left
                anchors.top: parent.top
                text: model.modelData
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                width: parent.width - parent.border.width
                font.family: "Ubuntu"
                font.pixelSize: win.height * 0.02
                color: "white"
            }
        }
    }
    Timer {
        id:addString
        interval: 6000
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered:  {
            str.appendNewRandomQString();
        }
    }

    Component.onCompleted: {
        addString.start();
    }

}


