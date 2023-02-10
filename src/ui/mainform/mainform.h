#ifndef MAINFORM_H
#define MAINFORM_H

#include <QWidget>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "filesystemmodel.h"

class MainForm : public QObject
{
    Q_OBJECT

public:
    explicit MainForm(QObject *parent = nullptr);
    ~MainForm();

    void show();

private:
    QQmlApplicationEngine* qml_app_engine;
    QObject* qml_app_root_object;
    FileSystemModel *model;
};
#endif // MAINFORM_H
