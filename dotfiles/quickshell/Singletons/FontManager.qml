pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property font defaultFont: Qt.font({
        family: "JetBrains Mono",
        pointSize: 12
    })
    readonly property font symbolFont: Qt.font({
        family: "Symbols Nerd Font Mono",
        pointSize: 12
    })
}
