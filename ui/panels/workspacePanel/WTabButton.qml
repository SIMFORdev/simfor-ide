import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.12

import "../../UiKit/colors.js" as Colors

TabButton {
    id: root

    property int index
    signal closeClicked(int idx)

    width: contentitem.contWidth

    contentItem: Rectangle {
        id: contentitem

        property int contWidth: {
            return img.width + label.width + close.width + root.leftPadding + root.rightPadding
        }

        color: Colors.TransparentColor

        Rectangle {
            id: img
            width: 20
            height: root.height
            color: Colors.TransparentColor
        }
        Text {
            id: label
            text: root.text
            color: Colors.TextColor
            anchors.left: img.right
        }
        Rectangle {
            id: close
            width: 20
            height: root.height
            color: Colors.TransparentColor
            anchors.left: label.right
            MouseArea {
                id: closemousearea
                anchors.fill: parent

                onClicked: {
                    console.log("Close tab")
                    root.closeClicked(index)
                }
            }
        }
    }

    background: Rectangle {
        id: backgroundrect
        width: root.width
        height: root.height
        color: {
            if (root.focus) {
                return Colors.TabButtonColorFocused
            } else {
                return Colors.TabButtonColor
            }
        }
    }
}
