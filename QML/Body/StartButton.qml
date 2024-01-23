import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Rectangle {
  id: circleDraw
  state: "unhovered"

  width: 200
  height: 200
  radius: 250
  color: "#000000"
  border.width: 2
  border.color: "red"
  anchors.centerIn: parent
  FontLoader {
    id: buttonCustomFont

    source: "qrc:/assets/fonts/Oswald-ExtraLight.ttf"
  }
  Button {
    id: onOffBtn
    anchors.centerIn: parent
    contentItem: Text {
      text: "GO"
      color: "white"
      font.family: buttonCustomFont.name
      font.pixelSize: 45
    }
    background: Rectangle {
      color: "transparent"
    }
  }

  MouseArea {
    hoverEnabled: true
    anchors.fill: parent

    onEntered: {
      circleDraw.state = "hovered"
      cursorShape = Qt.PointingHandCursor
    }
    onExited: {
      circleDraw.state = "unhovered"
      cursorShape = Qt.ArrowCursor
    }
  }

  transitions: [
    Transition {
      from: "unhovered"
      to: "hovered"

      ColorAnimation {
        target: circleDraw
        property: "border.color"
        from: "red"
        to: "green"
        duration: 750
      }
    },
    Transition {
      from: "hovered"
      to: "unhovered"

      ColorAnimation {
        target: circleDraw
        property: "border.color"
        from: "green"
        to: "red"
        duration: 750
      }
    }
  ]
}
