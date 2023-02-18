import QtQuick 2.0

Item {
    id: root

    property color rec_color
    property string filecontent

    Rectangle {
        width: 500
        height: 500
        color: rec_color
        Rectangle {
            id: ttt
            width: 500
            height: 300
        }

        Rectangle {
            anchors.top: ttt.bottom
            Text {
                id: code_place
                text: qsTr(filecontent)
            }
            TextInput {
                id: textinput
                anchors.top: code_place.bottom
                width: 300
                height: 300
            }
        }
    }
}
