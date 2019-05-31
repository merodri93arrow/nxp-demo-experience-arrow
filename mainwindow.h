/****************************************************************************
**
** Copyright (C) 2019 NXP
**
** SPDX-License-Identifier: GPL-2.0+
**
****************************************************************************/

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QObject>
#include <QProcess>
#include "demo.h"

class Mainwindow : public QObject
{

    Q_OBJECT

public:
    explicit Mainwindow (QObject* parent = nullptr);

    QQmlApplicationEngine *engineMain;
    QObject *stackView;
    QObject *launchButton;
    QObject *root;

    void loadJsonData();

    Q_INVOKABLE void goToSubmenu(QString);
    Q_INVOKABLE void goToMainmenu();
    Q_INVOKABLE void goToDemo(QString);
    Q_INVOKABLE void callDemo(QString command);

    QStringList firstLevelMenu;
    QStringList secondLevelMenu;
    QStringList secondLevelMenuFiltered;

private:

    DemoModel *modelDemo = new DemoModel;
    DemoModel *currentModelDemo = new DemoModel;

    QString currentMainMenu;
    QString currentSubMenu;

    QProcess *launchDemo_process;

};

#endif // MAINWINDOW_H
