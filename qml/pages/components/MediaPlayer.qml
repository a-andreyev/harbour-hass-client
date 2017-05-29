import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../3rdparty"

Column {
    width: parent.width
    IconTextSwitch {
        id: textSwitch
        icon.source: "image://theme/icon-m-" + (checked? "pause" : "play")
        text: attributes.friendly_name
        onPressed: {
            busy = true
            var service_command = checked?"media_pause":"media_play"
            console.log(service_command)
            utils.sendPost("http://"+host_socket+"/api/services/media_player/"+service_command,'{"entity_id":"'+entity_id+'"}')
        }
        checked: model.state==="playing"
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: Theme.fontFamilyHeading
        text: attributes.media_title
        width: parent.width// Math.min(page.width - 2*Theme.horizontalPageMargin, implicitWidth*0.9)
        horizontalAlignment: Text.AlignLeft
        truncationMode: TruncationMode.Elide
        color: Theme.secondaryHighlightColor
    }
    ProgressBar {
        visible: attributes.media_position?true:false
        id: progressBar
        width: parent.width
        maximumValue: attributes.media_duration
        value: attributes.media_position?attributes.media_position:0
    }

    Image {
        id: picture
        width: parent.width
        //height: width
        fillMode: Image.PreserveAspectFit
        source: "http://"+host_socket+attributes.entity_picture
        MouseArea {
            anchors.fill: parent
            onClicked: {
                picture.update() // TODO: get new Link
            }
        }
    }

    //////

    Connections {
        target: wsClient
        onTextMessageReceived: {
            var objectArray = JSON.parse(message);
            if (objectArray) {
                if (objectArray.event) {
                    if (objectArray.event.data) {
                        if (objectArray.event.data.entity_id) {
                            if (objectArray.event.data.entity_id===entity_id) {
                                if (objectArray.event.data.new_state) {
                                    if (objectArray.event.data.new_state.state) {
                                        var isChecked = (objectArray.event.data.new_state.state==="playing")
                                        textSwitch.checked = isChecked
                                        console.log(isChecked)
                                        textSwitch.busy = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Connections {
        target: utils
        onPostReady: {
            var objectArray = JSON.parse(responseText);
            if (objectArray.state) {
                var isChecked = (objectArray.state==="playing")
                console.log(isChecked)
                textSwitch.checked = isChecked
                textSwitch.busy = false
            }
        }
    }
    Utils {
        id: utils
    }
}
