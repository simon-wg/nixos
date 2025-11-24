pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string networkName
    property int networkLevel

    Process {
        id: networkNameProc
        command: ["sh", "-c", "nmcli -t -f name connection show --active | head -1"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.networkName = this.text.trim()
        }
    }

    Process {
        id: networkStrengthProc
        command: ["sh", "-c", "cat /proc/net/wireless | awk 'NR==3 {print $4}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.networkLevel = parseInt(this.text.trim())
        }
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            networkNameProc.running = true;
            networkStrengthProc.running = true;
        }
    }
}
