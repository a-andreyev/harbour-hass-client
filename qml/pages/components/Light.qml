import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../3rdparty"

Column {
    width: parent.width
    IconTextSwitch {
        id: textSwitch
        icon.fillMode: Image.PreserveAspectFit
        icon.source: "../../resources/lightbulb.svg"
        text: attributes.friendly_name
        onPressed: {
            busy = true
            var service_command = checked?"turn_off":"turn_on"
            console.log(service_command)
            utils.sendPost("http://"+host_socket+"/api/services/light/"+service_command,'{"entity_id":"'+entity_id+'"}')
        }
        checked: model.state==="on"
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
                                if (objectArray.event.data.new_state.state) {
                                    var isChecked = (objectArray.event.data.new_state.state==="on")
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
    Connections {
        target: utils
        onPostReady: {
            var objectArray = JSON.parse(responseText);
            if (objectArray.state) {
                var isChecked = (objectArray.state==="on")
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
