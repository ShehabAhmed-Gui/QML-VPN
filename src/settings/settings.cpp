#include "settings.h"

SettingsHandler::SettingsHandler()
    : m_language ("English")
    , m_launchAtStart (true)
    , settingsPath(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation).value(0) + "/VPN")
{
    loadSettings();
}

SettingsHandler::~SettingsHandler()
{
    saveSettings();
}

QString SettingsHandler::language() const
{
    return m_language;
}

void SettingsHandler::setlanguage(const QString &newLanguage)
{
    if (m_language == newLanguage)
        return;
    m_language = newLanguage;
    emit languageChanged();
}

void SettingsHandler::loadSettings()
{
    QSettings settings(settingsPath  + "/Settings.ini", QSettings::IniFormat);
    const bool isAutoLaunchAtStart = settings.value("launch_at_start").toBool();
    const QString language = settings.value("application_language").toString();
    setlanguage(language);
    setlaunchAtStart(isAutoLaunchAtStart);
}

void SettingsHandler::saveSettings()
{

     QDir dir(settingsPath);
     if(!dir.exists())
         dir.mkdir(settingsPath);
      QSettings settings(settingsPath + "/Settings.ini", QSettings::IniFormat);
     settings.setValue("launch_at_start", m_launchAtStart);
      settings.setValue("application_language", m_language);
     settings.sync();
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
