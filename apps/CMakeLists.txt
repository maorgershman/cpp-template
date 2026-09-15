add_executable(my_project_app
    main.cpp
)

target_link_libraries(my_project_app
    PRIVATE
        my_project_lib
        project_options
)