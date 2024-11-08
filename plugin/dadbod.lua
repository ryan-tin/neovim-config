vim.g.dbs = {
  -- {
  -- { name = 'my_sql_dev', url = 'mysql://root@localhost/dev' },
  -- WARN: DO NOT COMMIT THIS
  { name = 'dev', url = 'postgres://ryantin:whitedeerq1w2@localhost:5432/dev' },
  -- { name = 'staging', url = 'postgres://postgres:mypassword@localhost:5432/my-staging-db' },
  -- {
  --   name = 'production',
  --   url = function()
  --     return vim.fn.system('get-prod-url')
  --   end
  -- },
  -- }
}

-- never fold dbout files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'dbout' },
  callback = function()
    vim.opt.foldenable = false
  end,
})
