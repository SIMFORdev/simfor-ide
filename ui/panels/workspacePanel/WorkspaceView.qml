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

    property string temp_value: "#include <iostream>\n int main() { std::cout << \"Hello\";  }"
    property int counter: 0

    property var wcodeeditor

    function create_tab(filename, filecontent) {
        var content = counter.toString() + " button"

        var tab = {
            "tab_index": tabbar.count,
            "tab_text": content
        }
        tabbarrepeatermodel.append(tab)


        var editor = {
            "editor_content": content,
            "editor_color": Qt.rgba(Math.random(), Math.random(), Math.random(), 1).toString()
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
                id: slrepeater
                model: ListModel {
                    id: slrepeatermodel
                }
                WCodeEditor {
                    filecontent: editor_content
                    rec_color: editor_color
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
