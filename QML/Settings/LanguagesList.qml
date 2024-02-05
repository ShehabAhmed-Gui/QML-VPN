import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Rectangle {
  id: langsList
  width: root.minimumWidth
  height: 600
  color: "#000000"

  Rectangle {
    id: topBar
    width: parent.width
    height: 45
    color: "#434343"
    anchors {
      top: parent.top
    }

    Text {
      id: topbarTitle
      text: qsTr("Language")
      color: "#B9B9B9"
      font.pixelSize: 22
      anchors.centerIn: parent
    }

    Image {
      id: backward
      width: 23
      height: 23
      source: "qrc:/assets/icons/left-arrow.png"
      anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 5
      }
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: cursorShape = Qt.PointingHandCursor
        onExited: cursorShape = Qt.ArrowCursor
        onClicked: pageLoader.pop()
      }
    }
  }
  ListModel {
    id: languagesModel
    ListElement {
      language: "English"
      isDefault: false
    }
    ListElement {
      language: "Arabic"
      isDefault: false
    }
  }

  ButtonGroup {
    id: radioBttnsGroup
  }
  Component {
    id: languagesDelegate
    Rectangle {
      id: languageAttrCotnainer
      height: 60
      width: 450
      radius: 4
      color: "#555555"
      anchors {
        horizontalCenter: parent.horizontalCenter
      }

      Text {
        id: languageName
        text: language
        color: "black"
        font.pixelSize: 20
        anchors {
          left: languageAttrCotnainer.left
          leftMargin: 10
          verticalCenter: languageAttrCotnainer.verticalCenter
        }
      }
      RadioButton {
        id: selectLang
        Component.onCompleted: {
          for (var i = 0; i < languagesModel.count; i++) {
            languagesModel.setProperty(i, "isDefault",
                                       "English" === languagesModel.get(
                                         i).language)
          }
        }
        checked: isDefault
        ButtonGroup.group: radioBttnsGroup
        onCheckedChanged: if (selectLang.checked
                              && languageName.text !== SettingsJs.defaultLang) {
                            console.log(
                                  "change Language to " + languageName.text)
                            SettingsJs.defaultLang = languageName.text
                          }
        anchors {
          right: languageAttrCotnainer.right
          verticalCenter: languageAttrCotnainer.verticalCenter
        }
        indicator: Rectangle {
          implicitWidth: 26
          implicitHeight: 26
          color: "transparent"
          x: selectLang.leftPadding
          y: parent.height / 2 - height / 2
          radius: 25
          border.width: 3
          border.color: "#ffffff"

          Rectangle {
            id: indicatorDot
            width: 12
            height: 12
            anchors.centerIn: parent
            radius: 11
            color: "#ffffff"
            visible: selectLang.checked
          }
        }
      }
    }
  }

  ListView {
    id: languagesView
    width: parent.width / 2
    orientation: Qt.Vertical
    spacing: 40
    anchors {
      top: topBar.bottom
      bottom: parent.bottom
      topMargin: 30
      horizontalCenter: topBar.horizontalCenter
    }

    model: languagesModel
    delegate: languagesDelegate
  }
}
