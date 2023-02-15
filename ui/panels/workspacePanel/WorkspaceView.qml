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

    property string temp_value: "#include <iostream> int main() { std::cout << \"Hello\";  }"
    property int counter: 0

    property var wtabbutton
    property var wcodeeditor

    function init_components() {
        wtabbutton = Qt.createComponent("WTabButton.qml");
        wcodeeditor = Qt.createComponent("WCodeEditor.qml");
    }

    function create_tab(filename, filecontent) {
        var tab = wtabbutton.createObject(tabbar, {
                                              text: qsTr(filename)
                                          })
        tabbarmodel.append(tab)


        counter++;

        var editor = wcodeeditor.createObject(stacklayout, {
                                                  filecontent: counter.toString(),
                                                  rec_color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                                              })
        stacklayoutmodel.append(editor)

        tabbar.incrementCurrentIndex()
    }

    function delete_tab(index) {
        tabbarmodel.remove(index, 1)
        stacklayoutmodel.remove(index, 1)
    }

    Component.onCompleted: init_components()

    Rectangle {
        id: workspaceRect

        anchors.fill: parent

        color: "yellow"

        TabBar {
            id: tabbar
            width: workspaceRect.width
            anchors.top: workspaceRect.top
            anchors.left: workspaceRect.left
            anchors.right: workspaceRect.right
            clip: true
//            ScrollBar.horizontal: ScrollBar{
//                parent: tabbar
//                anchors.fill: tabbar
//            }
            MouseArea {
                id: mousearea
                anchors.fill: parent

            }

            Repeater {
                model: ObjectModel {
                    id: tabbarmodel
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
        Button {
            id: ccc
            width: 100
            height: 100
            anchors.top: stacklayout.top
            anchors.left: bbb.right
            text: "Delete"
            onClicked: delete_tab(tabbar.currentIndex)
        }
    }
}
