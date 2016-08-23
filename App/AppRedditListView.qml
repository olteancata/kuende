import QtQuick 2.5

Rectangle {
    width: parent.width
    height: parent.height
    color: "#DFDAF6"
    ListView {
        id: view
        anchors.fill: parent
        spacing: 5
        model: ListModel {
            id: mylist
        }

        delegate: Rectangle {
            width: view.width
            height: 85
            border.width: 2
            border.color: "#222"
            anchors.bottomMargin: 2
            Image {
                id: thumbnail
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 12
                anchors.leftMargin: 8
                width: 50
                height: 50
                source: model.modelData.data.thumbnail
            }

            Text {
                id: ups
                anchors.top: thumbnail.bottom
                anchors.left: parent.left
                anchors.topMargin: 2
                anchors.leftMargin: 15
                text: model.modelData.data.ups
            }

            Text {
                id: author
                anchors.left: title.left
                anchors.top: ups.top
                text: "by " + model.modelData.data.author + " on " + model.modelData.data.subreddit
                width: 14
                font.family: "Ubuntu"
            }

            Text {
                id: title
                wrapMode: Text.Wrap
                maximumLineCount: 2
                elide: Text.ElideRight
                clip: true
                text: model.modelData.data.title
                anchors.top: parent.top
                anchors.left: thumbnail.right
                anchors.topMargin: 12
                anchors.leftMargin: 6
                width: parent.width - parent.border.width - thumbnail.width - 20
                font.family: "Ubuntu"
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
                view.model = json.data.children
            }
            print(json)
        }
        xhr.open("GET", "http://www.reddit.com/.json");
        xhr.send();
    }

    Component.onCompleted: {
        request()
    }
}
