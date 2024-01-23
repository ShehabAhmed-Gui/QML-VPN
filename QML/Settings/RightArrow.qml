import QtQuick
import QtQuick.Controls
Image
{
  width: 21
  height: 21
  opacity: .25
  source: "qrc:/assets/icons/right-arrow.png"
  anchors
  {
    right: parent.right
    rightMargin: 5
  }
  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: cursorShape = Qt.PointingHandCursor
    onExited: cursorShape = Qt.ArrowCursor
  }
}
