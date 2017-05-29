import QtQuick 2.1
import Sailfish.Silica 1.0
import "components"

Page {
    SilicaFlickable {
        contentHeight: column.height+Theme.paddingLarge
        anchors.fill: parent

        VerticalScrollDecorator {}

        Column {
            spacing: Theme.paddingLarge
            id: column
            width: parent.width
            PageHeader {
                title: qsTr("About")
                id: header
            }
            SectionHeader {
                text: qsTr("Licence information")
            }
            Label {
                textFormat: Text.StyledText
                font.pixelSize: Theme.fontSizeSmall
                horizontalAlignment: Text.AlignJustify
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("This application is made by Alexey Andreyev.
                    Application cover is based on the
                    Home Assistant logos
                    in purchased Pixeluvo application.
                    Pixeluvo is developed by Pictopotamus Ltd.
                    This application is developed with Sailfish IDE
                    in GNU/Linux/Archlinux/KDE operating system.
                    Licence: GPLv3.")
            }
            SectionHeader {
                text: qsTr("Donate")
            }
            IconTextButton {
                text: "Paypal: paypal.me/aa13q"
                iconSource: "../../resources/paypal.svg"
                onClicked: {
                    Qt.openUrlExternally("https://paypal.me/aa13q");
                }
            }

            IconTextButton {
                text: "Flattr: flattr.com/profile/aa13q"
                iconSource: "../../resources/flattr.svg"
                onClicked: {
                    Qt.openUrlExternally("https://flattr.com/profile/aa13q");
                }
            }

            IconTextButton {
                text: qsTr("Rocketbank")+": rocketbank.ru/aa13q-alexey-andreyev"
                iconSource: "../../resources/rocketbank.svg"
                onClicked: {
                    Qt.openUrlExternally("https://rocketbank.ru/aa13q-alexey-andreyev");
                }
            }

            SectionHeader {
                text: qsTr("Sources")
            }
            IconTextButton {
                text: "Guthub: github.com/a-andreyev/harbour-hass-client"
                iconSource: "../../resources/git.svg"
                onClicked: {
                    Qt.openUrlExternally("https://github.com/a-andreyev/harbour-hass-client");
                }
            }

            SectionHeader {
                text: qsTr("Contacts")
            }
            Label {
                font.pixelSize: Theme.fontSizeMedium
                horizontalAlignment: Text.AlignJustify
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("My name is Alexey Andreyev. I'm PhD student from Saint Petersburg, Russia. Donations are welcome.")
            }
            IconTextButton {
                text: qsTr("My website")+": aa13q.ru"
                iconSource: "../../resources/aa13q.jpeg"
                onClicked: {
                    Qt.openUrlExternally("http://aa13q.ru/");
                }
            }
            Image {
                source: "../resources/le_me.jpeg"
                fillMode: Image.PreserveAspectFit
                anchors {
                            left: parent.left
                            right: parent.right
                            margins: Theme.paddingLarge
                        }
                height: width
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
        }
    }
}
