local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

-- local highlight_yank = create_augroup("highlight_yank", { clear = true })
-- create_autocmd("TextYankPost", {
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
-- 	end,
-- 	group = highlight_yank,
-- })

vim.cmd(
	[[                                                                                                                 
    augroup highlight_yank                                                                                                 
        autocmd!                                                                                                           
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}                         
    augroup END                                                                                                            
]]
)

local packer_user_config = create_augroup("packer_user_config", { clear = true })
create_autocmd("BufWritePost", {
	pattern = "*/lua/custom/plugins/init.lua",
	command = "source <afile> | PackerCompile",
	group = packer_user_config,
})

local set_toggle = create_augroup("set_toggle", { clear = true })
create_autocmd("InsertEnter", {
	callback = function()
		if vim.bo.filetype ~= "alpha" then
			vim.opt.relativenumber = false
		end
	end,
	group = set_toggle,
})
create_autocmd({ "VimEnter", "BufEnter", "InsertLeave" }, {
	callback = function()
		if vim.bo.filetype ~= "alpha" then
			vim.opt.relativenumber = true
			vim.opt.list = false
		end
	end,
	group = set_toggle,
})

vim.cmd([[
autocmd BufNewFile,BufRead *.md,*.mdx,*.markdown :set filetype=markdown
]])

vim.cmd([[ 
autocmd BufEnter *.js,*.jsx :write | edit | TSBufEnable highlight
]])

vim.cmd([[ highlight WinSeparator guibg=None ]])
-- vim.highlight.create( "WinSeparator", { guibg="None" }, false )

