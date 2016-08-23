import QtQuick 2.5
import QtQuick.Controls 2.0

Rectangle{
    anchors.fill: parent
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
                height: parent.height * 0.88
            }
        }

        Item {
            id: cppList
            AppCppList{
                height: parent.height * 0.88
            }

        }

        Item {
            id: move

            AppMove {
                height: parent.height * 0.88
            }

        }

        Item {
            id:animation

            AppAnimation{
                height: parent.height * 0.88
            }
        }
    }

    Rectangle {

        id: bottomBar
        width: parent.width
        height: parent.height * 0.12
        anchors.bottom: parent.bottom
        border.width: 2
        border.color: '#222'

        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "#2222dd" }
        }

        FontLoader {
            id: awesomeFont
            source: "qrc:/ProjectResources/fontawesome-webfont.ttf"
        }
        //List
        AppButton {
            id:listBtn
            anchors.left: parent.left
            buttonImg: "\uf0c9"
            buttonText: "List"
            state: "focused"

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: listBtn; buttonColor: "#00A"; }
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: listBtn; buttonColor: "black"; }
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
            buttonImg: "\uf0cb"
            buttonText: "C++ list"

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: cppListBtn; buttonColor: "#00A"; }
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: cppListBtn; buttonColor: "black"; }
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
            buttonImg: "\uf0b2"
            buttonText: "Move"

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: moveBtn; buttonColor: "#00A"; }
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: moveBtn; buttonColor: "black"; }
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
            buttonImg: "\uf04e"
            buttonText: "Animation"

            states: [
                State {
                    name: "focused"
                    PropertyChanges { target: animationBtn; buttonColor: "#00A"; }
                },
                State {
                    name: "unfocused"
                    PropertyChanges { target: animationBtn; buttonColor: "black"; }
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
