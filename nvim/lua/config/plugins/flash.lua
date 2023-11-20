return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		-- f, t, F,T 带标签
		modes = {
			char = {
				jump_labels = true
			}
		}
	},
	-- stylua: ignore
	keys = {
		{ "<leader>s", mode = { "n", "x", "o", "i" }, function() require("flash").jump() end,   desc = "Flash" },
		{
			"<leader>S",
			mode = { "n", "o", "x" },
			function() require("flash").treesitter() end,
			desc =
			"Flash Treesitter"
		},
		{ "<leader>r", mode = "o",                    function() require("flash").remote() end, desc = "Remote Flash" },
		{
			"<leade>R",
			mode = { "o", "x" },
			function() require("flash").treesitter_search() end,
			desc =
			"Teeesitter Search"
		},
		{
			"<leader>l",
			mode = { "n", "o", "x" },
			function()
				require("flash").jump({
					search = { mode = "search", max_length = 0 },
					label = { after = { 0, 0 } },
					pattern = "^"
				})
			end,
			desc =
			"Flash Goto Line"
		},
		{
			"<leader>w",
			mode = { "n", "o", "x" },
			function()
				require("flash").jump({
					pattern = ".", -- initialize pattern with any char
					search = {
						mode = function(pattern)
							-- remove leading dot
							if pattern:sub(1, 1) == "." then
								pattern = pattern:sub(2)
							end
							-- return word pattern and proper skip pattern
							return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
						end,
					},
					-- select the range
					jump = { pos = "range" },
				})
			end,
			desc =
			"Flash Goto Line"
		},
		{
			"<c-s>",
			mode = { "c" },
			function() require("flash").toggle() end,
			desc =
			"Toggle Flash Search"
		},
	},
}
