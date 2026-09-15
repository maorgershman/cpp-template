#pragma once

namespace my_project {
class Foo {
  public:
    virtual ~Foo() = default;
    [[nodiscard]] virtual auto get() const noexcept -> int = 0;
};
} // namespace my_project
