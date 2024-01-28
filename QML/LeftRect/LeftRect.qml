import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQml.Models
import CustomComponents

Rectangle {
  id: leftRect
  color: "#000000"
  width: 240
  height: parent.height
  border.width: 1
  radius: 11
  border.color: "#676767"
  opacity: .8
  anchors {
    left: parent.left
    top: parent.top
    bottom: parent.bottom
  }

  Button {
    id: loginButton
    width: 80
    height: 30

    contentItem: Text {
      text: qsTr("Login")
      color: "#ffffff"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }
    background: Rectangle {
      color: "#5D5D5F"
    }
    anchors {
      top: parent.top
      left: parent.left
      topMargin: 25
      leftMargin: 25
    }
  }

  Button {
    id: signInButton
    width: 80
    height: 30
    contentItem: Text {
      text: qsTr("Signin")
      color: "#ffffff"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }
    background: Rectangle {
      color: "#5D5D5F"
    }
    anchors {
      top: parent.top
      left: loginButton.right
      topMargin: 25
      leftMargin: 10
    }
  }

  Buttons {
    id: homeButton
    buttonText: "Home"
    textColor: "red"
    imageSource: "qrc:/assets/icons/home.png"

    backgroundColor: "transparent"
    anchors {
      left: parent.left
      top: loginButton.bottom
      leftMargin: 50
      topMargin: 50
    }
    MouseArea {
      id: homeBtnMouseArea

      anchors.fill: parent

      onClicked: console.info("Home Button Was Clicked!")
    }
  }

  Buttons {
    id: settingsButton
    buttonText: "Settings"
    textColor: "red"
    imageSource: "qrc:/assets/icons/settings.png"
    backgroundColor: "transparent"
    anchors {
      left: parent.left
      top: homeButton.bottom
      leftMargin: 50
      topMargin: 30
    }
    MouseArea {
      id: settingsBtnMouseArea

      anchors.fill: parent
      onClicked: pageLoader.push("../../QML/Settings/Settings.qml")
    }
  }

  Image {
    id: customerServiceIcon
    source: "qrc:/assets/icons/customer-service.png"
    // ToolTip.delay: -1
    // ToolTip.text: "Customer Service"
    // ToolTip.visible: true
    anchors {
      bottom: leftSubBottom.top
      horizontalCenter: parent.horizontalCenter
    }
    MouseArea {
      id: customerServiceMouseArea
      anchors.fill: parent
      hoverEnabled: true

      onEntered: {
        customerServiceIcon.source = "qrc:/assets/icons/customer-service-on-hoveres.png"
        cursorShape = Qt.PointingHandCursor
      }
      onExited: customerServiceIcon.source = "qrc:/assets/icons/customer-service.png"
    }
  }
  Left_Sub_Buttom {
    id: leftSubBottom
  }
}
