-- function ColorMyPencils(color)
function ColorMyPencils()
    vim.cmd( "set background=dark" )
    vim.cmd( "let g:everforest_background = 'hard'" )
    vim.cmd( "let g:everforest_better_performance = 1" )
    vim.cmd( "let g:everforest_transparent_background = 1" ) -- 2 conflicts with lualine
	-- color = color or "everforest"
	vim.cmd.colorscheme("everforest")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
