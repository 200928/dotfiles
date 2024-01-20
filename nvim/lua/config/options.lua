local options = {
	backup = false, -- 不使用备份
	number = true,
	clipboard = "unnamedplus",
	relativenumber = true,
	timeoutlen = 250, -- 组合按键时间间隔
	cursorline = true,
	guifont = "monospace:h24",
	encoding = "utf-8",
	-- 缩进
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true, -- Tab键和空格键的行为一致，即Tab键插入空格而非Tab字符
	-- 保持光标的位置
	scrolloff = 8, -- keep 8 height offset from above and bottom
	sidescrolloff = 8, -- keep 8 width offset from left and right
	hidden = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- 开启 True-Color，注意：不支持真彩色的终端将显示异常
if vim.fn.has("termguicolors") == 1 then
	-- fix bug for vim
	vim.cmd("set t_8f=[38;2;%lu;%lu;%lum")
	vim.cmd("set t_8b=[48;2;%lu;%lu;%lum")
	-- enable true color
	vim.o.termguicolors = true
end
