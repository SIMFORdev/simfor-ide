cmake_minimum_required(VERSION 3.5)

project(runner)

find_package(Qt5 COMPONENTS REQUIRED
                                    Widgets
                                    Qml
                                    Quick
                                    Core
)

add_library(${PROJECT_NAME} STATIC runner.cpp runner.h)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Qml)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Quick)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
