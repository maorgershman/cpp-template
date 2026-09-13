cmake_minimum_required(VERSION 3.21)
project(cpp-template LANGUAGES C CXX)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/ProjectOptions.cmake)
include(CTest)

add_executable(app
    src/main.cpp
)

add_executable(tests
    tests/test_basic.cpp
)

find_package(Catch2 CONFIG REQUIRED)

target_link_libraries(app PRIVATE project_options)
target_link_libraries(tests PRIVATE project_options Catch2::Catch2WithMain)

include(Catch)
catch_discover_tests(tests)
