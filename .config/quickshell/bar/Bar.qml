import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "blocks" as Blocks
import "root:/"

Scope {
    IpcHandler {
        target: "bar"

        function toggleVis(): void {
            // Toggle visibility of all bar instances
            for (let i = 0; i < Quickshell.screens.length; i++) {
                barInstances[i].visible = !barInstances[i].visible;
            }
        }
    }

    property var barInstances: []

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            property var modelData
            screen: modelData

            Component.onCompleted: {
                barInstances.push(bar);
            }

            color: "transparent"

            // Rectangle {
            //     id: highlight
            //     anchors.fill: parent
            //     color: Theme.get.barBgColor
            // }

            height: 34

            visible: true

            anchors {
                top: Theme.get.onTop
                bottom: !Theme.get.onTop
                left: true
                right: true
            }

            // Left side
            RowLayout {
                id: leftBlocks
                spacing: 10

                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                anchors.leftMargin: 4

                //Blocks.Icon {}
                Blocks.Workspaces {}
                Blocks.ActiveWorkspace {
                    id: activeWorkspace
                    Layout.leftMargin: 10
                    anchors.centerIn: undefined

                    chopLength: {
                        var space = Math.floor(bar.width - (rightBlocks.implicitWidth + leftBlocks.implicitWidth));
                        return space * 0.08;
                    }

                    // Show active window
                    // text: {
                    //     var str = activeWindowTitle
                    //     return str.length > chopLength ? str.slice(0, chopLength) + '...' : str;
                    // }

                    color: {
                        return Hyprland.focusedMonitor == Hyprland.monitorFor(screen) ? "#FFFFFF" : "#CCCCCC";
                    }
                }
            }

            // Center
            RowLayout {
                id: centerBlocks
                spacing: 0

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                Blocks.Date {}
                Blocks.Time {}
            }

            // Right side
            RowLayout {
                id: rightBlocks
                spacing: 0

                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                Blocks.SystemTray {}
//                 Blocks.Memory {}
                Blocks.Sound {}
                Blocks.Battery {}
            }
        }
    }
}
