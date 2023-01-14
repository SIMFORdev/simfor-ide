import QtQuick 2.12
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.12
import QtQml 2.12


Item {
    id: root

    property bool isFolder
    property int levelNum
    property string name

    anchors.fill: parent
    implicitHeight: 20

    Rectangle {
        id: body

        implicitHeight: 20
        height: 20

        anchors.left: parent.left
        anchors.right: parent.right

        Rectangle {
            id: freeSpace
            width: 20 * levelNum
            height: parent.height
            color: "transparent"
        }

        Rectangle {
            id: openButton
            anchors.left: freeSpace.right
            width: 20
            height: parent.height
            color: "#000000"
            Rectangle {
                id: button
                color: "#FFFFFF"
                visible: isFolder
                anchors.left: openButton.left
                anchors.right: openButton.right
                anchors.top: openButton.top
                anchors.bottom: openButton.bottom
                MouseArea {
                    id: openButtonMA
                    anchors.left: button.left
                    anchors.right: button.right
                    anchors.top: button.top
                    anchors.bottom: button.bottom
                    onClicked: function() {
                        console.log("pressed")
                    }
                }
            }
        }

        Text {
            id: type
            text: isFolder ? "P" : "F"
            anchors.left: openButton.right
            width: 20
            height: parent.height
        }

        Text {
            id: text
            text: name
            anchors.left: type.right
            anchors.right: parent.right
        }
    }
}
