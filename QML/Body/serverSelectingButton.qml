import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Rectangle {
  width: 255
  height: 55
  color: "white"
  radius: 50

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: cursorShape = Qt.PointingHandCursor
    onExited: cursorShape = Qt.ArrowCursor
  }
  Image {
    id: countryFlag
    width: 35
    height: 35

    anchors {
      left: parent.left
      leftMargin: 7
      verticalCenter: parent.verticalCenter
    }
    source: "qrc:/assets/icons/egypt.png"
  }

  Text {
    id: countryName
    text: "Egypt"
    anchors {
      centerIn: parent
    }
    font.pixelSize: 17
  }

  Image {
    id: idleArrow
    width: 23
    height: 23
    anchors {
      right: parent.right
      rightMargin: 5
      verticalCenter: parent.verticalCenter
    }
    source: "qrc:/assets/icons/right-arrow.png"
  }
}
