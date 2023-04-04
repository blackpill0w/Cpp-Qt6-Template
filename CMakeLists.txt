cmake_minimum_required(VERSION 3.14)
project(qt6app CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wfloat-conversion -Wsign-conversion -Wshadow")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Copy root/build/compile_commands.json to root/
FILE(COPY ${CMAKE_BINARY_DIR}/compile_commands.json
DESTINATION ${CMAKE_HOME_DIRECTORY})

find_package(Qt6 REQUIRED COMPONENTS Core Widgets UiTools)
qt_standard_project_setup()

add_executable(qt6app
   src/main.cpp)
target_link_libraries(qt6app Qt6::Widgets Qt6::UiTools)
