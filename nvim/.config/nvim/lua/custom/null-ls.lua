local has_module, null_ls = pcall(require, "null-ls")
if not has_module then
	return
end

null_ls.setup({
	sources = {
		-- cargo install stylua
		require("null-ls").builtins.formatting.stylua,
		-- npm install eslint_d -g
		require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.formatting.eslint_d,
		-- require("null-ls").builtins.diagnostics.prettier,
	},
})
