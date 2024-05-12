return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		vim.keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
		vim.keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")

		local api = require("typescript-tools.api")
		require("typescript-tools").setup({
			handlers = {
				["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }),
			},
		})

		-- 自动格式化
		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWritePre", {
			pattern = "*.ts,*.tsx,*.jsx,*.js",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
