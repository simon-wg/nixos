import QtQuick
import QtQuick.Layouts
import Quickshell

ShellRoot {
    Variants {
        // Create the panel once on each monitor.
        model: Quickshell.screens

        PanelWindow {
            id: w

            property var modelData
            screen: modelData

            margins {
                right: 50
                bottom: 50
            }

            anchors {
                right: true
                bottom: true
            }

            implicitWidth: content.width
            implicitHeight: content.height

            color: "transparent"

            // Give the window an empty click mask so all clicks pass through it.
            mask: Region {}

            // Use the wlroots specific layer property to ensure it displays over
            // fullscreen windows.
            aboveWindows: true

            ColumnLayout {
                id: content

                Text {
                    text: "Activate Linux"
                    color: "#50ffffff"
                    font.pointSize: 22
                }

                Text {
                    text: "Go to Settings to activate Linux"
                    color: "#50ffffff"
                    font.pointSize: 14
                }
            }
        }
    }
}
