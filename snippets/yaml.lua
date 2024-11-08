return {
  s({ trig = "template .clangd", desc = "template for .clangd file" }, {
    t({
      "CompileFlags:",
      "    Add: [",
      "      -I"
    }), i(1),
    t({ ",",
      "    ]" })
  })
}
