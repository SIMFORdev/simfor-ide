#include "mainform.h"
#include <QDebug>

MainForm::MainForm(QObject* parent) : QObject(parent) {
    this->qml_app_engine = new QQmlApplicationEngine;
    this->model = new FileSystemModel(this->qml_app_engine);
//    this->model->setRootPath(QDir::currentPath());

    qmlRegisterUncreatableType<FileSystemModel>("FileSystemModel", 1, 0,
                                                 "FileSystemModel", "Cannot create a FileSystemModel instance.");
}

MainForm::~MainForm() {
    delete qml_app_engine;
}

void MainForm::show() {
    this->model->setRootPath("/home/vadim/programs/qt-creator/SIMFORIDE/");
    this->model->setResolveSymlinks(true);
    this->qml_app_engine->rootContext()->setContextProperty("fileSystemModel", this->model);
    this->qml_app_engine->rootContext()->setContextProperty("rootPathIndex", this->model->index(this->model->rootPath()));
    this->qml_app_engine->load(QUrl(QStringLiteral("qrc:/qml/ui/MainWindow.qml")));
    if (this->qml_app_engine->rootObjects().isEmpty()) {
        emit this->qml_app_engine->exit(-1);
    }
}
