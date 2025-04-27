return {
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_enabled = true
			vim.g.copilot_no_tab_map = false
			vim.api.nvim_set_keymap("n", "<leader>go", ":Copilot<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ge", ":Copilot enable<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>gd", ":Copilot disable<CR>", { silent = true })
			-- vim.api.nvim_set_keymap("i", "<c-p>", "<Plug>(copilot-suggest)", {})
			vim.api.nvim_set_keymap("i", "<c-n>", "<Plug>(copilot-next)", { silent = true })
			vim.api.nvim_set_keymap("i", "<c-p>", "<Plug>(copilot-previous)", { silent = true })
			-- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("")', { silent = true, expr = true, script = true })
			vim.cmd([[
			let g:copilot_filetypes = {
	       \ 'TelescopePrompt': v:false,
	     \ }
			]])
		end,
	},
}
