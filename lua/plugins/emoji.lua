require("emoji").setup({
	plugin_path = vim.fn.expand("$HOME/.local/share/nvim/site/pack/packer/opt/"),
	enable_cmp_integration = true,
})

require('telescope').load_extension 'emoji'
-- optional for telescope integration
