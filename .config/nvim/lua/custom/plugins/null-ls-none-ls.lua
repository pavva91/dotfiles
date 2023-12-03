-- TODO: Linter alternative: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
-- TODO: Formatter: https://github.com/mhartington/formatter.nvim
return {
	-- "jose-elias-alvarez/null-ls.nvim",
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("null-ls").setup({
			sources = {
				-- BASH
				require("null-ls").builtins.formatting.shfmt, -- shell script formatting
				require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
				require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions

				-- FORMATTING
				-- Prettier
				-- require("null-ls").builtins.formatting.prettier.with({
				-- 	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "solidity" },
				-- }),                                -- markdown and solidity formatting

				-- Prettier Daemon (faster)
				require("null-ls").builtins.formatting.prettierd.with({
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "solidity" },
				}),                                -- markdown and solidity formatting

				require("null-ls").builtins.formatting.stylua, -- lua formatting

				-- ESLint
				-- require("null-ls").builtins.code_actions.eslint,
				-- require("null-ls").builtins.diagnostics.eslint,

				-- ESLint Daemon (faster)
				require("null-ls").builtins.code_actions.eslint_d,
				require("null-ls").builtins.diagnostics.eslint_d,

				-- GitSigns
				-- require("null-ls").builtins.code_actions.gitsigns.with({
				-- 	config = {
				-- 		filter_actions = function(title)
				-- 			return title:lower():match("blame") == nil -- filter out blame actions
				-- 		end,
				-- 	},
				-- }),

				-- Text Lint - The pluggable linting tool for text and Markdown.
				-- require("null-ls").builtins.diagnostics.textlint

				-- Refactoring (https://github.com/ThePrimeagen/refactoring.nvim)
				-- require("null-ls").builtins.code_actions.refactoring.with({
				-- 	Filetypes = { "go", "javascript", "lua", "python", "typescript" }
				-- })

				-- Spell suggestions code completion
				-- require("null-ls").builtins.completion.spell,

				-- Dictionary - show available definition
				-- require("null-ls").builtins.hover.dictionary,
			},
		})
	end,
	-- opts = {
	-- sources = {
	-- 	require('null-ls').builtins.formatting.shfmt, -- shell script formatting
	-- }
	-- }
}
