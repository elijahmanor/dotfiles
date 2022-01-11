require("custom.options")
require("custom.keymaps")
require("custom.plugins")
require("custom.cmp")
require("custom.lsp")
require("custom.null-ls")
require("custom.treesitter")

vim.cmd("colorscheme dracula")

-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^cnull") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
end
