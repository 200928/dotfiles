return {
	"stevearc/conform.nvim",
	lazy = true,
	-- keys = { "<C-M-l>" },
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
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
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			-- 这里设置一些格式化的文件，比如 .js .jsx .ts .tsx 的在另外一个文件设置了
			pattern = "*.lua,*.graphql,*.json,*.yaml,*.md,*.gql,*.rs",
			timeout_ms = 500,
			async = false,
			lsp_fallback = true,
		},
	},
}
