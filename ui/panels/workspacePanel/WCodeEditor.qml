import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4


Item {
    id: root

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
            anchors.margins: 3
            ScrollView {
                id: textediti
                anchors.fill: parent
                TextArea {
                    id: textinput

                    anchors.fill: parent
    //                font: "/home/vadim/programs/qt-creator/SIMFORIDE/ui/fonts/JetBrainsMono-Bold.ttf"

                    textFormat: TextEdit.PlainText
                    mouseSelectionMode: TextEdit.SelectCharacters
                    selectByMouse: true
                    persistentSelection: true
                    text: {
                        var str = "#include <iostream>\n" +
                                "\n" +
                                "using namespace std;\n" +
                                "\n" +
                                "int main() {\n" +
                                "    cout << \"Hello world\\n\";\n" +
                                "    return 0;\n" +
                                "}\n";
                        return str + filecontent;
                    }
    //                onTextChanged: console.log(textinput.lineCount)
                    onTextChanged: {
                        var lines_count = get_lines_count()
                        console.log(lines_count, listmodel.count)
                        if (lines_count < listmodel.count) {
                            listmodel.clear()
                            console.log("Clear")
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
