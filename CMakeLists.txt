cmake_minimum_required(VERSION 3.5)

project(SIMFORIDE LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS REQUIRED
                                    Widgets
                                    Qml
                                    Quick
                                    Core
)

qt5_add_resources(RESOURCES resources.qrc)

add_subdirectory(src)

set(PROJECT_SOURCES
        src/main.cpp
)

add_executable(${PROJECT_NAME}
    ${PROJECT_SOURCES}
    ${RESOURCES}
)

target_link_libraries(${PROJECT_NAME} PRIVATE mainform)

target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Core)
target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Qml)
target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Quick)
