import QtQuick 2.0
import Sailfish.Silica 1.0

/*
Button {
    // readOnly: true
    text: attributes.friendly_name
}
*/
ExpandingSectionGroup {
    width: parent.width
    height: Theme.paddingLarge
    ExpandingSection {
        id: section
        title: attributes.friendly_name
    }
    /*
    //currentIndex: 0
    Repeater {
        model: viewsModel

    }
    */
}

/*

ExpandingSection {
    id: section
    title: attributes.friendly_name
}
*/

/*
SectionHeader {
    text: qsTr("Groups")
}
*/
/*
SectionHeader {
    text: qsTr("All states")
}
*/
