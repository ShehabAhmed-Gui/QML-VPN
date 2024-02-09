import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

import "QML/LeftRect"
import "QML/Body"
import "QML/Settings"

Window {
  id: root
  visible: true
  color: "black"
  minimumWidth: 1000
  minimumHeight: 650
  // maximumWidth: 900
  // maximumHeight: 600
  StackView {
    id: pageLoader
    anchors.fill: parent
    initialItem: background
  }
  Loader {
    id: pagesDynamicLoader
    anchors.fill: parent
  }
  Item {
    id: background
    width: parent.width
    height: parent.height

    Body {
      id: body
    }

    LeftRect {
      id: leftRect
    }
  }
}
