return {
	"gelguy/wilder.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wilder = require("wilder")
		wilder.setup({
			-- modes = { ':', '/' }, -- 表示命令行模式触发该插件，同时还有 '/' 和 '?' 模式
			modes = { ":" }, -- 表示命令行模式触发该插件，同时还有 '/' 和 '?' 模式
			enable_cmdline_enter = 1, -- 使其wilder不自动激活，请将enable_cmdline_enter选项设置wilder#setup()为0
			next_key = "<Tab>",
			previous_key = "<S-Tab>",
		})
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(
				-- 弹出式菜单
				-- wilder.popupmenu_palette_theme({
				-- 	highlights = {
				-- 		border = 'Normal', -- highlight to use for the border
				-- 	},
				-- 	left = { ' ', wilder.popupmenu_devicons() },
				-- 	right = { ' ', wilder.popupmenu_scrollbar() },
				-- 	border = 'rounded',
				-- 	max_height = '65%', -- max height of the palette
				-- 	min_height = 0, -- set to the same as 'max_height' for a fixed height window
				-- 	prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
				-- 	reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
				-- })
				{
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}
			)
		)
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					language = "vim",
					fuzzy = 1,
				}),
				wilder.search_pipeline()
			),
		})
	end,
}
