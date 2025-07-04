return {
  s({trig='pyrightconfig template', desc='pyright config'}, {
    t({
    -- "{",
    -- "  \"include\": [\".\"],",
    -- "  \"extraPaths\": [\"/Users/ryantin/Rochefort/dev/py_strategies/\"]",
    -- "}",
    "{",
    "  \"include\": [\".\"],",
    "  \"extraPaths\": [\"/Users/ryantin/Rochefort/dev/py_strategies/\",",
    "      \"extraPaths\" ],",
    "  \"venvPath\": \"/Users/ryantin/venvs\",",
    "  \"venv\": \"myenv\"",
    "}",
    })
  }),
  s({ trig = "launch.json template", desc = "codelldb preset debugging launch configureations" }, {
    t({
      "{",
      "  \"version\": \"0.2.0\",",
      "  \"configurations\": [",
      "    {",
      "      \"type\": \"codelldb\",",
      "      \"request\": \"launch\",",
      "      \"name\": \"SET_NAME_HERE\",",
      "      \"program\": \"path_to_executable\",",
      "      \"args\" : [\"--gtest_filter=LoggerTest.DifferentSignature\"],",
      "      \"stopAtEntry\": false,",
      "      \"setupCommands\": [",
      "        {",
      "          \"text\": \"breakpoint delete cpp_exception\",",
      "          \"description\": \"no break on exceptions\",",
      "          \"ignoreFailures\": false",
      "        }",
      "      ]",
      "    }",
      "  ]",
      "}",
    })
  }),
  s({ trig = "testcase template", desc = "new testcase template"}, {
    t({
      "{",
      "  \"type\": \"codelldb\",",
      "  \"request\": \"launch\",",
      "  \"name\": \"SET_NAME_HERE\",",
      "  \"program\": \"PATH_TO_EXECUTABLE\",",
      "  \"args\" : [\"--gtest_filter=LOGGERTEST.DIFFERENTSIGNATURE\"],",
      "  \"stopAtEntry\": false,",
      "  \"setupCommands\": [",
      "    {",
      "      \"text\": \"breakpoint delete cpp_exception\",",
      "      \"description\": \"no break on exceptions\",",
      "      \"ignoreFailures\": false",
      "    }",
      "  ]",
      "}",
    })
  })
}
