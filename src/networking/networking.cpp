#include "networking.h"

NetworkingManager::NetworkingManager(QObject *parent)
    : QObject{parent}
{}

void NetworkingManager::openLink(const QString &link)
{
    m_manager.openUrl(QUrl(link));
}
