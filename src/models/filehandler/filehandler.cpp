#include "filehandler.h"
#include <QDir>
#include <QTextStream>

FileHandler::FileHandler(QObject *parent) : QObject(parent) {

}

FileHandler::~FileHandler() {}

QString FileHandler::fileOpen() {
    if (!filepath.size())
        return QString();

    file.setFileName(filepath);

    if (!file.open(QIODevice::ReadWrite | QIODevice::Text))
        return QString();

    QTextStream in(&file);
    setTextCurrent(in.readAll());

    file.close();

    return textCurrent();
}

void FileHandler::fileSave() {
    if (!filepath.size())
        return;

    file.setFileName(filepath);

    if (!file.open(QIODevice::ReadWrite | QIODevice::Text))
        return;

    QTextStream out(&file);
    out << textCurrent();

    file.close();
}

QString FileHandler::filePath() {
    return filepath;
}

void FileHandler::setFilePath(const QString &path) {
    if (filepath == path)
        return;
    filepath = path;
    fileSave();
    fileOpen();
    emit filePathChanged();
}

QString FileHandler::textOrirnal() {
    return filecontent_orig;
}

QString FileHandler::textCurrent() {
    return filecontent_curr;
}

void FileHandler::setTextCurrent(const QString &text) {
    filecontent_prev = filecontent_curr;
    filecontent_curr = text;
    emit textCurrentChanged();
}

