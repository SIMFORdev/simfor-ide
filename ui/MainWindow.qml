import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.12
import QtQml 2.12

import "UiKit/Buttons"

import "panels/fileSystemPanel"

ApplicationWindow {
    id: root;
    visible: true;
    width: 1920 * 0.8;
    height: 1080 * 0.8;

    visibility: showMaximized();

    Rectangle {
        id: commandPanelRect
        anchors.top: menuBar.bottom
        width: parent.width
        height: 30

        color: "red"
    }

    Rectangle {
        id: filesRect

        anchors.top: commandPanelRect.bottom
        height: parent.height
        width: 300

        color: "blue"

        ListView {
            id: listview

            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;

            orientation: ListView.Vertical

            model: FolderListModel {
                id: folderModel
                folder: "file:///home/vadim/programs/qt-creator/SIMFORIDE/"
                showDirsFirst: true
                sortField: Name
            }

            delegate: FileSystemPanel {
                id: fileSystemPanel
                name: fileName
                isFolder: fileIsDir
                levelNum: 0
            }
        }
    }

    property int iter: 0

    Rectangle {
        id: workspaceRect

        anchors.top: commandPanelRect.bottom
        anchors.left: filesRect.right
        height: parent.height
        width: parent.width

        color: "yellow"
    }

    Rectangle {
        id: rect
        x: 200
        y: 200
        DefaultButton {
            id: but
            name: "temp"
            onClicked: function() {
                listmodel.append({sometext: iter + " wow"})
                iter += 1
            }
        }
    }

    menuBar: MenuBar {
            Menu {
                title: qsTr("&File")
                Action { text: qsTr("&New..."); onTriggered: console.debug("new pressed"); }
                Action { text: qsTr("&Open..."); onTriggered: console.debug("open pressed"); }
                Action { text: qsTr("&Save"); onTriggered: console.debug("save pressed"); }
                Action { text: qsTr("Save &As..."); onTriggered: console.debug("save as pressed"); }
                MenuSeparator { }
                Action { text: qsTr("&Quit"); onTriggered: console.debug("quit pressed"); }
            }
            Menu {
                title: qsTr("&Edit")
                Action { text: qsTr("Cu&t"); onTriggered: console.debug("cut pressed"); }
                Action { text: qsTr("&Copy"); onTriggered: console.debug("copy pressed"); }
                Action { text: qsTr("&Paste"); onTriggered: console.debug("paste pressed"); }
            }
            Menu {
                title: qsTr("&Help")
                Action { text: qsTr("&About"); onTriggered: console.debug("about pressed"); }
            }
        }

    TestWidget {
        id: test
        x: 400
        y: 400
    }

}
