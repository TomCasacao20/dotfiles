import QtQuick
import Quickshell
import Quickshell.Wayland
import "root:/bar"

BarBlock {
    id: root

    required property var targetWindow

    IdleInhibitor {
        id: inhibitor

        window: root.targetWindow
        enabled: false
    }

    MouseArea {

        anchors.fill: parent

        onClicked: inhibitor.enabled = !inhibitor.enabled

        Text {
            anchors.centerIn: parent

            text: inhibitor.enabled ? "" : ""
            color: inhibitor.enabled ? "#a6da95" : "#cad3f5"
        }
    }
}
