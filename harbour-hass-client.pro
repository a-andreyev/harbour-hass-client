# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-hass-client

CONFIG += sailfishapp

QT += websockets

SOURCES += src/harbour-hass-client.cpp

OTHER_FILES += qml/harbour-hass-client.qml \
    qml/cover/CoverPage.qml \
    qml/3rdparty/JSONListModel.qml \
    qml/3rdparty/jsonpath.js \
    rpm/harbour-hass-client.changes.in \
    rpm/harbour-hass-client.spec \
    rpm/harbour-hass-client.yaml \
    translations/*.ts \
    harbour-hass-client.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-hass-client-ru.ts

DISTFILES += \
    qml/pages/ServersPage.qml \
    qml/pages/AddServerPage.qml \
    qml/pages/StatesPage.qml \
    qml/resources/lightbulb.svg \
    qml/resources/temphumi.svg \
    qml/resources/switch.svg \
    qml/resources/aa13q.jpeg \
    qml/resources/le_me.jpeg \
    qml/resources/flattr.svg \
    qml/resources/git.svg \
    qml/resources/paypal.svg \
    qml/resources/rocketbank.svg \
    qml/pages/components/Sensor.qml \
    qml/pages/components/Camera.qml \
    qml/pages/components/Light.qml \
    qml/pages/components/Group.qml \
    qml/pages/components/MediaPlayer.qml \
    qml/3rdparty/Utils.qml \
    qml/resources/home-assistant-logo.png \
    qml/pages/AboutPage.qml \
    qml/pages/components/IconTextButton.qml \
    qml/pages/components/Switch.qml
