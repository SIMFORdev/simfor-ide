﻿import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import QtQml 2.12
import QtQuick.Controls.Styles 1.4

import "UiKit/Buttons"

import "panels/fileSystem"
import "panels/workspacePanel"

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

    FileSystemView {
        id: fileSystem

        anchors.top: commandPanelRect.bottom
        height: parent.height
        width: 300
    }

    WorkspaceView {
        id: wv

        anchors.top: commandPanelRect.bottom
        anchors.left: fileSystem.right
        height: parent.height
        width: parent.width
    }


//    Rectangle {
//        id: workspaceRect

//        anchors.top: commandPanelRect.bottom
//        anchors.left: fileSystem.right
//        height: parent.height
//        width: parent.width

//        color: "yellow"

//        TabBar {
//            id: bar
//            width: parent.width
//            anchors.top: workspaceRect.top
//            TabButton {
//                text: qsTr("Home")
//                width: implicitWidth
//            }
//            TabButton {
//                text: qsTr("Discover")
//                width: implicitWidth
//            }
//            TabButton {
//                text: qsTr("Activity")
//                width: implicitWidth
//            }
//        }

//        StackLayout {
//            id: stl
//            width: parent.width
//            currentIndex: bar.currentIndex
//            anchors.top: bar.bottom
//            Item {
//                id: homeTab
//                Rectangle {
//                    width: 500
//                    height: 500
//                    color: "red"
//                }
//            }
//            Item {
//                id: discoverTab
//                Rectangle {
//                    width: 500
//                    height: 500
//                    color: "white"
//                }
//            }
//            Item {
//                id: activityTab
//                Rectangle {
//                    width: 500
//                    height: 500
//                    color: "green"
//                }
//            }
//        }

//        DefaultButton {
//            width: 100
//            height: 100
//            anchors.top: stl.bottom
//            anchors.left: fileSystem.right
//            onClicked: function() {
//                var tab = Qt.createComponent("Test.qml");
//                var tab_s = tab.createObject(Test, {text: "fuck"})
//                bar.addItem(tab_s);

//                var item = Item.createObject(Item, {id: "tabName"})
//                stl.children.push(item)
//            }
//        }
//    }

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
