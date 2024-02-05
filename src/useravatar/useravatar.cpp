#include "useravatar.h"

UserAvatar::UserAvatar()
    : circleUserAvatar(new QLabel())
    , m_imagePath(":/assets/icons/person.png")
{
}

void UserAvatar::paint(QPainter *painter)
{
    QPixmap pixmap(m_imagePath.toUtf8());
    QPixmap scaled = pixmap.scaled(55, 55, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    QBrush brush(scaled);
    painter->setRenderHint(QPainter::SmoothPixmapTransform);
    painter->setBrush(brush);
    painter->drawRoundedRect(0, 0, 55, 55, 50, 50);
}

QString UserAvatar::changeImage()
{
    QFileDialog dialog;
    QString imagePath = dialog.getOpenFileName(NULL, "Choose an avatar image", "home", "Image Files (*.jpg *.jpeg *.png)");
    qDebug() << imagePath;
    if(!imagePath.isEmpty())
    {
        if(m_imagePath != imagePath)
        m_imagePath = imagePath;
        update();
    }
    return QString();
}

QString UserAvatar::imagePath() const
{
    return m_imagePath;
}

void UserAvatar::setImagePath(const QString &newImagePath)
{
    if (m_imagePath == newImagePath)
        return;
    m_imagePath = newImagePath;
    emit imagePathChanged();
}
