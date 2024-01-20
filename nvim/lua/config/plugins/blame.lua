return {
	"FabijanZulj/blame.nvim",
	event = "VeryLazy",
	config = function()
		require("blame").setup({
			virtual_style = "right_align",
			width = 2,
			merge_consecutive = false,
			-- date_format = "%Y-%m-%d %H:%M:%S",
		})
	end,
}
