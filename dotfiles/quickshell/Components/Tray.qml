pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root
    required property PanelWindow panelWindow
    spacing: 5

    readonly property bool hasItems: repeater.count > 0
    property color color: "white"

    Repeater {
        id: repeater
        model: SystemTray.items

        delegate: WrapperMouseArea {
            required property SystemTrayItem modelData
            implicitWidth: 24
            implicitHeight: 24

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            // Display the tray icon
            IconImage {
                anchors.fill: parent
                source: parent.modelData.icon
                smooth: true
            }

            onClicked: mouse => {
                var pos = mapToItem(root.panelWindow.contentItem, mouse.x, mouse.y);
                modelData.display(root.panelWindow, pos.x, pos.y);
            }
        }
    }
}
