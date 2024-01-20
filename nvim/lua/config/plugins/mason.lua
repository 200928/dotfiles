return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			-- ensure_installed = { "lua_ls" },
			-- automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"eslint_d",
				"prettierd",
				"rust-analyzer",
				"graphql-language-service-cli",
				"prisma-language-server",
			},
		})
	end,
}
