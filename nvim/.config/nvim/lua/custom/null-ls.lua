require("null-ls").setup({
	sources = {
		-- cargo install stylua
		require("null-ls").builtins.formatting.stylua,
		-- npm install eslint_d -g
		require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.formatting.eslint_d,
		-- require("null-ls").builtins.diagnostics.prettier,
	},
})
