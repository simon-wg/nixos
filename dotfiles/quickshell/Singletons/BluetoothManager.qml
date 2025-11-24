pragma Singleton

import Quickshell
import Quickshell.Bluetooth
import QtQuick

Singleton {
    readonly property var enabled: Bluetooth.defaultAdapter.enabled
}
