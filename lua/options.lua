vim.g.mapleader = ","
vim.g.maplocalleader = ","

local options = {
	compatible = false,
	backup = false,
	writebackup = false,
	swapfile = false,
	shell = "bash",
	number = true,
	wrap = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	termguicolors = true,
	showmatch = true,
	colorcolumn = "80",
	mouse = "a",
	spell = false,
	spelllang = { "en_us" },
	cursorline = true,
	ruler = true,
	signcolumn = "yes",
	listchars = "tab:▸ ,trail:·,eol:¶",
	splitbelow = true,
	splitright = true,

	-- Search
	hlsearch = false,
	ignorecase = true,
	incsearch = true, -- search as you type
	wrapscan = true, -- wrap around the end of the file

	-- Persistent undo
	undofile = true,
	undodir = vim.fn.stdpath("data") .. "/undo",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("colorscheme x")

-- Highlight current line in current window only
vim.cmd([[
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
]])

-- Markdown spell checking
vim.cmd([[
    augroup markdownSpell
        autocmd!
        autocmd FileType markdown setlocal spell
        autocmd BufRead,BufNewFile *.md setlocal spell
    augroup END
]])

-- Visual Mode Blockwise Indent. This keeps the current visual block selection
-- active after changing indent with '<' or '>'. Usually the visual block
-- selection is lost after you shift it, which is incredibly annoying.
--
-- http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vim.cmd([[
    vmap > >gv
    vmap < <gv
]])

vim.keymap.set("n", "S", ":split<CR>")
vim.keymap.set("n", "VS", ":vsplit<CR>")
vim.keymap.set("n", "<leader>i", ":set invlist<CR>")
vim.keymap.set("n", "<leader>s", ":set hlsearch! hlsearch?<CR>")
vim.keymap.set("n", "<leader>w", ":set wrap! wrap?<CR>")
