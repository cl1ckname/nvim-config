local mason = require("mason")
mason.setup()

-- Ensure LSP servers are installed
require("mason-lspconfig").setup({
	ensure_installed = {
		-- From lspconfig.lua
		"yamlls",
		"buf_ls",
		-- "gopls",
		"lua_ls",
		"sqlls",
		"solidity_ls_nomicfoundation",
		"tsserver",
		-- "nil_ls",
		"rust_analyzer",
		"clangd",
		"pyright",
		"dockerls",
	},
	automatic_installation = false,
})

-- Ensure formatters/linters and other tools are installed
require("mason-tool-installer").setup({
	ensure_installed = {
		-- Lua
		"stylua",
		-- Go
		"goimports",
		"gofumpt",
		"gomodifytags",
		"impl",
		-- Web
		"prettier",
		-- Nix
		-- "nixpkgs-fmt",
	},
	-- run_on_start = true,
	start_delay = 100,
	debounce_hours = 24,
})
