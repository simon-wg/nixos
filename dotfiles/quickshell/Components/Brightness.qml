import QtQuick
import QtQuick.Layouts

import Quickshell.Widgets

import qs.Singletons

WrapperMouseArea {
    id: root
    property color color: "white"
    RowLayout {

        Text {
            color: root.color
            text: BrightnessManager.brightnessPercentage
            font: FontManager.defaultFont
        }

        Text {
            color: root.color
            text: {
                let brightnessIcons = ["󰃚", "󰃛", "󰃜", "󰃝", "󰃞", "󰃟", "󰃠"];
                let brightnessIndex = Math.min(6, Math.floor((BrightnessManager.brightnessPercentage - 10) / (90 / 7)));
                return brightnessIcons[brightnessIndex] || "";
            }
            font: FontManager.symbolFont
        }
    }

    onWheel: wheel => {
        if (wheel.angleDelta.y > 20) {
            BrightnessManager.raise();
        } else if (wheel.angleDelta.y < -20) {
            BrightnessManager.lower();
        }
    }
}
