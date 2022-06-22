local ok, packer = pcall(require, "plugins.packer")
if not ok then
	print("warning: could not load packer")
	return
end

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("nvim-lua/plenary.nvim")
	use("preservim/nerdcommenter")
	use("tpope/vim-fugitive")
	use("jamessan/vim-gnupg")
	use({
		"fatih/vim-go",
		config = function()
			vim.cmd([[
                let g:go_highlight_functions = 1
                let g:go_highlight_function_parameters = 1
                let g:go_highlight_function_calls = 1
                let g:go_highlight_operators = 1
                let g:go_highlight_methods = 1
                let g:go_highlight_structs = 1
                let g:go_highlight_trailing_whitespace_error = 1
                let g:go_highlight_space_tab_error = 1
                let g:go_highlight_types = 1
                let g:go_highlight_extra_types = 1
                let g:go_highlight_chan_whitespace_error = 1
                let g:go_highlight_array_whitespace_error = 1
                let g:go_highlight_build_constraints = 1
                let g:go_highlight_generate_tags = 1
                let g:go_highlight_fields = 1
                let g:go_highlight_string_spellcheck = 1
                let g:go_highlight_format_strings = 1
                let g:go_highlight_varaible_declarations = 1
                let g:go_highlight_varaible_assignments = 1
                let g:go_auto_sameids = 0
                let g:go_auto_type_info = 0
                let g:go_fmt_autosave = 0
                let g:go_imports_autosave = 0
                let g:go_fmt_options = {}
                let g:go_mod_fmt_autosave = 0
                let g:go_metalinter_autosave = 0
                let g:go_template_autocreate = 0
                let g:go_jump_to_error = 0
            ]])
		end,
	})

	use({
		"vim-scripts/BufOnly.vim",
		config = function()
			require("remap").nnoremap("BO", ":wa<CR>:BufOnly<CR>")
		end,
	})

	use({
		"ctrlpvim/ctrlp.vim",
		config = function()
			require("plugins.ctrlp")
		end,
	})

	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			vim.cmd([[
				let g:Hexokinase_ftEnabled = []
			]])
		end,
	})

	if vim.fn.has("python3") then
		use({
			"SirVer/ultisnips",
			config = function()
				vim.g.UltiSnipsExpandTrigger = "<tab>"
				vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
				vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
				vim.g.UltiSnipsEditSplit = "vertical"
				vim.g.UltiSnipsEditSplit = "vertical"
				vim.g.UltiSnipsSnippetsDir = vim.fn.stdpath("config") .. "/UltiSnips"
			end,
		})
	end

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "powerline_dark",
					icons_enabled = false,
					component_separators = "",
					section_separators = "",
				},
			})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			local tree = require("plugins.tree")
			tree.init()
			require("nvim-tree").setup(tree.setup)
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup(require("plugins.gitsigns"))
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-calc")
	use("f3fora/cmp-spell")
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				icons = false,
				fold_open = "▼", -- icon used for open folds
				fold_closed = "▶", -- icon used for closed folds
				indent_lines = false, -- add an indent guide below the fold icons
				signs = {
					-- icons / text used for a diagnostic
					error = "error",
					warning = "warn",
					hint = "hint",
					information = "info",
				},
				use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
			})
		end,
	})
	use("williamboman/nvim-lsp-installer")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "lukas-reineke/lsp-format.nvim" })
end)
