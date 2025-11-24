pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Components

ShellRoot {
    id: root
    // Currently set to Catppuccin Mocha Base
    property var gradientColors: ["#1E1E2E"]
    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                id: panel

                required property var modelData
                screen: modelData
                color: "transparent"
                anchors {
                    top: true
                    left: true
                    right: true
                }
                implicitHeight: 32

                RowLayout {
                    id: mainLayout
                    anchors.fill: parent

                    RowLayout {
                        id: leftBar
                        Layout.fillHeight: true
                        Layout.leftMargin: 8
                        Layout.alignment: Qt.AlignLeft

                        WorkspaceList {}
                    }

                    RowLayout {
                        id: rightBar
                        Layout.rightMargin: 8
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignRight
                        spacing: 8
                        Tray {
                            id: tray
                            panelWindow: panel
                        }
                        Separator {
                            visible: tray.hasItems
                        }
                        Bluetooth {
                            id: bluetooth
                        }
                        Separator {}
                        Brightness {}
                        Separator {}
                        Audio {}
                        Separator {}
                        Network {}
                        Separator {}
                        Battery {}
                        Separator {}
                        Clock {}
                    }
                }

                // Center element
                RowLayout {
                    anchors.centerIn: parent

                    WindowName {}
                }

                GradientFill {
                    fillLayout: mainLayout
                    colors: root.gradientColors
                    // colors: ["#5E6BA7", "#D7BAD6", "#5E6BA7"]
                }
            }
        }
    }
}
