#ifndef RUNNER_H
#define RUNNER_H

#include <QObject>

class Runner : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString projectPath READ projectPath WRITE setProjectPath NOTIFY projectPathChanged)
public:
    explicit Runner(QObject *parent = nullptr);

    Q_INVOKABLE void run();
    Q_INVOKABLE void build();

    QString projectPath();
    void setProjectPath(const QString &path);

signals:
    void projectPathChanged();

private:
    QString path;

    static QString getTargetName(const QString &path);
};

#endif // RUNNER_H
