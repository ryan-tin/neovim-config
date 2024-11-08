return {
  s({ trig = "safe transaction", desc = "safe transaction!!!!" }, {
    t({ "BEGIN;", "", "" }), i(1, "DANGEROUS WORK"),
    t({
      "",
      "",
      "ROLLBACK;",
      "-- COMMIT; -- WARNING:",
    })
  })
}
