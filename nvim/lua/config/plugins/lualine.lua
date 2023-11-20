-- local current_signature = function()
-- 	if not pcall(require, 'lsp_signature') then return end
-- 	local sig = require("lsp_signature").status_line(50)
-- 	return sig.label .. "🐼" .. sig.hint
-- end
--

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "  ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = "#98be65" },
		modified = { fg = "#ecbe7b" },
		removed = { fg = "#ec5f67" },
	},
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		-- return "-- " .. str .. " --"
		return str
	end,
}


local file_name = {
	'filename',
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 1,        -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = '[+]', -- Text to show when the file is modified.
		readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
		unnamed = '[No Name]', -- Text to show for unnamed buffers.
	},
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	-- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", " ", }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
	-- "theniceboy/eleline.vim",
	"nvim-lualine/lualine.nvim",
	-- branch = "no-scrollbar",
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = function()
		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				-- theme = "codedark",
				-- theme = "powerline_dark",
				-- theme = "ayu_dark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { branch, diagnostics },
				lualine_b = { mode },
				lualine_c = { file_name },
				lualine_x = { diff, spaces, "encoding", filetype, "fileformat" },
				-- lualine_x = {
				--   {
				--     require("lazy.status").updates,
				--     cond = require("lazy.status").has_updates,
				--     color = { fg = "#ff9e64" },
				--   },
				-- },
				lualine_y = { location },
				-- lualine_z = { progress },
				lualine_z = { '%p%%/%L' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { file_name },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end
}
