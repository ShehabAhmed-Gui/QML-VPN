#ifndef USERAVATAR_H
#define USERAVATAR_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QString>
#include <QFileDialog>
#include <QLabel>
#include <QMouseEvent>
class UserAvatar : public QQuickPaintedItem
{
    Q_OBJECT
public:
    UserAvatar();
    void paint(QPainter *painter);
    void mouseEvent(QMouseEvent *event);
    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath NOTIFY imagePathChanged FINAL)
    Q_INVOKABLE  QString changeImage();

    QString imagePath() const;
    void setImagePath(const QString &newImagePath);
signals:
    void imagePathChanged();

private:
    QFileDialog dialog;
    QLabel *circleUserAvatar;
    QString m_imagePath;
};

#endif // USERAVATAR_H
