QT += qml quick
TARGET = demolauncher

include(src/src.pri)

OTHER_FILES += \
    main.qml \
    content/AndroidDelegate.qml \
    content/videoPage.qml \
    content/gpuPage.qml \
    content/aimlPage.qml

RESOURCES += \
    resources.qrc

