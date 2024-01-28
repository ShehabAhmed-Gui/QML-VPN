import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import "./JS/Settings.js" as SettingsJs

Rectangle {
  id: settings
  color: "#000000"
  width: root.minimumWidth
  height: 600

  Rectangle {
    id: topBar
    color: "#340D0D"
    width: parent.width
    height: 45

    anchors {
      top: parent.top
    }

    Text {
      text: "Settings"
      color: "#B4A8A8"
      anchors.centerIn: parent
      font.pixelSize: 20
    }
    Image {
      id: backward

      width: 24
      height: 24
      source: "qrc:/assets/icons/left-arrow.png"
      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        leftMargin: 5
      }
      MouseArea {

        anchors.fill: parent
        hoverEnabled: true
        onClicked: pageLoader.pop()
        onEntered: cursorShape = Qt.PointingHandCursor
        onExited: cursorShape = Qt.ArrowCursor
      }
    }

    Rectangle {
      id: settingsTopRect
      width: 400
      height: 145

      color: "#D9D9D9"
      anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: parent.height * 2
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
        text: qsTr(SettingsJs.defaultLang)
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
      Switch {
        id: switcher
        anchors {
          right: parent.right
          bottom: parent.bottom
          bottomMargin: 15
        }
        indicator: Rectangle {
          implicitWidth: 60
          implicitHeight: 26
          x: switcher.leftPadding
          y: parent.height / 2 - height / 2
          radius: 13
          color: switcher.checked ? "#1F602F" : "#3B4141"
          border.color: "#022B2B"
          border.width: 1

          Rectangle {
            x: switcher.checked ? parent.width - width : 0
            width: 30
            height: 26
            radius: 13
            color: switcher.checked ? "#D9D9D9" : "#D9D9D9"
          }
        }
      }
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
      }
    }
  }
}
