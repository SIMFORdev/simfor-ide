#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QObject>
#include <QFile>
#include <QString>

class FileHandler : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString filePath READ filePath WRITE setFilePath NOTIFY filePathChanged)

    Q_PROPERTY(QString textOrirnal READ textOrirnal)
    Q_PROPERTY(QString textCurrent READ textCurrent WRITE setTextCurrent NOTIFY textCurrentChanged)

public:
    explicit FileHandler(QObject *parent = nullptr);
    ~FileHandler();

    Q_INVOKABLE QString fileOpen();
    Q_INVOKABLE void fileSave();

    QString filePath();
    void setFilePath(const QString &path);

    QString textOrirnal();

    QString textCurrent();
    void setTextCurrent(const QString &text);

signals:
    void filePathChanged();
    void textCurrentChanged();

private:
    QFile file;
    QString filepath;
    QString filecontent_curr;
    QString filecontent_prev;
    QString filecontent_orig;
};

#endif // FILEHANDLER_H
