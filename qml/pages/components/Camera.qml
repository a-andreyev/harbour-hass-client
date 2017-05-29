import QtQuick 2.0
import Sailfish.Silica 1.0


Column {
    width: parent.width
    IconTextSwitch {
            icon.source: "image://theme/icon-m-video"
            text: attributes.friendly_name
            checked: true
            onCheckedChanged: {
                checked = true
            }
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
    Connections {
        target: wsClient
        onTextMessageReceived: {
            var objectArray = JSON.parse(message);
            if (objectArray) {
                if (objectArray.event) {
                    if (objectArray.event.data) {
                        if (objectArray.event.data.entity_id===entity_id) {
                            console.log("http://"+host_socket+objectArray.event.data.new_state.attributes.entity_picture)
                            picture.source = "http://"+host_socket+objectArray.event.data.new_state.attributes.entity_picture
                        }
                    }
                }
            }
        }
    }
}
/*
            var objectArray = JSON.parse(message);
            console.log(objectArray)
            if (objectArray.type==='event') {
                if (objectArray.event.event_type==='state_changed') {
                    if (objectArray.event.data.entity_id==='state_changed') {

                    }
                }
            }
  */


/*
ExpandingSectionGroup {
    currentIndex: 0
    Repeater {
        model: statesModel
        ExpandingSection {
            visible: Utils.startsWith(entity_id,"group")
            id: section
            title: attributes.friendly_name
        }
    }
}
*/
