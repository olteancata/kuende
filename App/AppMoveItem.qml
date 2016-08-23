import QtQuick 2.0

Rectangle {

    Behavior on color {
        ColorAnimation { duration: 600 }
    }

    Behavior on border.color {
        ColorAnimation { duration: 600 }
    }

    Behavior on x {
        NumberAnimation { duration: 600 }
    }

    Behavior on y {
        NumberAnimation { duration: 600 }
    }

    Behavior on width {
        NumberAnimation { duration: 600 }
    }

    Behavior on height {
        NumberAnimation { duration: 600 }
    }
}
