import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.12

import "../../UiKit/colors.js" as Colors

TabButton {
    id: root

    property int index
    property int activeIndex
    property bool containMouse: tabmousearea.containsMouse || closemousearea.containsMouse
    property bool isActiveTab: index === activeIndex
    signal closeClicked(int idx)
    signal buttonClicked(int idx)

    width: contentitem.contWidth
    rightPadding: 3

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
            height: label.height
            color: Colors.TransparentColor
            anchors.left: label.right
            anchors.margins: 0
            Rectangle {
                id: circle
                width: parent.width - 8
                height: circle.width
                anchors.centerIn: parent
                color: closemousearea.containsMouse
                           ? isActiveTab
                                  ? Colors.TabButtonActiveCloseColorFocused
                                  : Colors.TabButtonNotActiveCloseColorFocused
                           : Colors.TransparentColor
                radius: circle.width / 2
                Image {
                    id: imageClose
                    source: "/icons/ui/icons/cross.svg"
                    width: parent.width
                    height: parent.height
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                id: closemousearea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
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
            if (isActiveTab) {
                return Colors.TabButtonColorPressed
            } else {
                if (containMouse) {
                    return Colors.TabButtonColorFocused
                } else {
                    return Colors.TabButtonColor
                }
            }
        }
        MouseArea {
            id: tabmousearea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                buttonClicked(root.index)
            }
        }
    }
}
