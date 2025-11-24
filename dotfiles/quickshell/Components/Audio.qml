import QtQuick
import QtQuick.Layouts

import Quickshell.Io
import Quickshell.Widgets

import qs.Singletons

WrapperMouseArea {
    id: root
    property color color: "white"
    acceptedButtons: Qt.LeftButton
    RowLayout {
        Text {
            id: volumeText
            color: AudioManager.muted ? "red" : root.color
            text: AudioManager.volume
            font: FontManager.defaultFont
        }

        Text {
            id: volumeIcon
            text: {
                if (AudioManager.muted)
                    return "󰖁";
                if (AudioManager.volume > 66)
                    return "󰕾";
                else if (AudioManager.volume > 33)
                    return "󰖀";
                else
                    return "󰕿";
            }
            color: AudioManager.muted ? "red" : root.color
            font: FontManager.symbolFont
        }
    }
    onClicked: () => {
        openAudioSettingsProc.running = true;
    }
    onWheel: wheel => {
        if (wheel.angleDelta.y > 20) {
            AudioManager.raise();
        } else if (wheel.angleDelta.y < -20) {
            AudioManager.lower();
        }
    }

    Process {
        id: openAudioSettingsProc
        command: ["sh", "-c", "pwvucontrol"]
        running: false
    }
}
