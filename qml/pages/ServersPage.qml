import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        /*
        PullDownMenu {

            MenuItem {
                text: qsTr("History")
                onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
            MenuItem {
                text: qsTr("LogBook")
                onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
            MenuItem {
                text: qsTr("Map")
                onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }

            MenuItem {
                text: qsTr("States")
                onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
        }
        */

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Settings")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Host Socket")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            TextField {
                anchors { left: parent.left; right: parent.right }
                focus: true; label: "Host Socket";
                text: appRoot.host_socket
                placeholderText: "for example: 192.168.0.1:8123"
                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                onTextChanged: {
                    var hostSocket = text.replace(/^https?\:\/\//i, "").replace(/\/$/, "");;
                    if (appRoot.host_socket!==hostSocket) {
                        appRoot.host_socket = hostSocket
                    }
                }
            }
        }
    }
}

