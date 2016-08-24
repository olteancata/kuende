import QtQuick 2.0;

Rectangle {
    id: moveArea;
    width: parent.width

    property bool globalBit : true;

    AppMoveItem {
        property int size: 2
        id: myForm;
        x : (moveArea.width - 70) / 2
        y : (moveArea.height - 70) / 2
        width: 96 + myForm.size;
        height: 96 + myForm.size;

        AppMoveItem {
            id:form6
            width: 80 + myForm.size
            height: 80 + myForm.size
            anchors.centerIn: parent

            AppMoveItem {
                id:form5
                width: 64 + myForm.size
                height: 64 + myForm.size
                anchors.centerIn: parent

                AppMoveItem {
                    id:form4
                    width: 48 + myForm.size
                    height: 48 + myForm.size
                    anchors.centerIn: parent

                    AppMoveItem {
                        id:form3
                        width: 32 + myForm.size
                        height: 32 + myForm.size
                        anchors.centerIn: parent

                        AppMoveItem {
                            id:form2
                            width: 16 + myForm.size
                            height: 16 + myForm.size
                            anchors.centerIn: parent

                            AppMoveItem {
                                id:form1
                                width: myForm.size
                                height: myForm.size
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }

        function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: {

                myForm.color = myForm.getRandomColor()
                form1.color = myForm.getRandomColor()
                form2.color = myForm.getRandomColor()
                form3.color = myForm.getRandomColor()
                form4.color = myForm.getRandomColor()
                form5.color = myForm.getRandomColor()
                form6.color = myForm.getRandomColor()

                console.log("Change color of 'myForm' !")
            }
            drag {
                target: myForm;
                minimumX: 0;
                minimumY: 0;
                maximumX: (moveArea.width - myForm.width);
                maximumY: (moveArea.height - myForm.height);
            }
        }
    }

    Timer {
        id:timerPlus
        interval: 600
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered:  {
            myForm.size += 4
            sizePlusBtnColorAnimation.start()
        }
    }

    Timer {
        id:timerMinus
        interval: 600
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered:  {
            myForm.size -= 4
            sizeMinusBtnColorAnimation.start()
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
                myForm.x = (moveArea.width - 98) / 2
                myForm.y = (moveArea.height - 98) / 2
                myForm.size = 2
            }
        }
    }

    //Size -
    AppAnimationBtn {
        id: sizeMinusBtn
        text: "Size -"
        anchors.right: resetBtn.left
        anchors.rightMargin: 15

        ColorAnimation {
            id:sizeMinusBtnColorAnimation
            target: sizeMinusBtn
            properties: "border.color"
            from: "red"
            to: "#222"
            duration: 600
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                if (timerMinus.running == true)
                    timerMinus.stop()
                else
                    timerMinus.start()
            }
        }
    }

    //Size +
    AppAnimationBtn {
        id: sizePlusBtn
        text: "Size +"
        anchors.right: sizeMinusBtn.left
        anchors.rightMargin: 15

        ColorAnimation {
            id:sizePlusBtnColorAnimation
            target: sizePlusBtn
            properties: "border.color"
            from: "red"
            to: "#222"
            duration: 600
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                if (timerPlus.running == true)
                {
                    timerPlus.stop()
                }
                else
                {
                    timerPlus.start()
                }
            }
        }
    }
}
