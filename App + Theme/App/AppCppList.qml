import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    width: parent.width
    Background{}
    ListView {
        anchors.fill: parent
        spacing : 5
        model: str.data
        delegate :Rectangle {
            id:element
            width: parent.width
            height: listCppText.height
            opacity: 0.6

            Text {
                id: listCppText
                anchors.left: parent.left
                anchors.top: parent.top
                text: model.modelData
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                width: parent.width - parent.border.width
                font.family: "Ubuntu"
                font.pixelSize: 12
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
            console.log("New random string!");
        }
    }

    Component.onCompleted: {
        addString.start();
    }

}


