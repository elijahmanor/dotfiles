local has_module, null_ls = pcall(require, "null-ls")
if not has_module then
	return
end

null_ls.setup({
	sources = {
		-- cargo install stylua
		-- require("null-ls").builtins.formatting.stylua,
		-- npm install eslint_d -g
		-- require("null-ls").builtins.diagnostics.eslint_d,
		-- require("null-ls").builtins.formatting.eslint_d.with({
		-- 	extra_args = { "--parser=@babel/eslint-parser" }
		-- }),
		-- npm install eslint -g
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.formatting.eslint,
		-- npm install -g write-good
		-- require("null-ls").builtins.diagnostics.write_good,
		-- npm install -g prettier_d_slim
		-- require("null-ls").builtins.formatting.prettier_d_slim.with({
		-- 	filetypes = { "html", "javascript", "json", "typescript", "yaml", "markdown" },
		-- 	extra_args = { "--prose-wrap=always" }
  --   	}),
	},
	debug = true
})
