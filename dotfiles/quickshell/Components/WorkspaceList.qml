pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Singletons

RowLayout {
    id: root

    property var workspaceList: []
    property color color: "white"

    Timer {
        id: debounceTimer
        interval: 10
        onTriggered: {
            root.workspaceList = Hyprland.workspaces.values;
        }
    }

    Connections {
        target: Hyprland.workspaces
        function onValuesChanged() {
            debounceTimer.restart();
        }
    }

    Component.onCompleted: {
        root.workspaceList = Hyprland.workspaces.values;
    }

    Repeater {
        model: root.workspaceList
        delegate: RowLayout {
            id: workspaceRow
            required property var modelData
            required property int index
            Rectangle {
                color: "transparent"
                border.color: parent.modelData.focused ? root.color : "transparent"
                radius: width / 2
                implicitWidth: 24
                implicitHeight: 24

                Text {
                    id: text
                    anchors.centerIn: parent
                    text: workspaceRow.modelData.name
                    color: root.color
                    font: FontManager.defaultFont
                }
            }
        }
    }
}
