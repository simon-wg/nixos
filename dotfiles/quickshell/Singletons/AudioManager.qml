pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root
    property int volume: Math.round(100 * Pipewire.defaultAudioSink?.audio.volume)
    property var muted: Pipewire.defaultAudioSink?.audio.muted
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    function mute(): void {
        muteProc.running = true;
    }

    function raise(): void {
        raiseVolTimer.start();
    }

    function lower(): void {
        lowerVolTimer.start();
    }

    Process {
        id: muteProc
        command: ["sh", "-c", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"]
    }

    Process {
        id: raiseVolProc
        command: ["sh", "-c", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"]
    }

    Process {
        id: lowerVolProc
        command: ["sh", "-c", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"]
    }

    Timer {
        id: lowerVolTimer
        interval: 100
        running: false
        repeat: false
        onTriggered: () => {
            lowerVolProc.running = true;
        }
    }

    Timer {
        id: raiseVolTimer
        interval: 100
        running: false
        repeat: false
        onTriggered: () => {
            raiseVolProc.running = true;
        }
    }
}
