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



    Rectangle {
        id: myForm
        width: 48
        height: 48
        color: "#dddd00"
        border.width: 2
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
        text: "Move"
        anchors.left: parent.left
        anchors.leftMargin: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {

                myForm.x = Math.floor(Math.random() * (animationArea.width - myForm.width))
                myForm.y = Math.floor(Math.random() * (animationArea.height - myForm.height))
                console.log("Move to x:" + moveAnimationX.to + " y:" + moveAnimationY.to + " !")
            }
        }
    }

    //Color
    AppAnimationBtn {
        id: colorBtn
        text: "Color"
        anchors.left: moveBtn.right
        anchors.leftMargin: 15

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
        text: "Size"
        anchors.left: colorBtn.right
        anchors.leftMargin: 15

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (Math.floor(Math.random() * 100) > 35){
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
        text: "Reset"
        anchors.right: parent.right
        anchors.rightMargin: 15

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myForm.x = (animationArea.width - 48) / 2
                myForm.y = (animationArea.height - 48) / 2
                myForm.width = 48
                myForm.height = 48
                myForm.border.width = 2
                myForm.color = "#dddd00"
                myForm.border.color = "#dd7700"
            }
        }
    }

//    //Color
//    AppAnimationBtn {
//        id: infiniteBtn
//        text: "Infinite"
//        anchors.right: parent.right
//        anchors.top: parent.top
//        anchors.rightMargin: 15
//        anchors.topMargin: 8
//        anchors.bottom: undefined
//        textStrikeout: true
//        property bool loop: false

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                if (infiniteBtn.textStrikeout == true){
//                    infiniteBtn.textStrikeout = false

//                }
//                else{
//                    infiniteBtn.textStrikeout = true
//                }
//            }
//        }
//    }

}
