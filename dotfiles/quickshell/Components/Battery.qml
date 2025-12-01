import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import qs.Singletons

RowLayout {
    id: root
    readonly property int bat: 100 * UPower.displayDevice.percentage
    readonly property bool charging: !UPower.onBattery
    property color color: "white"

    Text {
        id: text
        text: root.bat + "%"
        color: root.color
        font: FontManager.defaultFont
    }

    Text {
        id: icon
        text: {
            if (root.charging)
                return "";
            if (root.bat > 75)
                return "";
            if (root.bat > 50)
                return "";
            if (root.bat > 25)
                return "";
            if (root.bat > 12)
                return "";
            return "";
        }
        color: {
            if (root.charging)
                return "white";
            if (root.bat <= 15)
                return "red";
            if (root.bat <= 30)
                return "yellow";
            return root.color;
        }
        font: FontManager.symbolFont
    }
}
