#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/useravatar/useravatar.h"
#include "src/settings/settings.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
        qmlRegisterType<UserAvatar>("CustomComponents", 1, 0, "UserAvatar");
        qmlRegisterType<SettingsHandler>("CustomComponents", 1, 0, "SettingsLogic");
    engine.loadFromModule("VPN", "Main");

    return app.exec();
}
