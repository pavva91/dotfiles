return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

						["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
						["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },

						["l="] = { query = "@assignment.lhs", desc = "Select left hand side part of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side part of an assignment" },

						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
					},
					selection_modes = {
						['@parameter.outer'] = 'V',
						['@function.outer'] = 'V',
						['@class.outer'] = '<c-v>',
					},
					-- include_surrounding_whitespace = true
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method/function definition start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]n"] = { query = "@number.outer", desc = "Next number start" },
						["]v"] = { query = "@vardef.outer", query_group = "locals", desc = "Next variable definition start" },
						["]="] = { query = "@varassign.inner", query_group = "locals", desc = "Next variable assignment start" },
						["]{"] = { query = "@mustache.open", query_group = "locals", desc = "Next mustache start" },
						["]}"] = { query = "@mustache.close", query_group = "locals", desc = "Next mustache close" },

						["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method/function definition end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Previous function call start" },
						["[m"] = { query = "@function.outer", desc = "Previous method/function definition start" },
						["[c"] = { query = "@class.outer", desc = "Previous class start" },
						["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
						["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						["[n"] = { query = "@number.outer", desc = "Previous number start" },
						["[v"] = { query = "@vardef.outer", query_group = "locals", desc = "Previous variable definition start" },
						["[="] = { query = "@varassign.inner", query_group = "locals", desc = "Previous variable assignment start" },
						["[{"] = { query = "@mustache.open", query_group = "locals", desc = "Previous mustache start" },
						["[}"] = { query = "@mustache.close", query_group = "locals", desc = "Previous mustache close" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Previous function call end" },
						["[M"] = { query = "@function.outer", desc = "Previous method/function definition end" },
						["[C"] = { query = "@class.outer", desc = "Previous class end" },
						["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
						["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = { query = "@parameter.inner", desc = "Swap current parameter with next" },
						["<leader>nm"] = { query = "@function.outer", desc = "Swap current function/method with next" },
					},
					swap_previous = {
						["<leader>pa"] = { query = "@parameter.inner", desc = "Swap current parameter with previous" },
						["<leader>nm"] = { query = "@function.outer", desc = "Swap current function/method with previous" },
					},
				},
				lsp_interop = {
					enable = true,
					border = 'rounded',
					floating_preview_opts = {},
					peek_definition_code = {
						["<leader>df"] = { query = "@function.outer", desc = "Peek method/function definition" },
						["<leader>dc"] = { query = "@class.outer", desc = "Peek class definition" }
					}
				}
			}
		})
	end
}
