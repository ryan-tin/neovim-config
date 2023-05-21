-- function ColorMyPencils(color)
function Everforest()
    vim.opt.background = "dark" -- is dark by default
    vim.cmd( "let g:everforest_background = 'hard'" )
    vim.cmd( "let g:everforest_better_performance = 1" )
    vim.cmd( "let g:everforest_transparent_background = 1" ) -- 2 conflicts with lualine
	vim.cmd.colorscheme("everforest")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Everforest()
