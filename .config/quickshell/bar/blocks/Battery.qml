import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "../"
import "root:/"

BarBlock {
    id: root
    property string battery
    property bool hasBattery: false
    visible: hasBattery

    content: BarText {
        symbolText: battery
    }

    /*
    MouseArea {
        anchors.fill: parent
        onClicked: toggleMenu()
    }
    */

    Process {
        id: batteryCheck
        command: ["sh", "-c", "test -d /sys/class/power_supply/BAT*"]
        running: true
        onExited: function (exitCode) {
            hasBattery = exitCode === 0;
        }
    }

    Process {
        id: batteryProc
        // Modify command to get both capacity and status in one call
        command: ["sh", "-c", "echo $(cat /sys/class/power_supply/BAT*/capacity),$(cat /sys/class/power_supply/BAT*/status)"]
        running: hasBattery

        stdout: SplitParser {
            onRead: function (data) {
                const [capacityStr, status] = data.trim().split(',');
                const capacity = parseInt(capacityStr);
                let batteryIcon = "";
                if (capacity <= 20)
                    batteryIcon = "";
                else if (capacity <= 40)
                    batteryIcon = "";
                else if (capacity <= 65)
                    batteryIcon = "";
                else if (capacity <= 80)
                    batteryIcon = "";
                else if (capacity <= 100)
                    batteryIcon = "";
                else
                    batteryIcon = "";

                const symbol = status === "Charging" ? "" : batteryIcon;
                battery = `${capacity}% ${symbol} `;
            }
        }
    }

    Timer {
        interval: 1000
        running: hasBattery
        repeat: true
        onTriggered: batteryProc.running = true
    }

    /*
    PopupWindow {
        id: menuWindow
        width: 70
        height: 70
        visible: false

        anchor {
            window: root.QsWindow?.window
            edges: Edges.Bottom
            gravity: Edges.Top
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onExited: {
                if (!containsMouse) {
                    closeTimer.start();
                }
            }
            onEntered: closeTimer.stop()

            Timer {
                id: closeTimer
                interval: 500
                onTriggered: menuWindow.visible = false
            }

            Rectangle {
                anchors.fill: parent
                color: "#2c2c2c"
                border.color: "#3c3c3c"
                border.width: 1
                radius: 4

                // model: { symbolText:  }

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 10

                    width: parent.width
                    height: 35
                    color: mouseArea.containsMouse ? "#3c3c3c" : "transparent"
                    radius: 4

                    Text {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        text: "A"
                        color: "white"
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        id:mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
            }
        }
    }

    function toggleMenu() {
        if (root.QsWindow?.window?.contentItem) {
            menuWindow.anchor.rect = root.QsWindow.window.contentItem.mapFromItem(root, 0, -menuWindow.height - 5, root.width, root.height);
            menuWindow.visible = !menuWindow.visible;
        }
    }

    */
}
