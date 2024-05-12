return {
	"iamcco/markdown-preview.nvim",
	dependencies = {
		"mzlogin/vim-markdown-toc",
	},
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
