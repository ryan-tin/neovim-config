return {
  s({ trig = "imports", desc = "common imports"}, {
    t({
      "import pandas as pd",
      "import numpy as np",
      "import matplotlib.pyplot as plt",
    })
  }),
  s({ trig = "iplt", desc = "import for matplotlib"}, 
    t({"import matplotlib.pyplot as plt", ""})
  ),
  s({trig="inp", desc="import numpy"}, 
    t({ "import numpy as np", "" })
  ),
  s({trig="ipd", desc="import pandas"},
    t({ "import pandas as pd", "" })
  ),
  s({trig="idt", desc="import datetime"},
    t({"import datetime", ""})
  ),
  s({trig="comment line break", desc="line break"},
    t({
      '# ==============================================================================',
      '# =============================================================================='
    })
  ),
  s({ trig = "fig", desc = 'new subplot' }, 
    t({
      "fig, ax = plt.subplots()",
      ""
    })
  ),
  s({ trig = "main", desc = "main"}, 
    t({
      "if __name__ == '__main__':",
      "\t"
    })
  )
}
