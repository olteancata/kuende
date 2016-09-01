import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{

    anchors.fill: parent
    Image {
        id: myBackground
        anchors.fill: parent
        source: "qrc:/ProjectResources/hd-nature-images-wallpaper-of-natures-organic-widescreen-wallpapers-windows-nature-wallpapers-smart-phone-wallpapers-plant-background-images-organic-life-2880x1710.jpg"

    }

    FastBlur {
        anchors.fill: myBackground
        source: myBackground
        radius: 70
    }
}
