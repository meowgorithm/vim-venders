return {
	-- Note: nvim-tree needs vim.g stuff to run before performing setup.
	init = function()
		local r = require("remap").nnoremap
		r("<leader>n", ":NvimTreeToggle<CR>")
	end,

	setup = {
		disable_netrw = false,
		hijack_netrw = true,
		hijack_cursor = true,
		renderer = {
			highlight_git = true,
			group_empty = true,
			icons = {
				symlink_arrow = " >> ",
				show = {
					git = true,
					folder = true,
					file = false,
					folder_arrow = false,
				},
				glyphs = {
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "▶",
						open = "▼",
						empty = "▼",
						empty_open = "▼",
						symlink = "*",
						symlink_open = "!",
					},
					git = {
						unstaged = "!",
						staged = "✓",
						unmerged = "U",
						renamed = "➜",
						untracked = "*",
						deleted = "✗",
						ignored = "◌",
					},
				},
			},
			indent_markers = {
				enable = true,
				icons = {
					corner = "╰ ",
					edge = "│ ",
					none = "  ",
				},
			},
		},
	},
}
