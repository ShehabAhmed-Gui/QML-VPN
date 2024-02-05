#ifndef SETTINGSHANDLER
#define SETTINGSHANDLER
#include <QObject>
#include <QUrl>
#include <QString>
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QIODevice>
#include <QTextStream>
#include <QStandardPaths>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlProperty>
class SettingsHandler : public QObject
{
    Q_OBJECT
public:
    SettingsHandler();
    ~SettingsHandler();
public:
    Q_PROPERTY(QString Language READ Language WRITE setLanguage NOTIFY LanguageChanged FINAL)
    Q_PROPERTY(bool launchAtStart READ launchAtStart WRITE setlaunchAtStart NOTIFY launchAtStartChanged FINAL)
    QString Language() const;
    void setLanguage(const QString &newLanguage);

    Q_INVOKABLE void loadSettings();
    Q_INVOKABLE void saveSettings();

    bool launchAtStart() const;
    void setlaunchAtStart(bool newLaunchAtStart);

signals:
    void LanguageChanged();
    void launchAtStartChanged();

private:
    QString m_Language;
    QString settingsPath;
    bool m_launchAtStart;
};

#endif // SETTINGSHANDLER
