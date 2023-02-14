import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import QtQml 2.12
import QtQuick.Controls.Styles 1.4

Item {
    id: root

    Rectangle {
        id: workspaceRect

        anchors.fill: parent

        color: "yellow"

        TabBar {
            id: bar
            width: parent.width
            anchors.top: workspaceRect.top
            WTabButton {
                text: qsTr("Home")
            }
            WTabButton {
                text: qsTr("Discover")
            }
            WTabButton {
                text: qsTr("Activity")
            }
        }

        StackLayout {
            id: stl
            width: parent.width
            currentIndex: bar.currentIndex
            anchors.top: bar.bottom

            WCodeEditor {
                id: a
                rec_color: "black"
            }

            WCodeEditor {
                id: b
                rec_color: "blue"
            }

            WCodeEditor {
                id: c
                rec_color: "green"
            }
        }
        Button {
            id: bbb
            width: 100
            height: 100
            anchors.top: stl.top
            onClicked: function() {
                var wtabbutton = Qt.createComponent("WTabButton.qml");
                var tab_s = wtabbutton.createObject(WTabButton, {
                                                        text: "tab"
                                                    })
                bar.addItem(tab_s);

                var wcodeeditor = Qt.createComponent("WCodeEditor.qml")
                var item = wcodeeditor.createObject(WCodeEditor, {
                                                        id: "tabName",
                                                        rec_color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                                                    })
                stl.children.push(item)
            }
        }
    }
}
