-- This file is automatically loaded by init.lua

local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query", -- :InspectTree
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"vim",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- vim.cmd([[
--   augroup _rime
--     autocmd!
--     autocmd InsertEnter * :silent !fcitx5-remote -o
--     autocmd InsertLeave * :silent !fcitx5-remote -o
--     autocmd BufCreate *  :silent !fcitx5-remote -o
--     autocmd BufEnter *  :silent !fcitx5-remote -o
--     autocmd BufLeave *  :silent !fcitx5-remote -o
--   augroup end
--   ]])
