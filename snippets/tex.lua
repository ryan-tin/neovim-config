return {
  s({trig='subfigure', desc='subfigure'}, 
    t({
      "\\begin{figure}[h]",
      "\\centering",
      "\\begin{subfigure}{.5\\textwidth}",
      "  \\centering",
      "  \\includegraphics[width=\\linewidth]{}",
      "  \\caption{}",
      "  % \\label{fig:sub1}",
      "\\end{subfigure}%",
      "\\begin{subfigure}{.5\\textwidth}",
      "  \\centering",
      "  \\includegraphics[width=\\linewidth]{}",
      "  \\caption{}",
      "  % \\label{fig:sub2}",
      "\\end{subfigure}",
      "\\caption{}",
      "% \\label{fig:test}",
      "\\end{figure}"
    })
  ),
  s({ trig = "autoref", desc = "autoref" }, {
    t("\\autoref{"), i(1), t("}")
  }),
  s({ trig = "label", desc = "label" }, {
    t("\\label{"), i(1), t("}")
  }),
  s({ trig = "verb", desc = "verb macro" }, {
    t("\\verb|"), i(1), t("|")
  }),
  s({ trig = "verbatim", desc = "verbatim begin and end" }, {
    t({
      "\\begin{verbatim}",
      "\t",
    }),
    i(1),
    t({
      "",
      "\\end{verbatim}"
    })
  }),
  s({ trig = "figure", desc = "figure" }, {
    t({
      "\\begin{figure}[h]",
      "\t\\includegraphics[width=\\textwidth"
    }),
    i(1), t("]{"), i(2), t("}"),
    t({ "", "\t\\caption{" }), i(3), t({"}"}),
    t({
      "",
      "\\end{figure}"
    })
  }),
  s({ trig = "tabular", desc = "draw a simple table" }, {
    t({
      "\\begin{center}",
      "\\begin{tabular}",
      "\t",
    }),
    i(1),
    t({
      "",
      "\\end{tabular}",
      "\\end{center}"
    })
  }),
  s({ trig = "abs", desc = "abs" }, {
    t("\\lvert "), i(1), t(" \\rvert"),
  }),
  s({ trig = "frac", desc = "frac" }, {
    t("\\frac{"), i(1), t("}{"), i(2), t("}")
  }),
  s({ trig = "cases", desc = "cases" }, {
    t({
      "\\begin{cases}",
      "\t",
    }),
    i(1),
    t({
      "",
      "\\end{cases}"
    })
  }),
  s({ trig = "gather*", desc = "gather*" }, {
    t({
      "\\begin{gather*}",
      "\t",
    }),
    i(1),
    t({
      "",
      "\\end{gather*}"
    })
  }),
  s({ trig = "equation", desc = "equation" }, {
    t({
      "\\begin{equation}",
      "\t",
    }),
    i(1),
    t({
      "",
      "\\end{equation}"
    })
  }),
  s({ trig = "item", desc = "item" }, {
    t("\\item "), i(1)
  }),
  s({ trig = "itemize", desc = "itemize" }, {
    t({
      "\\begin{itemize}",
      "\t\\item a",
      "\\end{itemize}"
    })
  }),
  s({ trig = "enumerate", desc = "enumerate" }, {
    t({
      "\\begin{enumerate}",
      "\t\\item a",
      "\t\\item b",
      "\t\\item c",
      "\\end{enumerate}"
    })
  }),
}

