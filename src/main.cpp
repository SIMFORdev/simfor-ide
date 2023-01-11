#include "mainform.h"

#include <QApplication>

int main(int argc, char *argv[]) {
//    qputenv("QT_QUICK_BACKEND", "software");
//    qputenv("QT_QPA_PLATFORM", "wayland");

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("Amazing Application");

    MainForm window;
    window.show();

    return app.exec();
}
