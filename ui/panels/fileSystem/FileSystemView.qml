import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.12
import QtQml 2.12
import FileSystemModel 1.0

import "../../UiKit/colors.js" as Colors

Item {
    id: root

    implicitWidth: 300

    signal openFile(string path)

    function setRootIndex(ind) {
        listview.rootIndex = ind
    }

    Rectangle {
        id: filesRect

        anchors.fill: parent

        color: Colors.MainColor

        TreeView {
            id: listview

            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;

            alternatingRowColors: false
            backgroundVisible: false
            headerVisible: false

            TableViewColumn {
                title: "file"
                role: "fileName"
                width: filesRect.width
            }

            model: fileSystemModel
            rootIndex: rootPathIndex

//            itemDelegate:  FileSystemPanel {
//                id: fileSystemPanel
//                name: styleData.value
//                isFolder: fileSystemModel.isDirectory()
//                levelNum: 0
//                onAdd_new: function() {
//                    console.log("folder pressed")
//                }
//            }

            rowDelegate: Rectangle {
                color: filesRect.color
            }

            onActivated : function(index) {
                var url = fileSystemModel.rootPath + "/"
                        + fileSystemModel.data(index, FileSystemModel.UrlStringRole)
                if (fileSystemModel.isDirectory(index)) {
                    if (isExpanded(index)) {
                        collapse(index)
                    } else {
                        expand(index)
                    }
                } else {
                    openFile(url)
                }
            }
        }
    }
}
