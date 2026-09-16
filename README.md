# cpp-template

A minimal C++26 project template: CMake + Ninja, [vcpkg](https://github.com/microsoft/vcpkg) for dependencies, and [Boost.UT](https://github.com/boost-ext/ut) + [mimic++](https://github.com/DNKpp/mimicpp) for testing.

## Start a new project

Run the one-liner below. It clones the template, drops its git history, adds `vcpkg` as a submodule, renames every `my_project` / `my-project` reference to your project's name, and commits the result — leaving you with a clean, ready-to-use repository.

```bash
curl -fsSL https://raw.githubusercontent.com/maorgershman/cpp-template/main/init.sh | bash -s -- <project_name> [dir]
```

Replace `<project_name>` with your desired project name. Pass an optional second argument `[dir]` to use a different directory name.