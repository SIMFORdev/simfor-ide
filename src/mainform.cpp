#include "mainform.h"

MainForm::MainForm(QObject* parent) : QObject(parent) {
    this->qml_app_engine = new QQmlApplicationEngine;
//    this->qml_app_engine->addImportPath(QStringLiteral("qrc:/"));
//    this->qml_app_engine->addImportPath(QStringLiteral("qrc:/qml"));
}

MainForm::~MainForm() {
    delete qml_app_engine;
}

void MainForm::show() {
    this->qml_app_engine->load(QUrl(QStringLiteral("qrc:/qml/ui/MainWindow.qml")));
    if (this->qml_app_engine->rootObjects().isEmpty()) {
        emit this->qml_app_engine->exit(-1);
    }
    this->qml_app_root_object = this->qml_app_engine->rootObjects().value(0);
}
