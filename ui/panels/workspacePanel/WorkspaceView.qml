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

    property int counter: 0

    property var wcodeeditor

    function create_tab(path) {
        var content = ""

        var fullpath = path.toString().split('/')
        var filename = fullpath[fullpath.length - 1]
        var filecontent = ""

        var tab = {
            "tab_index": tabbar.count,
            "tab_text": filename
        }
        tabbarrepeatermodel.append(tab)

        var colorcond = true
        var editor_color = (colorcond) ? "white" : Qt.rgba(Math.random(), Math.random(), Math.random(), 1).toString()
        var editor = {
            "editor_content": content,
            "editor_color": editor_color,
            "file_path": path
        }
        slrepeatermodel.append(editor)

        counter++;
        tabbar.incrementCurrentIndex()
    }

    function delete_tab(index) {
        tabbarrepeatermodel.remove(index, 1)
        slrepeatermodel.remove(index, 1)
        for (var i = 0; i < tabbar.count; ++i) {
            tabbarrepeatermodel.setProperty(i, "tab_index", i)
        }
    }

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
                    activeIndex: tabbar.currentIndex
                    text: tab_text
                    onButtonClicked: idx => tabbar.setCurrentIndex(idx)
                    onCloseClicked: idx => delete_tab(idx)
                }
            }
        }

        StackLayout {
            id: stacklayout
            width: parent.width
            height: parent.height - tabbar.height
            currentIndex: tabbar.currentIndex
            anchors.top: tabbar.bottom
            Repeater {
                id: slrepeater
                model: ListModel {
                    id: slrepeatermodel
                }
                WCodeEditor {
                    filepath: file_path
                    filecontent: editor_content
                    rec_color: editor_color
                    width: stacklayout.width
                    height: stacklayout.height
                }
            }
        }
    }
}
