# vcpkg evaluates this while building ports. Start with vcpkg's Linux
# toolchain so its platform settings remain intact, then select LLVM.
if(DEFINED VCPKG_ROOT)
    set(_vcpkg_root "${VCPKG_ROOT}")
elseif(DEFINED Z_VCPKG_ROOT_DIR)
    set(_vcpkg_root "${Z_VCPKG_ROOT_DIR}")
else()
    get_filename_component(_vcpkg_root "${CMAKE_CURRENT_LIST_DIR}/../../vcpkg" ABSOLUTE)
endif()
include("${_vcpkg_root}/scripts/toolchains/linux.cmake")

find_program(CLANG_EXECUTABLE NAMES clang REQUIRED)
find_program(CLANGXX_EXECUTABLE NAMES clang++ REQUIRED)

set(CMAKE_C_COMPILER "${CLANG_EXECUTABLE}" CACHE FILEPATH "" FORCE)
set(CMAKE_CXX_COMPILER "${CLANGXX_EXECUTABLE}" CACHE FILEPATH "" FORCE)