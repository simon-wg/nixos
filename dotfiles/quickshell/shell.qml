//@ pragma UseQApplication

import QtQuick
import Quickshell

ShellRoot {
    Component {
        id: bar
        Bar {}
    }
    Component {
        id: watermark
        Watermark {}
    }
    Loader {
        id: barLoader
        asynchronous: false
        sourceComponent: bar
        active: true
    }
    Loader {
        id: watermarkLoader
        asynchronous: false
        sourceComponent: watermark
        active: true
    }
}
