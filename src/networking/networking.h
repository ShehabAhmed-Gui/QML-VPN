#ifndef NETWORKINGMANAGER_H
#define NETWORKINGMANAGER_H

#include <QObject>
#include <QDesktopServices>
#include <QByteArray>
#include <QUrl>
class NetworkingManager : public QObject
{
    Q_OBJECT
public:
    explicit NetworkingManager(QObject *parent = nullptr);
    ~NetworkingManager() = default;
public:
    Q_INVOKABLE void openLink(const QString &link);
private:
    QDesktopServices m_manager;
};

#endif // NETWORKINGMANAGER_H
