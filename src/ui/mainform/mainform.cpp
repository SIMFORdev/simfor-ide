#include "mainform.h"

MainForm::MainForm(QObject* parent) : QObject(parent) {
    this->qml_app_engine = new QQmlApplicationEngine;
    this->model = new QFileSystemModel(this->qml_app_engine);
//    this->model->setRootPath(QDir::currentPath());


    qmlRegisterUncreatableType<QFileSystemModel>("io.qt.examples.quick.controls.filesystembrowser", 1, 0,
                                                 "FileSystemModel", "Cannot create a FileSystemModel instance.");



//    this->qml_app_engine->addImportPath(QStringLiteral("qrc:/"));
//    this->qml_app_engine->addImportPath(QStringLiteral("qrc:/qml"));
}

MainForm::~MainForm() {
    delete qml_app_engine;
}

void MainForm::show() {
    this->model->setRootPath("file:///home/vadim/programs/qt-creator/SIMFORIDE/");
    this->model->setResolveSymlinks(true);
    this->qml_app_engine->rootContext()->setContextProperty("fileSystemModel", this->model);
    this->qml_app_engine->rootContext()->setContextProperty("rootPathIndex", this->model->index(this->model->rootPath()));
    this->qml_app_engine->load(QUrl(QStringLiteral("qrc:/qml/ui/MainWindow.qml")));
    if (this->qml_app_engine->rootObjects().isEmpty()) {
        emit this->qml_app_engine->exit(-1);
    }
    this->qml_app_root_object = this->qml_app_engine->rootObjects().value(0);
}
