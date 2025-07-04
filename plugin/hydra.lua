local Hydra = require('hydra')

-- FIX: does not work...
-- Hydra({
--   name = 'Jumps',
--   mode = 'n',
--   body = 'g',
--   heads = {
--     { 'n', 'gn', { nowait = true } },
--     { 'p', 'gp', { desc = 'diagnostic', nowait = true } },
--     { 'h', 'gh', { nowait = true } },
--     { 'H', 'gH', { desc = 'hunk', nowait = true } },
--   }
-- })

-- but this does
Hydra({
  name = 'Side scroll',
  mode = 'n',
  body = 'z',
  heads = {
    { 'h', '5zh' },
    { 'l', '5zl', { desc = '←/→' } },
    { 'H', 'zH' },
    { 'L', 'zL', { desc = 'half screen ←/→' } },
  }
})

-- but does not work when there are two Hydra() calls
