return {
	{
		"shellRaining/hlchunk.nvim",
		init = function()
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
			require("hlchunk").setup({
				-- chunk = {
				-- 	enable = true,
				-- 	notify = true,
				-- 	use_treesitter = true,
				-- 	-- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
				-- 	-- support_filetypes = ft.support_filetypes,
				-- 	-- exclude_filetypes = ft.exclude_filetypes,
				-- 	chars = {
				-- 		horizontal_line = "─",
				-- 		vertical_line = "│",
				-- 		left_top = "╭",
				-- 		left_bottom = "╰",
				-- 		right_arrow = ">",
				-- 	},
				-- 	style = {
				-- 		{ fg = "#806d9c" },
				-- 		{ fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
				-- 	},
				-- 	textobject = "",
				-- 	max_file_size = 1024 * 1024,
				-- 	error_sign = true,
				-- },
				chunk = {
					enable = true,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = ">",
					},
					-- chars = {
					-- 	horizontal_line = "─",
					-- 	vertical_line = "│",
					-- 	left_top = "┌",
					-- 	left_bottom = "└",
					-- 	right_arrow = "─",
					-- },
					style = "#00ffff",
				},
				indent = {
					chars = {
						"│",
						"¦",
						"┆",
						"┊",
					},
					style = {
						"#394263",
						-- "#8B00FF",
						-- vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
				blank = {
					enable = false,
					chars = {
						"",
					},
				},
				line_num = {
					enable = true,
					use_treesitter = true,
					style = "#806d9c",
				},
			})
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	opts = {
	-- 		show_current_context = true,
	-- 		show_current_context_start = false,
	-- 	}
	-- },
}
