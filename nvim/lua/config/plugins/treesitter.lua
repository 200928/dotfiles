return {
	"nvim-treesitter/playground",
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "query", "typescript", "dart", "java", "c", "cpp", "prisma", "bash", "go", "lua", "html", "vim" },
				highlight = {
					enable = true,
					disable = {}, -- list of language that will be disabled
				},
				indent = {
					enable = false
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection    = "<c-n>",
						node_incremental  = "<c-n>",
						node_decremental  = "<c-h>",
						scope_incremental = "<c-l>",
					},
				},
				-- playground = {
				--     enable = true,
				--     disable = {},
				--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				--     persist_queries = false, -- Whether the query persists across vim sessions
				--     keybindings = {
				--       toggle_query_editor = 'o',
				--       toggle_hl_groups = 'i',
				--       toggle_injected_languages = 't',
				--       toggle_anonymous_nodes = 'a',
				--       toggle_language_display = 'I',
				--       focus_language = 'f',
				--       unfocus_language = 'F',
				--       update = 'R',
				--       goto_node = '<cr>',
				--       show_help = '?',
				--     },
				-- }
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local tscontext = require('treesitter-context')
			tscontext.setup {
				enable = true,
				max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
				trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			}
			vim.keymap.set("n", "[c", function()
				tscontext.go_to_context()
			end, { silent = true })
		end
	},
}
