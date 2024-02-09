import QtQuick

Rectangle {
  property string title: "Settings"
  property color headerColor: "#0C2D48"
  id: topBar
  color: headerColor
  width: parent.width
  height: 45
  anchors {
    top: parent.top
  }

  Text {
    text: title
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
      onClicked: title === "Settings" ? pageLoader.pop(
                                          ) : pagesDynamicLoader.source = ""
      onEntered: cursorShape = Qt.PointingHandCursor
      onExited: cursorShape = Qt.ArrowCursor
    }
  }
}
