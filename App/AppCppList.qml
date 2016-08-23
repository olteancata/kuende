import QtQuick 2.0

import org.example 1.0

ListView {
    id: view
    width: parent.width
    model: RoleEntryModel {}
    focus: true
    spacing: 12
    delegate: AppCppListElement {
        anchors.bottomMargin: 6
        text: model.randomstring
    }
    highlight: Rectangle { }
}

