#include <my_project/foo.hpp>

#include <boost/ut.hpp>
#include <mimic++/mimic++.hpp>

using namespace my_project;
using namespace boost::ut;
using namespace mimicpp;

class FooMock : public Foo {
  public:
    ~FooMock() override = default;
    MAKE_MEMBER_MOCK(get, int, (), const noexcept override);
};

inline auto consumeFoo(const Foo &foo) -> int { return foo.get() * 2; }

int main() {
    "foo"_test = [] {
        FooMock mock{};
        SCOPED_EXP mock.get_.expect_call() and finally::returns(42);
        boost::ut::expect(consumeFoo(mock) == 84_i);
    };
}
