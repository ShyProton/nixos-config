import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

ShellRoot {
    PanelWindow {
        id: barRoot

        anchors {
            top: true
            left: true
            bottom: true
        }

        implicitWidth: 50

        Rectangle {
            id: barBackground

            anchors {
                fill: parent
            }

            color: "#222"
        }

        Item {
            id: barContent

            anchors {
                fill: parent
                topMargin: 10
                bottomMargin: 10
            }

            RowLayout {
                id: topButtons
                // MAIN MENU
                // NOTIFICATIONS
            }
        }
    }
}
