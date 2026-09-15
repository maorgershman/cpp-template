add_library(project_options INTERFACE)

target_compile_features(project_options
    INTERFACE
        cxx_std_26
)

target_compile_options(project_options
    INTERFACE

        # Warnings
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

        # Debug
        $<$<CONFIG:Debug>:
            -O0
            -g
            -fno-omit-frame-pointer
            -Werror
            -fsanitize=address,undefined
        >
)

target_link_options(project_options
    INTERFACE

        # Debug sanitizers
        $<$<CONFIG:Debug>:
            -fsanitize=address,undefined
            -fuse-ld=lld
        >
)