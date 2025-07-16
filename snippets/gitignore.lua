return {
  s({trig="template python", desc="python gitignore template"}, 
    t({
      "### Python ###",
      "__pycache__/"
    })
  ),
  s({trig="template debugging", desc="debugging gitignore template"}, {
    t({
      "### Debugging ###",
      ".vscode/launch.json",
    })
  }),
  s({trig="template latex", desc="latex gitignore template"}, {
    t({
      "### LaTeX ###",
      "# Compiled files",
      "*.aux",
      "*.bbl",
      "*.bcf",
      "*.blg",
      "*.toc",
      "*.dvi",
      "*.idx",
      "*.ilg",
      "*.ind",
      "*.lof",
      "*.log",
      "*.lot",
      "*.out",
      "*.pdf",
      "*.run.xml",
      "*.synctex.gz*",
      "*.toc",
      "images/"
    })
  }),
  s({trig="template git", desc="git gitignore template"}, {
    t({
      "### Git ###",
      ".git"
    })
  }),
  s({trig="template mac", desc="mac gitignore template"}, {
    t({
      "### Mac ###",
      ".DS_Store",})
  }),
  s({trig="template nvim", desc="nvim gitignore template"}, {
    t({
      "### NeoVim ###",
      "*.vim",})
  }),
  s({trig="template cpp", desc="cpp gitignore template"}, {
    t({
      "### C++ ###",
      ""
    }),
  }),
  s({trig="template cmake builds", desc="common cmake builds gitignore template"}, {
    t({
      "### CMake Common Builds ###",
      "build/",
      "debug/",
      "build_tests/",
      "debug_tests/"
    })
  }),
  s({trig="template cmake", desc="cmake gitignore template"}, {
    t({
      "### CMake ###",
      ".cache",
      "compile_commands.json"
    })
  }),
}
