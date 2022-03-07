return {
	-- Note: nvim-tree needs vim.g stuff to run before performing setup.
	init = function()
		vim.g.nvim_tree_indent_markers = 1
		vim.g.nvim_tree_git_hl = 1
		vim.g.nvim_tree_group_empty = 1
		vim.g.nvim_tree_symlink_arrow = " >> "

		vim.g.nvim_tree_show_icons = {
			git = 1,
			folders = 1,
			files = 0,
			folder_arrows = 0,
		}

		vim.g.nvim_tree_icons = {
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
				unstaged = "✗",
				staged = "✓",
				unmerged = "U",
				renamed = "➜",
				untracked = "*",
				deleted = "x",
				ignored = "◌",
			},
		}

		local r = require("remap").nnoremap
		r("<leader>n", ":NvimTreeToggle<CR>")
	end,

	setup = {
		disable_netrw = false,
		hijack_netrw = true,
		hijack_cursor = true,
	},
}
