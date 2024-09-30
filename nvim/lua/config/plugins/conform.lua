return {
	"stevearc/conform.nvim",
	lazy = true,
	-- event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	event = { "BufWritePre" }, -- to disable, comment this out
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<C-A-L>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
		format_after_save = {
			-- format_on_save = {
			-- These options will be passed to conform.format()
			-- 这里设置一些格式化的文件，比如 .js .jsx .ts .tsx 的在另外一个文件设置了
			-- pattern = "*.lua,*.graphql,*.json,*.yaml,*.md,*.gql,*.rs",
			timeout_ms = 500,
			async = true,
			lsp_fallback = false,
		},
	},
}
