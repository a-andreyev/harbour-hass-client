import QtQuick 2.0
import Sailfish.Silica 1.0
import "../3rdparty" // TODO: move jsonlistmodel to some system api

import QtWebSockets 1.0


Page {
    allowedOrientations: Orientation.All

    id: page

    onStatusChanged: {
        if (status === PageStatus.Active && pageStack.depth === 1) {
            pageStack.pushAttached("AboutPage.qml", {});
        }
    }

    JSONListModel {
        id: statesModel
        source: "http://"+appRoot.host_socket+"/api/states"
        query: "$[]"
    }
    /*
    JSONListModel {
        id: viewsModel
        source: "http://"+appRoot.host_socket+"/api/states"
        query: "$[?(@.entity_id=~/group.*?/i)]"
    }
    JSONListModel {
        id: notViewsModel
        source: "http://"+appRoot.host_socket+"/api/states"
        query: "$[?(@.entity_id!=~ /group.*?/i)]"
    }
    */
    WebSocket {
        id: wsClient
        property string subsribeCommand: '{"id":1,"type":"subscribe_events","event_type": "state_changed"}'
        url: "ws://"+appRoot.host_socket+"/api/websocket"
        active: true
        onStatusChanged: {
            // console.log(status)
            if (wsClient.status==1) {
                sendTextMessage(subsribeCommand)
            }
        }
        onTextMessageReceived: {
            //console.log(message)
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge
        // Why is this necessary?
        contentWidth: parent.width

        VerticalScrollDecorator {}
        PullDownMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("ServersPage.qml"))
            }
            /*
            MenuItem {
                text: qsTr("History")
                //onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
            MenuItem {
                text: qsTr("LogBook")
                //onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
            MenuItem {
                text: qsTr("Map")
                //onClicked: pageStack.push(Qt.resolvedUrl("StatesPage.qml"))
            }
            */
        }

        Column {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader {
                title: qsTr("States")
            }
            /*
            SectionHeader {
                text: qsTr("Groups")
            }
            ExpandingSectionGroup {
                currentIndex: 0
                Repeater {
                    model: statesModel
                    ExpandingSection {
                        visible: utils.startsWith(entity_id,"group")
                        id: section
                        title: attributes.friendly_name?attributes.friendly_name:entity_id
                    }
                }
            }
            SectionHeader {
                text: qsTr("Ungrouped")
            }
            */
            Repeater {
                id: repeater
                signal message(string msg)
                model: statesModel
                Loader {
                    x: Theme.paddingLarge
                    width: parent.width - 2*x
                    source: {
                        if (entity_id) {
                            // if (utils.startsWith(entity_id,"sun"))
                            //    return "components/Sun.qml"
                            //if (utils.startsWith(entity_id,"group"))
                            //    return "components/Group.qml"
                            if (utils.startsWith(entity_id,"camera"))
                                return "components/Camera.qml"
                            if (utils.startsWith(entity_id,"switch"))
                                return "components/Switch.qml"
                            if (utils.startsWith(entity_id,"light"))
                                return "components/Light.qml"
                            if (utils.startsWith(entity_id,"sensor"))
                                return "components/Sensor.qml"
                            if (utils.startsWith(entity_id,"media_player"))
                                return "components/MediaPlayer.qml"
                        }
                        else {
                            ""
                        }
                    }
                }
            }
        }
    }
    Utils {
        id: utils
    }
}
