#include "mainform.h"
#include <QDebug>

#include "filehandler.h"
#include "runner.h"

MainForm::MainForm(QObject* parent) : QObject(parent) {
    this->qml_app_engine = new QQmlApplicationEngine;
    this->filesystemmodel = new FileSystemModel(this->qml_app_engine);
//    this->model->setRootPath(QDir::currentPath());

    qmlRegisterUncreatableType<FileSystemModel>("FileSystemModel", 1, 0,
                                                 "FileSystemModel",
                                                "Cannot create a FileSystemModel instance.");
    qmlRegisterType<FileHandler>("FileHandler", 1, 0, "FileHandler");
    qmlRegisterType<Runner>("Runner", 1, 0, "Runner");
}

MainForm::~MainForm() {
    delete qml_app_engine;
}

void MainForm::show() {
//    this->filesystemmodel->setRootPath("");
    this->filesystemmodel->setResolveSymlinks(true);
    this->qml_app_engine->rootContext()->
            setContextProperty("fileSystemModel", this->filesystemmodel);
//    this->qml_app_engine->rootContext()->
//            setContextProperty("rootPathIndex",
//                               this->filesystemmodel->index(this->filesystemmodel->rootPath()));
    this->qml_app_engine->load(QUrl(QStringLiteral("qrc:/qml/ui/MainWindow.qml")));
    if (this->qml_app_engine->rootObjects().isEmpty()) {
        emit this->qml_app_engine->exit(-1);
    }
}
