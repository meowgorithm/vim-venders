local lsp_ok, _ = pcall(require, "lspconfig")
if not lsp_ok then
	return
end

local inst_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not inst_ok then
	return
end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

local fmt_ok, lsp_format = pcall(require, "lsp-format")
if not fmt_ok then
	return
end

local null_ok, null_ls = pcall(require, "null-ls")
if not null_ok then
	return
end

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		with_diagnostics_code(null_ls.builtins.diagnostics.shellcheck),
	},
})

lsp_format.setup({})

-- TabNine
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
})

-- Setup nvim-cmp.
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "ultisnips" },
		{ name = "cmp_tabnine" },
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
	-- Organize imports on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
	end
end

--[[
local capabilities = vim.tbl_extend(
	"keep",
	cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()) or {},
	lspstatus.capabilities
)
--]]

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = { settings = {} }

	--opts.capabilities = capabilities
	opts.on_attach = on_attach
	opts.capabilities = capabilities

	-- Customize the options passed to the server
	if server.name == "sumneko_lua" then
		opts.settings["Lua"] = {
			diagnostics = {
				globals = { "vim" },
			},
		}
	elseif server.name == "gopls" then
		opts.settings["gopls"] = {
			gofumpt = true,
		}
		opts.flags = {
			debounce_text_changes = 150,
		}
	end

	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
	-- before passing it onwards to lspconfig.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

function OrganizeImports(timeoutMS)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutMS)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end
