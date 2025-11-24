pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property int brightness: parseInt(brightnessView.text())
    property int maxBrightness: parseInt(maxBrightnessView.text())
    property int brightnessPercentage: Math.round(100 * Math.pow(brightness / maxBrightness, 1 / 4))

    FileView {
        id: maxBrightnessView
        path: Qt.resolvedUrl("/sys/class/backlight/intel_backlight/max_brightness")
    }

    FileView {
        id: brightnessView
        path: Qt.resolvedUrl("/sys/class/backlight/intel_backlight/brightness")
        watchChanges: true
        onFileChanged: this.reload()
    }

    function raise(): void {
        raiseBrightnessTimer.start();
    }

    function lower(): void {
        lowerBrightnessTimer.start();
    }

    Process {
        id: raiseBrightnessProc
        command: ["sh", "-c", "brightnessctl -e4 -n2 set 5%+"]
    }

    Process {
        id: lowerBrightnessProc
        command: ["sh", "-c", "brightnessctl -e4 -n2 set 5%-"]
    }

    Timer {
        id: lowerBrightnessTimer
        interval: 100
        running: false
        repeat: false
        onTriggered: () => {
            lowerBrightnessProc.running = true;
        }
    }

    Timer {
        id: raiseBrightnessTimer
        interval: 100
        running: false
        repeat: false
        onTriggered: () => {
            raiseBrightnessProc.running = true;
        }
    }
}
