import QtQuick 2.0;
import QtGraphicalEffects 1.0

Rectangle {
    id: moveArea;
    width: parent.width
    property bool globalBit : true;
    Background{}
    AppMoveItem {
        property int initSize : Math.floor(parent.width / 6)
        property int size: parent.width * 0.01
        id: myForm;
        x : (moveArea.width - initSize) / 2
        y : (moveArea.height - initSize) / 2
        width: initSize + myForm.size;
        height: initSize + myForm.size;
        color: "transparent"
        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop {
                    position: 0.000
                    color: "#ff4444"
                }
                GradientStop {
                    position: 0.05
                    color: "#cc5577"
                }
                GradientStop {
                    position: 0.1
                    color: "#7755cc"
                }
                GradientStop {
                    position: 0.15
                    color: "#4455ff"
                }
                GradientStop {
                    position: 0.2
                    color: "#44cc44"
                }
                GradientStop {
                    position: 0.25
                    color: "#44ff44"
                }
                GradientStop {
                    position: 0.3
                    color: "#77cc77"
                }
                GradientStop {
                    position: 0.35
                    color: "#cc77cc"
                }
                GradientStop {
                    position: 0.4
                    color: "#ff44ff"
                }
                GradientStop {
                    position: 0.45
                    color: "#4444ff"
                }
                GradientStop {
                    position: 0.499
                    color: "transparent"
                }
                GradientStop {
                    position: 0.50
                    color: "transparent"
                }
                GradientStop {
                    position: 1.000
                    color: "transparent"
                }
            }
        }


//        function getRandomColor() {
//            var letters = '0123456789ABCDEF';
//            var color = '#';
//            for (var i = 0; i < 6; i++ ) {
//                color += letters[Math.floor(Math.random() * 16)];
//            }
//            return color;
//        }

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: {

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
