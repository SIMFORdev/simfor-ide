#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QObject>
#include <QWidget>
#include <QFileSystemModel>

class FileSystemModel : public QFileSystemModel
{
    Q_OBJECT
    Q_PROPERTY(QString rootPath READ rootPath)
public:
    FileSystemModel(QObject *parent = nullptr);
    Q_INVOKABLE bool isDirectory(const QModelIndex &index) const;
};

#endif // FILEMODEL_H
