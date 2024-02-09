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
class SettingsHandler : public QObject
{
    Q_OBJECT
public:
    SettingsHandler();
    ~SettingsHandler();
public:
    Q_PROPERTY(QString language READ language WRITE setlanguage NOTIFY languageChanged FINAL)
    Q_PROPERTY(bool launchAtStart READ launchAtStart WRITE setlaunchAtStart NOTIFY launchAtStartChanged FINAL)
    QString language() const;
    void setlanguage(const QString &newLanguage);

    Q_INVOKABLE void loadSettings();
    Q_INVOKABLE void saveSettings();

    bool launchAtStart() const;
    void setlaunchAtStart(bool newLaunchAtStart);

signals:
    void languageChanged();
    void launchAtStartChanged();

private:
    QString m_language;
    QString settingsPath;
    bool m_launchAtStart;
};

#endif // SETTINGSHANDLER
