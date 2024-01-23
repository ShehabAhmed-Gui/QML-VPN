import QtQuick
import QtQuick.Controls
import CustomComponents

Rectangle {
  id: controls
  width: parent.width
  height: 80
  radius: 25
  // border.width: 1
  // border.color: "#676767"
  color: Qt.color("#162527").lighter(.7)

  anchors {
    bottom: parent.bottom
    left: parent.left
    right: parent.right
    margins: 7
  }
  UserAvatar {
    id: circleUserAvatar
    width: 70
    height: 54
    clip: true
    anchors {
      verticalCenter: parent.verticalCenter
      left: parent.left
      leftMargin: 10
    }
    Text {
      id: showText
      visible: false
      text: "Select image"
      font.pixelSize: 12
      elide: Text.ElideMiddle
      width: parent.width
      anchors.centerIn: parent
      color: "white"
    }
    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onClicked: circleUserAvatar.changeImage()

      onEntered: showText.visible = true
      onExited: showText.visible = false
    }
  }

  Text {
    id: userName
    text: qsTr("Guest")
    anchors {
      top: circleUserAvatar.top
      topMargin: 3
      left: circleUserAvatar.right
      leftMargin: 5
    }
    color: "#ffffff"
    font.pixelSize: 18
  }

  Text {
    id: userSub
    text: qsTr("free trial end")
    font.pointSize: 11
    anchors {
      top: userName.bottom
      topMargin: 2
      left: circleUserAvatar.right
      bottom: circleUserAvatar.bottom
    }
    color: "#ffffff"
  }

  Image {
    id: settingsIcon
    width: 29
    height: 29
    anchors {
      verticalCenter: parent.verticalCenter
      right: parent.right
      rightMargin: 10
    }
    source: "qrc:/assets/icons/settings.png"
  }
  MouseArea {
    anchors.fill: parent

    onClicked: pageLoader.push("../../QML/Settings/Settings.qml")
  }
}
