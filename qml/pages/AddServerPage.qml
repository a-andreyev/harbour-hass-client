import QtQuick 2.0
import Sailfish.Silica 1.0
import "../3rdparty" // TODO: move jsonlistmodel to some system api


Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: jsListModel
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Nested Page")
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Item") + " " + model.friendly_name
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: console.log("Clicked " + model.friendly_name)
        }
        VerticalScrollDecorator {}
    }
    JSONListModel {
        id: jsListModel
        source: "http://192.168.0.122:8123/api/states"
        query: "$[*].attributes"
    }
}
