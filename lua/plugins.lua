local ok, packer = pcall(require, "plugins.packer")
if not ok then
    print("warning: could not load packer")
    return
end

packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself

    use("nvim-lua/plenary.nvim")
    use("preservim/nerdcommenter")
    --use("tpope/vim-fugitive")
    --use("nvim-telescope/telescope.nvim")

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
			]]        )
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
        --tag = "release",
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
            require("trouble").setup(require("plugins.trouble"))
        end,
    })
    use("williamboman/nvim-lsp-installer")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "lukas-reineke/lsp-format.nvim" })
    --use("rafamadriz/friendly-snippets")
    --use("lukas-reineke/indent-blankline.nvim")
    --use("onsails/lspkind-nvim")
    --use("simrat39/symbols-outline.nvim")
    --use("ray-x/lsp_signature.nvim")
    --use("RRethy/vim-illuminate")
end)
