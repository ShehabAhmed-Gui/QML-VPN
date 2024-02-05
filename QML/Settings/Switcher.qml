import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import CustomComponents

Switch {
  id: switcher
  checked: launchAtStart
  onCheckedChanged: {
    settingsLogic.launchAtStart = checked
  }
  anchors {
    right: parent.right
    bottom: parent.bottom
    bottomMargin: 15
  }
  indicator: Rectangle {
    id: switcherBackground
    implicitWidth: 60
    implicitHeight: 35
    x: switcher.leftPadding
    y: parent.height / 2 - height / 2
    radius: 20
    color: switcher.checked ? "#2C7B31" : "#757575"
    Behavior on color {
      ColorAnimation {
        duration: 100
      }
    }

    Rectangle {
      x: switcher.checked ? (parent.width - 5) - width : 5
      anchors.verticalCenter: parent.verticalCenter
      Behavior on x {
        XAnimator {
          duration: 300
        }
      }
      implicitWidth: 25
      implicitHeight: parent.height - 10
      radius: 25
      color: switcher.checked ? "#D9D9D9" : "#D9D9D9"
      Image {
        id: checkedImage
        width: parent.width - 10
        height: parent.height - 10
        smooth: true
        anchors.centerIn: parent
        opacity: switcher.checked ? 1 : 0
        source: "qrc:/assets/icons/checked.png"
        Behavior on opacity {
          SpringAnimation {
            spring: 2
            damping: 0.4
            property: "opacity"
            duration: 700
          }
        }
      }
      Image {
        id: unCheckedImage
        width: parent.width - 10
        height: parent.height - 10
        smooth: true
        anchors.centerIn: parent
        opacity: switcher.checked ? 0 : 1
        source: "qrc:/assets/icons/close (1).png"
        Behavior on opacity {
          SpringAnimation {
            spring: 2
            damping: 0.4
            duration: 700
          }
        }
      }
    }
  }
}
