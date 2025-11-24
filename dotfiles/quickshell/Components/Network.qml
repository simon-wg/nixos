import QtQuick
import QtQuick.Layouts
import qs.Singletons

RowLayout {
    id: root
    readonly property string networkName: NetworkManager.networkName
    readonly property int networkLevel: NetworkManager.networkLevel
    property color color: "white"

    Text {
        text: root.networkName
        color: root.color
        font: FontManager.defaultFont
    }

    Text {
        text: "(" + root.networkLevel + "db)"
        color: root.color
        font: FontManager.defaultFont
    }
}
