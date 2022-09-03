local cmp = require("cmp")
local lsp_format = require("lsp-format")

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

-- Organize Imports
-- From caarlos0
--
-- https://github.com/caarlos0/dotfiles.fish/blob/main/nvim/config/lua/user/lsp.lua
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function OrganizeImports(timeoutms)
	local clients = vim.lsp.buf_get_clients()
	for _, client in pairs(clients) do
		local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end
end

lsp_format.setup({})

-- Setup nvim-cmp.
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "ultisnips" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmdline" },
		{ name = "emoji" },
		{ name = "calc" },
		{ name = "spell" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype({
	sources = cmp.config.sources({
		{ name = "buffer" },
	}, {
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you installed it.
	}),
}, "gitcommit")

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local mapping_opts = { noremap = true, silent = true }

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local set_keymap = function(key, cmd)
	vim.api.nvim_set_keymap("n", key, cmd, mapping_opts)
end
set_keymap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
set_keymap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
set_keymap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
set_keymap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Use an on_attach function to only map the following keys after the language
-- server attaches to the current buffer
local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = true
	lsp_format.on_attach(client)

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local map = function(key, cmd)
		vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, mapping_opts)
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	map("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	map("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	map("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	map("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	map("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	map("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	map("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	map("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	map("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

	if client.resolved_capabilities.document_formatting and client.name ~= "sumneko_lua" then
		vim.cmd([[
			augroup lsp_formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
			augroup END
		]])
	end

	-- From caarlos0:
	--
	-- If the organizeImports codeAction runs for lua files, depending on
	-- where the cursor is, it'll reorder the args and break stuff.
	-- This took me way too long to figure out.
	--
	-- https://github.com/caarlos0/dotfiles.fish/blob/main/nvim/config/lua/user/lsp.lua
	if client.name ~= "null-ls" and client.name ~= "sumneko_lua" then
		vim.cmd([[
			augroup lsp_organize_imports
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua OrganizeImports(150)
			augroup END
		]])
	end
end

local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require", "pcall", "pairs" },
			},
		},
	},
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
	flags = {
		debounce_text_changes = 150,
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		with_diagnostics_code(null_ls.builtins.diagnostics.shellcheck),
	},
	capabilities = capabilities,
	on_attach = on_attach,
})
