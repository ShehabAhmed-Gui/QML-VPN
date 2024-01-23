import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import "../LeftRect"

Rectangle {
  id: body

  width: parent.width
  color: "#000000"
  anchors {
    left: leftRect.right
    right: parent.right
    top: parent.top
    bottom: parent.bottom
  }

  StartButton {
    id: circleButton
  }

  Text {
    id: pingRate
    visible: false
    text: "15MS"
    anchors {
      centerIn: parent
    }
    font.pixelSize: 25
    color: "green"
  }

  ServerSelectingButton {
    id: serverSelecting
    anchors {
      top: circleButton.bottom
      topMargin: 25
      horizontalCenter: circleButton.horizontalCenter
    }
  }
}
