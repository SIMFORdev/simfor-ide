#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QObject>
#include <QWidget>
#include <QFileSystemModel>

class FileModel : public QFileSystemModel
{
    Q_OBJECT
public:
    FileModel();
};

#endif // FILEMODEL_H
