import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4
import QtQml 2.12
import FileHandler 1.0

Item {
    id: root

    property string filepath
    property color rec_color
    property string filecontent
    property string filecontent_displayed

    function get_lines_count() {
        var count = 0
        var is_char = true
        for (var i = 0 ; i < textinput.text.length; ++i) {
            if (textinput.text[i] === '\n') {
                count++
                is_char = false
            } else {
                is_char = true
            }
        }
        return count + (is_char || textinput.text[textinput.text.length - 1] === '\n')
    }

    FileHandler {
        id: filehander
        filePath: filepath
    }

    Rectangle {
        anchors.fill: parent
        color: rec_color

        Rectangle {
            id: lines
            width: 50
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            color: "red"
            ListView {
                id: listview
                anchors.fill: parent
                anchors.margins: 3

                orientation: ListView.Vertical
                model: ListModel {
                    id: listmodel
                }
                delegate: Component {
                    Text {
                        id: name
                        text: line_number
                    }
                }
            }
        }

        Rectangle {
            anchors.left: lines.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 1
            ScrollView {
                id: textediti
                anchors.fill: parent
                TextArea {
                    id: textinput

                    anchors.fill: parent
                    textFormat: TextEdit.PlainText
                    mouseSelectionMode: TextEdit.SelectCharacters
                    selectByMouse: true
                    persistentSelection: true
                    text: filehander.textCurrent

                    onTextChanged: {
                        var lines_count = get_lines_count()
                        if (lines_count < listmodel.count) {
                            listmodel.clear()
                        }
                        for (var i = listmodel.count + 1; i <= lines_count; ++i) {
                            listmodel.append({"line_number": i.toString()})
                        }
                    }
                }
            }
        }
    }
}
