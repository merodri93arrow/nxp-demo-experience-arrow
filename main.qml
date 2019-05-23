/****************************************************************************
**
** Copyright (C) 2019 NXP
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 1.2
import "content"
import Mainwindow 1.0

ApplicationWindow {
    property alias stackView: stackView
    visible: true
    width: 1280
    height: 720

    Mainwindow {
        id: mainwindow
        objectName: "mainwindow"
    }

    Rectangle {
        color: "#ffffff"
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        Image {
            x: 590
            y: 160
            width: 630
            height: 340
            visible: true
            anchors.verticalCenterOffset: 20
            source: "images/demo_launcher_logo.png"
            opacity: stackView.depth > 1 ? 0 : 1
            Behavior on opacity { NumberAnimation{} }
        }
    }

    Rectangle {
        id: backMenu
        anchors.rightMargin: 740
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        width: opacity ? 60 : 0
        opacity: stackView.depth > 1 ? 0 : 1
        color: opacity ? "#212126" : "#212126"
        Behavior on opacity { NumberAnimation{} }
    }

    Rectangle {
        id: backtext
        anchors.rightMargin: 0
        anchors.leftMargin: 940
        anchors.topMargin: 0
        anchors.fill: parent
        width: opacity ? 60 : 0
        opacity: stackView.depth > 1 ? 1 : 0
        color: opacity ? "#212126" : "#212126"
        Behavior on opacity { NumberAnimation{} }

    }

    toolBar: BorderImage {
        border.bottom: 8
        source: "images/toolbar.png"
        width: parent.width
        height: 100
        Rectangle {
            id: backButton
            objectName: "backButton"
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "images/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: stackView.pop()
            }
        }

        Text {
            font.pixelSize: 42
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: "i.MX Demo Launcher"
        }
    }

    StackView {
        id: stackView
        objectName: "stackView"
        height: 620
        anchors.fill: parent

        initialItem: Item {
            width: 540
            height: 620
            ListView {
                width: 540
                height: 620
                anchors.topMargin: 0
                anchors.rightMargin: 740
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {
                    text: modelData //title
                    onClicked: mainwindow.goToSubmenu(modelData)
                }
            }
        }
    }
}
