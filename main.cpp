#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/useravatar/useravatar.h"
#include "src/settings/settings.h"
#include "src/networking/networking.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    SettingsHandler SettingsManager;
    NetworkingManager NetworkManager;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
        qmlRegisterType<UserAvatar>("CustomComponents", 1, 0, "UserAvatar");
        engine.rootContext()->setContextProperty("SettingsManager", &SettingsManager);
        engine.rootContext()->setContextProperty("NetworkManager", &NetworkManager);
    engine.loadFromModule("VPN", "Main");

    return app.exec();
}
