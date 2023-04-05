﻿import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import QtQml 2.12
import QtQuick.Controls.Styles 1.4
import Runner 1.0

import "UiKit/Buttons"

import "UiKit/colors.js" as Colors

import "panels/fileSystem"
import "panels/workspacePanel"
import "panels/commandPanel"

ApplicationWindow {
    id: root;
    visible: true;
    width: 1920 * 0.8;
    height: 1080 * 0.8;

    FontLoader {
        id: robotoRegular;
        source: "qrc:/fonts/ui/fonts/JetBrainsMono-Regular.ttf"
    }

    Runner {
        id: runner
    }

    CommandPanelView {
        id: commandPanelRect
        anchors.top: menuBar.bottom
        width: parent.width
        height: 30
        onRunClicked: console.log("run")
        onBuildClicked: console.log("build")
    }

    FileSystemView {
        id: fileSystem

        anchors.top: commandPanelRect.bottom
        height: parent.height - commandPanelRect.height
        width: 300
        onOpenFile: {
            runner.setProjectPath(path)
            workspaceView.create_tab(path)
        }
    }

    WorkspaceView {
        id: workspaceView

        anchors.top: commandPanelRect.bottom
        anchors.left: fileSystem.right
        height: parent.height - commandPanelRect.height
        width: parent.width - fileSystem.width
    }

//    Shortcut {
//        sequence: "Ctrl+N"
//        onActivated: workspaceView.create_tab("File", "")
//    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        selectFolder: true
        onAccepted: {
            fileSystem.setRootIndex(fileSystemModel.setRootFileSystemPath(fileDialog.folder.toString().slice(7)))
            fileDialog.close()
        }
        onRejected: {
            console.log("Canceled")
        }
        Component.onCompleted: visible = false
    }

    menuBar: MenuBar {
            Menu {
                title: qsTr("&File")
                Action { text: qsTr("&New..."); onTriggered: console.debug("new pressed"); }
                Action { text: qsTr("&Open..."); onTriggered: fileDialog.open(); }
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
