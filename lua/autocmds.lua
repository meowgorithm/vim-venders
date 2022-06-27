local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
	pattern = "lua",
	command = "set noexpandtab",
})

-- Highlight current line in current window only
autocmd("WinEnter,BufEnter", { pattern = "*", command = "setlocal cursorline" })
autocmd("WinLeave", { pattern = "*", command = "setlocal nocursorline" })

-- Markdown spell checking
augroup("markdownSpell", { clear = true })
autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell",
	group = "markdownSpell",
})
autocmd("BufRead,BufNewFile", {
	pattern = "*.md",
	command = "setlocal spell",
	group = "markdownSpell",
})
