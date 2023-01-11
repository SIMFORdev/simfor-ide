import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

import "UiKit/Buttons"

ApplicationWindow {
    id: root;
    visible: true;
    width: 1920 * 0.8;
    height: 1080 * 0.8;

    visibility: showMaximized();

    Rectangle {
        id: rect
        x: 50
        y: 50
        DefaultButton {
            id: but
            name: "temp"
        }
    }

//    menuBar: MenuBar {
//            Menu {
//                title: qsTr("&File")
//                Action { text: qsTr("&New..."); onTriggered: console.debug("new pressed"); }
//                Action { text: qsTr("&Open..."); onTriggered: console.debug("open pressed"); }
//                Action { text: qsTr("&Save"); onTriggered: console.debug("save pressed"); }
//                Action { text: qsTr("Save &As..."); onTriggered: console.debug("save as pressed"); }
//                MenuSeparator { }
//                Action { text: qsTr("&Quit"); onTriggered: console.debug("quit pressed"); }
//            }
//            Menu {
//                title: qsTr("&Edit")
//                Action { text: qsTr("Cu&t"); onTriggered: console.debug("cut pressed"); }
//                Action { text: qsTr("&Copy"); onTriggered: console.debug("copy pressed"); }
//                Action { text: qsTr("&Paste"); onTriggered: console.debug("paste pressed"); }
//            }
//            Menu {
//                title: qsTr("&Help")
//                Action { text: qsTr("&About"); onTriggered: console.debug("about pressed"); }
//            }
//        }
}
