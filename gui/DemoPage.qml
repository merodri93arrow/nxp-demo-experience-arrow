/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** Copyright 2019-2021 NXP
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

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id:homeBkgnd
    anchors.bottom: parent.bottom
    anchors.top: parent.top
    anchors.topMargin: convertDoubleToInt(appWindow.height * 0.02)
    anchors.left: parent.left
    width: convertDoubleToInt(appWindow.width)

    Drawer {
        id: drawer
        width: convertDoubleToInt(appWindow.width * 0.30)
        LeftMenu {
            id: leftMenu
        }
    }

    Rectangle {
        id: rectList
        color: "white"
        width: convertDoubleToInt(appWindow.height * 0.08)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: convertDoubleToInt(appWindow.width * 0.0139)
        anchors.left: parent.left

        ToolButton {
            id: button1
            height: convertDoubleToInt(appWindow.height * 0.08)
            anchors.left: parent.left
            anchors.right: parent.right
            Rectangle {
                id: rect1
                height: convertDoubleToInt(appWindow.height * 0.08)
                width: convertDoubleToInt(appWindow.height * 0.08)

                Image {
                    id: imageIcon1
                    anchors.fill: parent
                    source: "../assets/bars-solid.svg"
                    visible: true
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                }
            }

            onClicked:
                function f() {
                    var cords = homeBkgnd.mapToItem(null, 0, 0)
                    drawer.topMargin = cords.y;
                    drawer.height = homeBkgnd.height;
                    drawer.open();
                }
        }
    }

    DemoGrid {
        id: demolistmain
        width: convertDoubleToInt(appWindow.width * 0.6)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: rectList.right
        transform: Translate {
            x: drawer.position * demolistmain.width * 0.38
        }
    }

    DemoDetails {
        id: demodetailsmain
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: demolistmain.right
        anchors.right: homeBkgnd.right
        currentSel: demolistmain.currentSel
        demos: demoqmlmodule.listDemos
        transform: Translate {
            x: drawer.position * demolistmain.width * 0.33
        }
    }
}
