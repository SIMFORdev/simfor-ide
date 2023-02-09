import QtQuick 2.0

Item {
    id: root

    width: 100
    height: 100

    property int count: 0

    Rectangle {
        anchors.fill: parent
        color: "white"
        Text {
            id: text
            text: qsTr("Hello")
        }
        MouseArea {
            id: mousearea
            anchors.fill: parent
            onClicked: function() {
                console.log("clicked test zone")
                var component = Qt.createComponent("TestWidget.qml");
                if (component.status === Component.Ready) {
                    component.createObject(parent, {"x": 100 + count * 100, "y": 100 + count * 100});
                }
                count += 1
            }
        }
    }

}
