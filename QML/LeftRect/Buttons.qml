import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button {
  required property string buttonText
  property string textColor: "#00000"
  property string backgroundColor: "#ffffff"
  property string imageSource: ""

  display: AbstractButton.TextBesideIcon
  Image {
    width: 33
    height: 33
    anchors {
      right: parent.left
      rightMargin: 5
    }
    source: (imageSource.length > 0) ? imageSource : ""
  }
  contentItem: Text {
    text: buttonText
    color: textColor
    font.pixelSize: 16
  }
  background: Rectangle {
    id: background
    color: backgroundColor
  }
}
