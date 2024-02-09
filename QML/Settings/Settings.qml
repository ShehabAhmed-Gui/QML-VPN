import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import CustomComponents

Rectangle {
  id: settings
  property bool launchAtStart: SettingsManager.launchAtStart
  color: "#000000"
  width: root.minimumWidth
  height: 600

  SettingsTopBar {
    id: settingsHeader
    title: "Settings"
  }
  Rectangle {
    id: settingsTopRect
    width: 400
    height: 145

    color: "#D9D9D9"
    anchors {
      horizontalCenter: settingsHeader.horizontalCenter
      top: settingsHeader.top
      topMargin: settingsHeader.height * 2
    }

    Text {
      id: language
      text: qsTr("Language")
      font.pixelSize: 20
      anchors {
        top: parent.top
        topMargin: 15
        left: parent.left
        leftMargin: 25
      }
    }

    Text {
      id: selectedLanguage
      text: qsTr("English")
      font.pixelSize: 20
      color: "#000000"
      opacity: .25
      anchors {
        right: language.left
        left: language.right
        leftMargin: 175
        verticalCenter: language.verticalCenter
      }
    }

    RightArrow {
      id: openLanguagesList
      width: 21
      height: 21
      opacity: .30
      anchors.verticalCenter: selectedLanguage.verticalCenter
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: pageLoader.push("../../QML/Settings/LanguagesList.qml")
        onEntered: cursorShape = Qt.PointingHandCursor
        onExited: cursorShape = Qt.ArrowCursor
      }
    }

    Text {
      id: launchOnStart
      text: qsTr("Launch at startup")
      font.pixelSize: 20
      anchors {
        left: language.left
        bottom: parent.bottom
        bottomMargin: 20
      }
    }
    Switcher {}
  }
  Rectangle {
    id: appInfoRect
    width: settingsTopRect.width
    height: 180
    color: settingsTopRect.color
    anchors {
      top: settingsTopRect.bottom
      horizontalCenter: settingsTopRect.horizontalCenter
      topMargin: 40
    }

    Text {
      id: terms
      text: qsTr("Terms of Service")
      font.pixelSize: 20
      anchors {
        left: parent.left
        top: parent.top
        topMargin: 15
        leftMargin: 25
      }
    }
    RightArrow {
      id: openTerms
      anchors.verticalCenter: terms.verticalCenter
    }

    Text {
      id: privacyPolicy
      text: qsTr("Privacy Police")
      font.pixelSize: 20
      anchors {
        top: terms.bottom
        left: parent.left
        topMargin: 40
        leftMargin: 25
      }
    }
    RightArrow {
      id: openPrivacy
      anchors.verticalCenter: privacyPolicy.verticalCenter
    }

    Text {
      id: about
      text: qsTr("About")
      font.pixelSize: 20
      anchors {
        top: openPrivacy.bottom
        topMargin: 40
        left: parent.left
        leftMargin: 25
      }
    }
    RightArrow {
      id: openAbout
      anchors.verticalCenter: about.verticalCenter
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: pagesDynamicLoader.source = "QML/InfoPages/About.qml"
        onEntered: cursorShape = Qt.PointingHandCursor
        onExited: cursorShape = Qt.ArrowCursor
      }
    }
  }
}
