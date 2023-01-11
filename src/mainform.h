#ifndef MAINFORM_H
#define MAINFORM_H

#include <QWidget>
#include <QQmlApplicationEngine>

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
};
#endif // MAINFORM_H
