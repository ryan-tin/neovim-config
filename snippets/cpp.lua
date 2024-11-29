return {
  s({ trig = "maybe unused", desc = "maybe unused attribute" }, {
    t("[[maybe_unused]]")
  }),
  s({ trig = "no discard", desc = "no discard attribute" }, {
    t("[[nodiscard]]")
  }),

  s({ trig = "guards", desc = "include guards" }, {
    t("#ifndef "), i(1), t({ "", "#define " }), i(0), t({ "", "", "#endif" })
  }),
  s({ trig = "mu", desc = "make unique" }, {
    t("std::make_unique<"), i(1), t(">("), i(2), t(")"), i(0)
  }),
  s({ trig = "up", desc = "unique pointer" }, {
    t("std::unique_ptr<"), i(1), t(">"), i(0)
  }),
  s({ trig = "clang-format off", desc = "don't format code between these comments" }, {
    t({
      "// clang-format off",
      "// clang-format on"
    })
  }),
  s({ trig = "lambda", desc = "lambda template" }, {
    t("["), i(1), t("]("), i(2), t("){"), i(3), t("}"), i(0),
  }),
  s({ trig = "template simple", desc = "simple gtest template without hints" },
    t({ "#include <gtest/gtest.h>",
      "",
      "class FooTest : public testing::Test {",
      "protected:",
      "  FooTest() {}",
      "  ~FooTest() override {}",
      "  void SetUp() override {}",
      "  void TearDown() override {}",
      "};",
      "",
      "TEST_F(FooTest, Scope) {",
      "",
      "}"
    })
  ),
  s({ trig = "cout", desc = "print with endl" }, {
    t("std::cout << "), i(1), t(" << std::endl;"),
  }),
  s({ trig = "template gtest", desc = "template for google test" }, {
    t({ "#include \"this/package/foo.h\"",
      "",
      "#include <gtest/gtest.h>",
      "",
      "namespace my {",
      "namespace project {",
      "namespace {",
      "",
      "// The fixture for testing class Foo.",
      "class FooTest : public testing::Test {",
      " protected:",
      "  // You can remove any or all of the following functions if their bodies would",
      "  // be empty.",
      "",
      "  FooTest() {",
      "     // You can do set-up work for each test here.",
      "  }",
      "",
      "  ~FooTest() override {",
      "     // You can do clean-up work that doesn't throw exceptions here.",
      "  }",
      "",
      "  // If the constructor and destructor are not enough for setting up",
      "  // and cleaning up each test, you can define the following methods:",
      "",
      "  void SetUp() override {",
      "     // Code here will be called immediately after the constructor (right",
      "     // before each test).",
      "  }",
      "",
      "  void TearDown() override {",
      "     // Code here will be called immediately after each test (right",
      "     // before the destructor).",
      "  }",
      "",
      "  // Class members declared here can be used by all tests in the test suite",
      "  // for Foo.",
      "};",
      "",
      "// Tests that the Foo::Bar() method does Abc.",
      "TEST_F(FooTest, MethodBarDoesAbc) {",
      "  const std::string input_filepath = \"this/package/testdata/myinputfile.dat\";",
      "  const std::string output_filepath = \"this/package/testdata/myoutputfile.dat\";",
      "  Foo f;",
      "  EXPECT_EQ(f.Bar(input_filepath, output_filepath), 0);",
      "}",
      "",
      "// Tests that Foo does Xyz.",
      "TEST_F(FooTest, DoesXyz) {",
      "  // Exercises the Xyz feature of Foo.",
      "}",
      "",
      "}  // namespace",
      "}  // namespace project",
      "}  // namespace my",
      "",
      "// int main(int argc, char **argv) {",
      "//   testing::InitGoogleTest(&argc, argv);",
      "//   return RUN_ALL_TESTS();",
      "// }"
    })
  }),
}
