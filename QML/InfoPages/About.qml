import QtQuick
import QtQuick.Controls
import "../Settings"
import "JS/AboutLetter.js" as AboutLetter

Rectangle {
  color: "#000000"
  anchors {
    top: parent.top
    horizontalCenter: parent.horizontalCenter
  }
  FontLoader {
    id: aboutFont

    source: "qrc:/assets/fonts/RobotoMono-Regular.ttf"
  }
  SettingsTopBar {
    id: aboutHeader
    title: "About"
    headerColor: "#122620"
  }
  Text {
    id: about
    text: AboutLetter.getAboutLetter()
    font.family: aboutFont.name
    font.pixelSize: 14
    font.letterSpacing: 0
    color: "#cacccf"
    linkColor: "#D1B000"
    anchors {
      horizontalCenter: aboutHeader.horizontalCenter
      top: aboutHeader.top
      topMargin: 60
    }
    onLinkActivated: link => NetworkManager.openLink(link)
  }
}
