#include "filesystemmodel.h"

#include "QDebug"

FileSystemModel::FileSystemModel(QObject *parent) : QFileSystemModel(parent) {}

bool FileSystemModel::isDirectory(const QModelIndex &index) const {
    return isDir(index);
}

QString FileSystemModel::fileFullPath(const QModelIndex &index) const {
    return filePath(index);
}

QModelIndex FileSystemModel::setRootFileSystemPath(const QString &newPath) {
    return setRootPath(newPath);
}
