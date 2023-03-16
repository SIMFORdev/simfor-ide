import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import QtQml 2.12
import QtQuick.Controls.Styles 1.4

import "UiKit/Buttons"

import "UiKit/colors.js" as Colors

import "panels/fileSystem"
import "panels/workspacePanel"

ApplicationWindow {
    id: root;
    visible: true;
    width: 1920 * 0.8;
    height: 1080 * 0.8;

    visibility: showMaximized();

    FontLoader {
        id: robotoRegular;
        source: "qrc:/fonts/ui/fonts/JetBrainsMono-Regular.ttf"
    }

    Rectangle {
        id: commandPanelRect
        anchors.top: menuBar.bottom
        width: parent.width
        height: 30

        color: "red"
    }

    FileSystemView {
        id: fileSystem

        anchors.top: commandPanelRect.bottom
        height: parent.height - commandPanelRect.height
        width: 50
    }

    WorkspaceView {
        id: workspaceView

        anchors.top: commandPanelRect.bottom
        anchors.left: fileSystem.right
        height: parent.height - commandPanelRect.height
        width: parent.width - fileSystem.width
    }

    Shortcut {
        sequence: "Ctrl+N"
        onActivated: workspaceView.create_tab("File", "")
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
}
