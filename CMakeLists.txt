cmake_minimum_required(VERSION 3.16)

project(VPN VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS
    Quick
    Core
    Widgets
)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(VPN
    main.cpp
)
set(QML
    Main.qml
    QML/LeftRect/LeftRect.qml
    QML/LeftRect/Left_Sub_Buttom.qml
    QML/LeftRect/Buttons.qml

    QML/Body/Body.qml
    QML/Body/StartButton.qml
    QML/Body/ServerSelectingButton.qml

    QML/Settings/Settings.qml
    QML/Settings/SettingsTopBar.qml
    QML/Settings/Switcher.qml
    QML/Settings/RightArrow.qml
    QML/Settings/LanguagesList.qml

    QML/InfoPages/About.qml
)
set(headers
     src/useravatar/useravatar.h
     src/settings/settings.h
     src/networking/networking.h
)
set(sources
     src/useravatar/useravatar.cpp
     src/settings/settings.cpp
     src/networking/networking.cpp
)
set(JS
    QML/InfoPages/JS/AboutLetter.js
)
qt_add_qml_module(VPN
    URI VPN
    VERSION 1.0
    QML_FILES   ${QML} ${JS}
    SOURCES ${sources} ${headers}
    RESOURCES resources/resources.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(VPN PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app VPN
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
target_link_libraries(VPN
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
    PRIVATE Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS VPN
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
