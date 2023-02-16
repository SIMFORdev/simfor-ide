import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import QtQml 2.12
import QtQuick.Controls.Styles 1.4

import "../../UiKit/colors.js" as Colors

Item {
    id: root

    property string temp_value: "#include <iostream> int main() { std::cout << \"Hello\";  }"
    property int counter: 0

    property var wcodeeditor

    function init_components() {
        wcodeeditor = Qt.createComponent("WCodeEditor.qml");
    }

    function create_tab(filename, filecontent) {
        var tab = {
            "tab_index": tabbar.count,
            "tab_text": qsTr(filename)
        }
        tabbarrepeatermodel.append(tab)
        counter++;

        var editor = wcodeeditor.createObject(stacklayout, {
                                                  filecontent: counter.toString(),
                                                  rec_color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                                              })
        stacklayoutmodel.append(editor)

        tabbar.incrementCurrentIndex()
    }

    function delete_tab(index) {
        tabbarrepeatermodel.remove(index, 1)
        stacklayoutmodel.get(index).destroy()
        stacklayoutmodel.remove(index, 1)
        console.log("Delete " + index.toString())
    }

    Component.onCompleted: init_components()

    Rectangle {
        id: workspaceRect

        anchors.fill: parent

        color: Colors.SecondColor

        TabBar {
            id: tabbar
            contentHeight: 30
            width: workspaceRect.width
            clip: true

            background: Rectangle {
                color: Colors.MainColor
            }

            Repeater {
                id: tabbarrepeater
                model: ListModel {
                    id: tabbarrepeatermodel
                }

                WTabButton {
                    index: tab_index
                    text: tab_text
                    onCloseClicked: (idx) => delete_tab(idx)
                }
            }
        }

        StackLayout {
            id: stacklayout
            width: parent.width
            currentIndex: tabbar.currentIndex
            anchors.top: tabbar.bottom
            Repeater {
                model: ObjectModel {
                    id: stacklayoutmodel
                }
            }
        }
        Button {
            id: bbb
            width: 100
            height: 100
            anchors.top: stacklayout.top
            text: "Create"
            onClicked: create_tab("File.cpp", temp_value)
        }
    }
}
