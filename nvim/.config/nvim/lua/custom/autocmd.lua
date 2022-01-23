vim.cmd([[
	augroup highlight_yank
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
	augroup END
]])

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost */lua/custom/plugins/init.lua source <afile> | PackerCompile
	augroup end
]])

vim.cmd([[
	augroup list_toggle
		autocmd!
		autocmd InsertEnter * set list
		autocmd VimEnter,BufEnter,InsertLeave * set nolist
	augroup end
]])
