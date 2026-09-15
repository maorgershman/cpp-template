find_package(ut CONFIG REQUIRED)
find_package(mimicpp CONFIG REQUIRED)

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

add_executable(my_project_tests
    ${TEST_SOURCES}
)

target_link_libraries(my_project_tests
    PRIVATE
        my_project_lib
        project_options
        Boost::ut
        mimicpp::mimicpp
)

add_test(
    NAME my_project.unit
    COMMAND my_project_tests
)