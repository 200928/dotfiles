return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			-- enable = true, -- boolean: enable transparent
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = { -- table/string: additional groups that should be cleared
				-- In particular, when you set it to 'all', that means all available groups
				-- example of akinsho/nvim-bufferline.lua
				"BufferLineTabClose",
				"BufferlineBufferSelected",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineSeparator",
				"BufferLineIndicatorSelected",
				"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
				"NvimTreeNormal", -- NvimTree
			},
			exclude_groups = {}, -- table: groups you don't want to clear
		})
	end,
}
