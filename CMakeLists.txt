cmake_minimum_required(VERSION 3.30)

project(my_project
    VERSION 0.1.0
    LANGUAGES CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/ProjectOptions.cmake)

# ------------------------------------------------------------------------------
# Library
# ------------------------------------------------------------------------------

file(GLOB_RECURSE LIB_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

add_library(my_project_lib STATIC ${LIB_SOURCES})

target_compile_features(my_project_lib
    PUBLIC
        cxx_std_26
)

target_include_directories(my_project_lib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_link_libraries(my_project_lib
    PRIVATE
        project_options
)

# ------------------------------------------------------------------------------
# Applications
# ------------------------------------------------------------------------------

add_subdirectory(apps)

# ------------------------------------------------------------------------------
# Tests
# ------------------------------------------------------------------------------

include(CTest)

if(BUILD_TESTING)
    add_subdirectory(tests)
endif()