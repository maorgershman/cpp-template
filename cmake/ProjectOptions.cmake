add_library(project_options INTERFACE)

target_compile_options(project_options INTERFACE
    -Wall
    -Wextra
    -Wshadow
    -Wnon-virtual-dtor
    -Wold-style-cast
    -Wcast-align
    -Wunused
    -Woverloaded-virtual
    -Wpedantic
    -Wconversion
    -Wsign-conversion
    -Wmisleading-indentation
    -Wnull-dereference
    -Wdouble-promotion
    -Wformat=2
    -Wimplicit-fallthrough
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(project_options INTERFACE
        -fsanitize=address,undefined
        -fno-omit-frame-pointer
        -Werror
    )
    target_link_options(project_options INTERFACE
        -fsanitize=address,undefined
        -fuse-ld=lld
    )
endif()