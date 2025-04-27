local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	--LSP
	require("config.plugins.lsp.lspconfig"),
	require("config.plugins.lsp.lspsaga"),
	require("config.plugins.lsp.cmp"),
	require("config.plugins.lsp.lua-snip"),
	require("config.plugins.lsp.typescript-tools"),

	-- MarkDown
	require("config.plugins.markdown"),

	require("config.plugins.nvim-tree"),
	require("config.plugins.git"),
	require("config.plugins.fzf"),
	require("config.plugins.colorscheme"),
	require("config.plugins.trouble"),
	-- require("config.plugins.autocomplete").config,
	require("config.plugins.lualine"),
	require("config.plugins.bufferline"),
	require("config.plugins.telescope").config,
	require("config.plugins.yank"),
	require("config.plugins.dap"),
	require("config.plugins.treesitter"),
	require("config.plugins.comment"),
	--require("config.plugins.indent"),
	require("config.plugins.scrollbar"),
	-- require("config.plugins.wilder"),
	require("config.plugins.window-management"),
	require("config.plugins.vimcdoc"),
	require("config.plugins.multi-cursor"),
	-- require("config.plugins.snippets"),
	require("config.plugins.surround"),
	require("config.plugins.cellular-automata"),
	require("config.plugins.autopairs"),
	require("config.plugins.flash"),
	require("config.plugins.copilot"),
	require("config.plugins.rnvimr"),
	require("config.plugins.trans"),
	require("config.plugins.conform"),
	require("config.plugins.mason"),
	-- require("config.plugins.lspsaga"),
	require("config.plugins.lint"),
	require("config.plugins.project"),
	require("config.plugins.terminal"),
	require("config.plugins.git-blame"),
	require("config.plugins.blame"),
	require("config.plugins.transparent"),
	require("config.plugins.leetcode"),
	-- require("config.plugins.fittencode"),
	require("config.plugins.winbar"),
	-- require("config.plugins.noice"),
	require("config.plugins.avante"),
}, {})
