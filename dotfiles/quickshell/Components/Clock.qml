import QtQuick
import qs.Singletons

Text {
    readonly property string time: TimeManager.time
    color: "white"
    text: time
    font: FontManager.defaultFont
}
