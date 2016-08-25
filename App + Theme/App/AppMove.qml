import QtQuick 2.0;

Rectangle {
    id: moveArea;
    width: parent.width
    property bool globalBit : true;
    Background{}
    AppMoveItem {
        property int initSize : Math.floor(parent.width / 8)
        property int size: parent.width * 0.01
        id: myForm;
        x : (moveArea.width - initSize) / 2
        y : (moveArea.height - initSize) / 2
        width: initSize + myForm.size;
        height: initSize + myForm.size;

        AppMoveItem {
            id:form1
            width: myForm.initSize - myForm.initSize * 0.1 + myForm.size
            height: myForm.initSize  - myForm.initSize * 0.1 + myForm.size
            anchors.centerIn: parent

            AppMoveItem {
                id:form2
                width: myForm.initSize - myForm.initSize * 0.2 + myForm.size
                height: myForm.initSize  - myForm.initSize * 0.2 + myForm.size
                anchors.centerIn: parent

                AppMoveItem {
                    id:form3
                    width: myForm.initSize - myForm.initSize * 0.3 + myForm.size
                    height: myForm.initSize  - myForm.initSize * 0.3 + myForm.size
                    anchors.centerIn: parent

                    AppMoveItem {
                        id:form4
                        width: myForm.initSize - myForm.initSize * 0.4 + myForm.size
                        height: myForm.initSize  - myForm.initSize * 0.4 + myForm.size
                        anchors.centerIn: parent

                        AppMoveItem {
                            id:form5
                            width: myForm.initSize - myForm.initSize * 0.5 + myForm.size
                            height: myForm.initSize  - myForm.initSize * 0.5 + myForm.size
                            anchors.centerIn: parent

                            AppMoveItem {
                                id:form6
                                width: myForm.initSize - myForm.initSize * 0.6 + myForm.size
                                height: myForm.initSize  - myForm.initSize * 0.6 + myForm.size
                                anchors.centerIn: parent
                                AppMoveItem {
                                    id:form7
                                    width: myForm.initSize - myForm.initSize * 0.7 + myForm.size
                                    height: myForm.initSize  - myForm.initSize * 0.7 + myForm.size
                                    anchors.centerIn: parent
                                    AppMoveItem {
                                        id:form8
                                        width: myForm.initSize - myForm.initSize * 0.8 + myForm.size
                                        height: myForm.initSize  - myForm.initSize * 0.8 + myForm.size
                                        anchors.centerIn: parent
                                        AppMoveItem {
                                            id:form9
                                            width: myForm.initSize - myForm.initSize * 0.9 + myForm.size
                                            height: myForm.initSize  - myForm.initSize * 0.9 + myForm.size
                                            anchors.centerIn: parent
                                        }
                                    }
                                }
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
                form7.color = myForm.getRandomColor()
                form8.color = myForm.getRandomColor()
                form9.color = myForm.getRandomColor()

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
            myForm.size += moveArea.width * 0.01
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
            myForm.size -= moveArea.width * 0.01
            sizeMinusBtnColorAnimation.start()
        }
    }

    //Reset
    AppAnimationBtn {
        id: resetBtn
        text: "\uf021"
        anchors.right: parent.right
        anchors.rightMargin: 15
        fontFamily: awesomeFont.name

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
        text: "\uf068"
        anchors.right: resetBtn.left
        anchors.rightMargin: 15
        fontFamily: awesomeFont.name

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
        text: "\uf067"
        anchors.right: sizeMinusBtn.left
        anchors.rightMargin: 15
        fontFamily: awesomeFont.name

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
