#include "runner.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>

Runner::Runner(QObject *parent) : QObject(parent) {

}

void Runner::run() {
    if (!path.size())
        return;
    qDebug() << "run";
    build();
    QString command = "sh /home/vadim/programs/qt-creator/SIMFORIDE/src/scripts/run.sh " +
            path + " " + getTargetName(path);
    system(command.toLocal8Bit().data());
}

void Runner::build() {
    if (!path.size())
        return;
    qDebug() << "build";
    QString command = "sh /home/vadim/programs/qt-creator/SIMFORIDE/src/scripts/build.sh " + path;
    system(command.toLocal8Bit().data());
}

QString Runner::projectPath() {
    return path;
}

void Runner::setProjectPath(const QString &path) {
    if (path == this->path)
        return;
    this->path = path;
    emit projectPathChanged();
}

QString Runner::getTargetName(const QString &path) {
    QString retv;
    QString filepath = path + "/build/CMakeCache.txt";
    QFile file(filepath);
    if (!file.open(QIODevice::ReadWrite | QIODevice::Text))
        return QString();
    QTextStream in(&file);

    QString line;
    while (!in.atEnd()) {
        line = in.readLine();
        auto temp = line.split("=");
        if (temp[0] == "CMAKE_PROJECT_NAME:STATIC") {
            retv = temp[1];
            break;
        }
    }

    file.close();
    return retv;
}
