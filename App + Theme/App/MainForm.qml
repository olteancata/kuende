import QtQuick 2.5
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Rectangle{
    id: myApp
    anchors.fill: parent
    property color backColor: "#ffbbbb"
    property color focusedButtonTextAndImgColor: "#E8DDD7"
    property color unfocusedButtonTextAndImgColor :"#DC3E5D"
    property real menuSize: parent.height * 0.90
    property color unfocusedButtonColor: "#BE2C47"
    property color focusedButtonColor: "#ad2942"

    FontLoader {
        id: awesomeFont
        source: "qrc:/ProjectResources/fontawesome-webfont.ttf"
    }

    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        onCurrentIndexChanged: {
            listBtn.state = "unfocused"
            cppListBtn.state = "unfocused"
            moveBtn.state = "unfocused"
            animationBtn.state = "unfocused"

            console.log("index changed!")
            if (view.currentIndex == 0)
                listBtn.state = "focused"
            if (view.currentIndex == 1)
                cppListBtn.state = "focused"
            if (view.currentIndex == 2)
                moveBtn.state = "focused"
            if (view.currentIndex == 3)
                animationBtn.state = "focused"

        }

        Item {
            id: list

            AppList{
                height: myApp.menuSize
            }
        }

        Item {
            id: cppList
            AppCppList{
                height: myApp.menuSize
            }
        }

        Item {
            id: move

            AppMove {
                height: myApp.menuSize
            }
        }

        Item {
            id:animation

            AppAnimation{
                height: myApp.menuSize
            }
        }
    }

    Rectangle{
        id: separator
        width: parent.width
        height: parent.height * 0.01;
        anchors.bottom: bottomBar.top
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(parent.width, parent.height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#E7816A" }
                GradientStop { position: 1.0; color: "#ECD778" }
            }
        }
    }

    Rectangle {
        id: bottomBar
        width: parent.width
        height: parent.height * 0.09
        anchors.bottom: parent.bottom
        color: "#B7485D"

        //List
        AppButton {
            id:listBtn
            anchors.left: parent.left
            buttonImg: "\uf0c9"
            buttonText: "List"
            state: "focused"
            color: myApp.focusedButtonColor

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: listBtn; buttonTextAndImgColor: myApp.focusedButtonTextAndImgColor; color: myApp.focusedButtonColor}
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: listBtn; buttonTextAndImgColor: myApp.unfocusedButtonTextAndImgColor; color:myApp.unfocusedButtonColor}
                }
            ]

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listBtn.state = "focused"
                    cppListBtn.state = "unfocused"
                    moveBtn.state = "unfocused"
                    animationBtn.state = "unfocused"
                    view.currentIndex = 0
                }
            }
        }

        //C++ list
        AppButton {
            id:cppListBtn
            anchors.left: listBtn.right
            width: (parent.width / 4) - ((parent.width / 4) * 0.01)
            anchors.leftMargin: width * 0.01
            buttonImg: "\uf0cb"
            buttonText: "C++ list"
            state: "unfocused"
            color: myApp.unfocusedButtonColor
            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: cppListBtn; buttonTextAndImgColor: myApp.focusedButtonTextAndImgColor; color: myApp.focusedButtonColor}
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: cppListBtn; buttonTextAndImgColor: myApp.unfocusedButtonTextAndImgColor; color:myApp.unfocusedButtonColor}
                }
            ]

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listBtn.state = "unfocused"
                    cppListBtn.state = "focused"
                    moveBtn.state = "unfocused"
                    animationBtn.state = "unfocused"
                    view.currentIndex = 1
                }
            }
        }

        //Move
        AppButton {
            id:moveBtn
            anchors.left: cppListBtn.right
            width: (parent.width / 4) - ((parent.width / 4) * 0.01)
            anchors.leftMargin: width * 0.01
            buttonImg: "\uf1b2"
            buttonText: "Move"
            state: "unfocused"
            color: myApp.unfocusedButtonColor
            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: moveBtn; buttonTextAndImgColor: myApp.focusedButtonTextAndImgColor; color: myApp.focusedButtonColor}
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: moveBtn; buttonTextAndImgColor: myApp.unfocusedButtonTextAndImgColor; color:myApp.unfocusedButtonColor}
                }
            ]

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listBtn.state = "unfocused"
                    cppListBtn.state = "unfocused"
                    moveBtn.state = "focused"
                    animationBtn.state = "unfocused"
                    view.currentIndex = 2
                }
            }
        }


        //Animation
        AppButton {
            id:animationBtn
            anchors.left: moveBtn.right
            width: (parent.width / 4) - ((parent.width / 4) * 0.01)
            anchors.leftMargin: width * 0.01
            buttonImg: "\uf152"
            buttonText: "Animation"
            state: "unfocused"
            color: myApp.unfocusedButtonColor

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: animationBtn; buttonTextAndImgColor: myApp.focusedButtonTextAndImgColor; color: myApp.focusedButtonColor}
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: animationBtn; buttonTextAndImgColor: myApp.unfocusedButtonTextAndImgColor; color:myApp.unfocusedButtonColor}
                }
            ]

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listBtn.state = "unfocused"
                    cppListBtn.state = "unfocused"
                    moveBtn.state = "unfocused"
                    animationBtn.state = "focused"
                    view.currentIndex = 3
                }
            }
        }
    }
}
