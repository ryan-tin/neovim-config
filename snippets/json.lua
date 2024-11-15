return {
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
}
