local lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', '<space>rr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>Glance implementations<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>Glance references<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('i', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	-- buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
end

lsp.yamlls.setup {
	{ "yaml", "yaml.docker-compose", "yaml.gitlab", "yml" },
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	settings = {
		yaml = {
			format = {
				enable = true
			},
			schemaStore = {
				enable = true
			}
		}
	},
}

lsp.buf_ls.setup {}

lsp.gopls.setup({
	cmd = { 'gopls' },
	capabilities = capabilities,
	-- for postfix snippets and analyzers
	settings = {
		gopls = {
			buildFlags = { "-tags=wireinject" },
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
				nilness = true,
				unusedwrite = true,
				useany = true,
			},
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			staticcheck = true,
			semanticTokens = true,
			["ui.inlayhint.hints"] = {
				compositeLiteralFields = true,
				constantValues = true,
				parameterNames = true,
				functionTypeParameters = true,
				compositeLiteralTypes = true,
				assignVariableTypes = true,
			},
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			usePlaceholders = true,
		},
	},
	on_attach = function(cl, bfrn)
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require('go.format').goimports()
			end,
			group = format_sync_grp,
		})
		on_attach(cl, bfrn)
	end,
})

-- lsp.golangci_lint_ls.setup{}

lsp.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			diagnostic = {
				globals = { "vim", "cmp" },
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {}
	},
	on_attach = on_attach,
}

lsp.sqlls.setup {}
lsp.solidity_ls.setup {}
lsp.ts_ls.setup {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'html', 'javascript', 'typescript', 'jsx', 'tsx' },
			callback = function()
				require('nvim-ts-autotag').setup()
			end,
		})
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
}
lsp.nil_ls.setup({
	-- Optional: Custom settings for nil
	settings = {
		['nil'] = {
			formatting = {
				command = { "nixpkgs-fmt" }, -- Optional: Auto-format with nixpkgs-fmt
			},
		},
	},
	on_attach = function(client, bufnr)
		-- Enable formatting on save
		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false }) -- Blocking format (sync)
			end,
		})
		on_attach(client, bufnr)
	end,
})

lsp.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		-- Keymaps for Rust
		vim.keymap.set('n', '<leader>cb', ':!bacon check<CR>', { buffer = true, desc = "Bacon check" })
		on_attach(client, bufnr)
	end,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy", -- Bacon will handle background checks
				extraArgs = { "--no-deps" }
			},
			diagnostics = {
				enable = true,
				experimental = { enable = true }, -- More aggressive checks
			},
		}
	},
})
