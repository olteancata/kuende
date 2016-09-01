import QtQuick 2.7
import QtGraphicalEffects 1.0

Rectangle {
    id:win
    width: parent.width
    property color fontColor: "black"
    Background{}
    ListView {
        Component.onCompleted: {
            console.log("Size of model: " + myList.size());
        }
        id: view
        anchors.fill: parent
        spacing: win.height * 0.01
        model: myList.myModelList
        delegate: Rectangle {
            id:listElement
            width: view.width
            height: view.height * 0.17
            opacity:0.6
            color: model.modelData.color

             Image {
                id: thumbnail
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: parent.height * 0.07
                anchors.leftMargin: parent.height * 0.07
                width: parent.height * 0.75
                height: parent.height * 0.75
                source: model.modelData.thumbnail
                opacity: 1.0
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally(model.modelData.url);
                    }
                }
            }

            Text {
                id: ups
                anchors.top: thumbnail.bottom
                anchors.topMargin: parent.height * 0.01
                anchors.horizontalCenter: thumbnail.horizontalCenter
                text: model.modelData.ups
                font.pixelSize: parent.height * 0.12
                opacity: 1.0
                color: win.fontColor
            }

            Text {
                id: author
                anchors.left: title.left
                anchors.top: ups.top
                text: "by " + model.modelData.author + " on " + model.modelData.subreddit
                font.pixelSize: parent.height * 0.12
                font.family: "Ubuntu"
                opacity: 1.0
                color: win.fontColor
            }

            Text {
                id: title
                wrapMode: Text.Wrap
                maximumLineCount: 3
                elide: Text.ElideRight
                clip: true
                text: model.modelData.title
                anchors.top: parent.top
                anchors.left: thumbnail.right
                anchors.topMargin: parent.height * 0.15
                anchors.leftMargin: parent.height * 0.12
                font.pixelSize: parent.height * 0.14
                font.bold: true
                width: parent.width - parent.border.width - thumbnail.width - 20
                font.family: "Ubuntu"
                opacity: 1.0
                color: win.fontColor
            }
            Component.onCompleted: {
                console.log("Rectangle color: " + modelData.color);
                console.log("Rectangle ups: " + model.modelData.ups);
            }
        }
    }
}
