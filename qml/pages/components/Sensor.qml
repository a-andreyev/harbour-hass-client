import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    width: parent.width
    IconTextSwitch {
        checked: true
        icon.fillMode: Image.PreserveAspectFit
        icon.source: "../../resources/temphumi.svg"
        icon.width: Theme.itemSizeExtraSmall
        icon.height: Theme.itemSizeExtraSmall
        text: attributes.friendly_name
        onCheckedChanged: {
            checked = true
        }
    }
    Label {
        id: label
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: Theme.fontFamilyHeading
        text: model.state + attributes.unit_of_measurement
    }
    Connections {
        target: wsClient
        onTextMessageReceived: {
            var objectArray = JSON.parse(message);
            if (objectArray) {
                if (objectArray.event) {
                    if (objectArray.event.data) {
                        if (objectArray.event.data.entity_id) {
                            if (objectArray.event.data.entity_id===entity_id) {
                                label.text = objectArray.event.data.new_state.state + attributes.unit_of_measurement
                            }
                        }
                    }
                }
            }
        }
    }
}
