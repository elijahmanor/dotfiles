-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
local M = {}

function M.reloadInit()
	vim.cmd("luafile $MYVIMRC")
end

function M.reloadModules()
	local reload_module = require("plenary.reload").reload_module
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
	  dir = string.gsub(dir, "./lua/", "")
	  reload_module(dir)
	end
	-- for name, _ in pairs(package.loaded) do
	-- 	if name:match("^cnull") then
	-- 		-- package.loaded[name] = nil
	-- 		reload_module(name)
	-- 	end
	-- end
end

function M.reload()
	M.reloadInit()
	M.reloadModules()
	print("Sourced init.lua and required modules")
end

return M


-- :lua print(vim.inspect(package.loaded, { depth = 1 }))
-- vim.cmd('autocmd BufWrite *.lua,*vim call
-- vim.cmd('command! ReloadConfig lua require('utils').reload()')

