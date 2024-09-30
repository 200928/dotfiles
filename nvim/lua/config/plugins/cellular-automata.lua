return {
	"Eandrju/cellular-automaton.nvim",
	keys = "<leader>rr",
	config = function()
		vim.keymap.set("n", "<leader>rr1", "<cmd>CellularAutomaton make_it_rain<CR>")
		vim.keymap.set("n", "<leader>rr2", "<cmd>CellularAutomaton game_of_life<CR>")
	end,
}
