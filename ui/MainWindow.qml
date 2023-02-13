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

import "panels/fileSystem"

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

    Rectangle {
        id: workspaceRect

        anchors.top: commandPanelRect.bottom
        anchors.left: fileSystem.right
        height: parent.height
        width: parent.width

        color: "yellow"

        TabView {
            anchors.fill: parent
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
            Tab {
                title: "Red"
                Rectangle { color: "red" }
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }

//            Flickable {
//                id: flickable
//                clip: true
//                // ...
//                ScrollBar.horizontal: ScrollBar {
//                    parent: flickable.parent
//                    anchors.top: flickable.top
//                    anchors.left: flickable.right
//                    anchors.bottom: flickable.bottom
//                }
//            }


            ScrollView {
                id: view
                contentItem: parent.style.control
                frameVisible: true
                horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOn
                style: parent.style.control
            }

            style: TabViewStyle {
                    frameOverlap: 1
                    tabsMovable: true
                    tabOverlap: 1
                    tab: Rectangle {
                        color: styleData.selected ? "steelblue" :"lightsteelblue"
                        border.color:  "steelblue"
                        implicitWidth: Math.max(text.width + 4, 80)
                        implicitHeight: 20
                        radius: 2
                        Text {
                            id: text
                            anchors.centerIn: parent
                            text: styleData.title
                            color: styleData.selected ? "white" : "black"
                        }
                    }

                    tabBar: Rectangle {
                        color: "white"
                    }

                    frame: Rectangle { color: "steelblue" }
                }

        }

//        Rectangle {
//            id: tabs
//            color: "black"

//            anchors.top: workspaceRect.top
//            anchors.left: workspaceRect.left
//            anchors.right: workspaceRect.right

//            height: 50
//        }

//        Rectangle {
//            id: texteditor

//            color: "white"

//            anchors.top: tabs.bottom
//            anchors.left: workspaceRect.left
//            anchors.right: workspaceRect.right
//            height: root.height

//        }

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
