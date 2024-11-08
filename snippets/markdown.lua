return {
  s({ trig = "template bug", desc = "template for new bug task" }, {
    t("Date Created: "), t(vim.fn.strftime('%a %d %b %Y')),
    t({
      "",
      "# Description",
      "",
      "",
      "# Error Message",
      "```txt",
      "",
      "```",
      "",
      "# Steps to Reproduce",
      "",
      "",
      "# Todos",
      "- [ ] one",
      "- [ ] two",
      "- [ ] three",
    })
  }),
  s({ trig = "template task", desc = "template for new bug task" }, {
    t("Date Created: "), t(vim.fn.strftime('%a %d %b %Y')),
    t({ "", "",
      "# Description",
      "", }), i(1, "task"), t({ "", "",
    "# Todos",
    "- [ ] one",
    "- [ ] two",
    "- [ ] three",
    "",
    "# Related Tasks",
    ""
  })
  }),
  s({ trig = "important", desc = "important block" }, {
    t({ "> [!IMPORTANT]",
      "> " }), i(1)
  }),
  s({ trig = "note", desc = "note block" }, {
    t({ "> [!NOTE]",
      "> " }), i(1)
  })
}
