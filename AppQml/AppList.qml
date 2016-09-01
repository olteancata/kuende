import QtQuick 2.7
import QtGraphicalEffects 1.0

Rectangle {
    id:win
    width: parent.width
    property color fontColor: "white"
    Background{}
    ListView {
        id: view
        anchors.fill: parent
        spacing: win.height * 0.01
        delegate: Rectangle {
            id:listElement
            width: view.width
            height: view.height * 0.17
            opacity:0.65
            color: "black"

            Image {
                id: thumbnail
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: parent.height * 0.07
                anchors.leftMargin: parent.height * 0.07
                width: parent.height * 0.75
                height: parent.height * 0.75
                source: model.modelData.data.thumbnail
                opacity: 1.0
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally(model.modelData.data.url);
                    }
                }
            }

            Text {
                id: ups
                anchors.top: thumbnail.bottom
                anchors.topMargin: parent.height * 0.01
                anchors.horizontalCenter: thumbnail.horizontalCenter
                text: model.modelData.data.ups
                font.pixelSize: parent.height * 0.12
                opacity: 1.0
                color: win.fontColor
            }

            Text {
                id: author
                anchors.left: title.left
                anchors.top: ups.top
                text: "by " + model.modelData.data.author + " on " + model.modelData.data.subreddit
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
                text: model.modelData.data.title
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
        }
    }

    function request() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                print('HEADERS_RECEIVED')
            } else if(xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE')
                var json = JSON.parse(xhr.responseText.toString())
                var index = 0;
                for(var k in json.data.children) {
                    if(json.data.children[index].data.thumbnail == "nsfw")
                        json.data.children[index].data.thumbnail = "qrc:/ProjectResources/placeholder_purchase_icon@2x-fe3b08515247cd8b389dac40d2a4251cae186bc7c090dbd918bf8a7be54bdb3e.png";
                    else if(json.data.children[index].data.thumbnail === "")
                        json.data.children[index].data.thumbnail = "qrc:/ProjectResources/placeholder_purchase_icon@2x-fe3b08515247cd8b389dac40d2a4251cae186bc7c090dbd918bf8a7be54bdb3e.png";
                    else if(json.data.children[index].data.thumbnail === "self")
                        json.data.children[index].data.thumbnail = "qrc:/ProjectResources/placeholder_purchase_icon@2x-fe3b08515247cd8b389dac40d2a4251cae186bc7c090dbd918bf8a7be54bdb3e.png";
                    index++;
                }
                view.model = json.data.children

            }
            print(json)
        }
        xhr.open("GET", "http://www.reddit.com/.json");
        //xhr.open("GET", "qrc:/ProjectResources/redit.json");
        xhr.send();
    }

    Component.onCompleted: {
        request()
    }
}
