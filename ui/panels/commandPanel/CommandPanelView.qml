import QtQuick 2.0

import "../../UiKit/Buttons"

Item {
    id: root

    signal runClicked()
    signal buildClicked()

    Rectangle {
        id: commandPanelRect
        anchors.fill: parent
        width: parent.width
        height: parent.height

        color: "grey"

        DefaultButton {
            id: runbutton
            name: "Run"
            anchors.centerIn: parent
            onClicked: runClicked()
        }
        DefaultButton {
            id: buildbutton
            name: "Build"
            anchors.left: runbutton.right
            onClicked: buildClicked()
        }
    }
}
