#include "settings.h"

SettingsHandler::SettingsHandler()
    : m_Language ("English")
    , m_launchAtStart (true)
    , settingsPath(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation).value(0) + "/VPN")
{
    loadSettings();
}

SettingsHandler::~SettingsHandler()
{
    saveSettings();
}

QString SettingsHandler::Language() const
{
    return m_Language;
}

void SettingsHandler::setLanguage(const QString &newLanguage)
{
    if (m_Language == newLanguage)
        return;
    m_Language = newLanguage;
}

void SettingsHandler::loadSettings()
{
    QSettings settings(settingsPath  + "/Settings.ini", QSettings::IniFormat);
    bool isAutoLaunchAtStart = settings.value("launch_at_start").toBool();
    setlaunchAtStart(isAutoLaunchAtStart);
}

void SettingsHandler::saveSettings()
{
     QDir dir(settingsPath);
     if(!dir.exists())
         dir.mkdir(settingsPath);
    QSettings settings(settingsPath + "/Settings.ini", QSettings::IniFormat);
     settings.setValue("launch_at_start", m_launchAtStart);
}

bool SettingsHandler::launchAtStart() const
{
    return m_launchAtStart;
}
void SettingsHandler::setlaunchAtStart(bool newLaunchAtStart)
{
    if (m_launchAtStart == newLaunchAtStart)
        return;
    m_launchAtStart = newLaunchAtStart;
    emit launchAtStartChanged();
}
