import QtQuick

import Quickshell.Io
import Quickshell.Widgets

import qs.Singletons

WrapperMouseArea {
    id: root
    property bool enabled: BluetoothManager.enabled
    property color color: "white"

    Text {
        text: root.enabled ? "󰂯" : "󰂲"
        color: root.color
        font: FontManager.symbolFont
    }

    onClicked: {
        bluemanManagerProc.running = true;
    }

    Process {
        id: bluemanManagerProc
        command: ["sh", "-c", "blueman-manager"]
        running: false
    }
}
