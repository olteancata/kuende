import QtQuick 2.0
import QtQuick.Particles 2.0


Rectangle {
    id: animationArea
    width: parent.width

    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++ ) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
    Background{}
    Rectangle {
        id: myForm
        property int initSize: parent.width * 0.12
        width: initSize
        height: initSize
        color: "#dddd00"
        border.width: width * 0.02
        border.color: "#dd7700"
        x: (animationArea.width - myForm.width) / 2
        y: (animationArea.height - myForm.height) / 2

        Behavior on color {
            ColorAnimation { duration: 1000 }
        }

        Behavior on border.color {
            ColorAnimation { duration: 1000 }
        }

        Behavior on width {
            NumberAnimation { duration: 1000 }
        }

        Behavior on height {
            NumberAnimation { duration: 1000 }
        }

        Behavior on border.width {
            NumberAnimation { duration: 1000 }
        }

        Behavior on x {
            NumberAnimation { duration: 1000 }
        }

        Behavior on y {
            NumberAnimation { duration: 1000 }
        }
    }

    //Move
    AppAnimationBtn {
        id:moveBtn
        text: "Move \uf0b2"
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.005

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myForm.x = Math.floor(Math.random() * (animationArea.width - myForm.width))
                myForm.y = Math.floor(Math.random() * (animationArea.height - myForm.height))
            }
        }
    }

    //Color
    AppAnimationBtn {
        id: colorBtn
        text: "Color \uf1fc"
        anchors.left: moveBtn.right
        anchors.leftMargin: parent.height * 0.005

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myForm.color = getRandomColor()
                myForm.border.color = getRandomColor()
                console.log("Change color of 'myForm' !")
            }
        }
    }

    //Size
    AppAnimationBtn {
        id: sizeBtn
        text: "Size \uf047"
        anchors.left: colorBtn.right
        anchors.leftMargin: parent.height * 0.005

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (Math.floor(Math.random() * 100) > 40){
                    myForm.width += Math.floor(Math.random() * 20) + 1
                    myForm.height += Math.floor(Math.random() * 20) + 1
                    myForm.border.width += Math.floor(Math.random() * Math.floor(myForm.width / 5))
                }
                else{
                    myForm.width -= Math.floor(Math.random() * 20) + 1
                    myForm.height -= Math.floor(Math.random() * 20) + 1
                    myForm.border.width -= Math.floor(Math.random() * Math.floor(myForm.width / 5))
                }
            }
        }
    }

    //Reset
    AppAnimationBtn {
        id: resetBtn
        text: "Reset \uf021"
        anchors.right: parent.right
        anchors.rightMargin: parent.height * 0.005

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myForm.x = (animationArea.width - myForm.initSize) / 2
                myForm.y = (animationArea.height - myForm.initSize) / 2
                myForm.width = myForm.initSize
                myForm.height = myForm.initSize
                myForm.border.width = parent.width * 0.05
                myForm.color = "#dddd00"
                myForm.border.color = "#dd7700"
            }
        }
    }

}
