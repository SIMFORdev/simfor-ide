cmake_minimum_required(VERSION 3.5)

project(SIMFORIDE LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#add_compile_options(-Dplatform wayland)

find_package(Qt5 COMPONENTS REQUIRED
                                    Widgets
                                    Qml
                                    Quick
                                    Core
)

qt5_add_resources(RESOURCES resources.qrc)

set(PROJECT_SOURCES
        src/main.cpp
        src/mainform.cpp
        src/mainform.h
)

add_executable(${PROJECT_NAME}
    ${PROJECT_SOURCES}
    ${RESOURCES}
)

#target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Core)
#target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)
#target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Qml)
#target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Quick)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Qml)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Quick)
