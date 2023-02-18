#include "filesystemmodel.h"

FileSystemModel::FileSystemModel(QObject *parent) : QFileSystemModel(parent) {}

bool FileSystemModel::isDirectory(const QModelIndex &index) const {
    return isDir(index);
}
