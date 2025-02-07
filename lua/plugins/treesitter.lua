local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	ensure_installed = {
		"c",
		"markdown",
		"tsx",
		"typescript",
		"go",
		"javascript",
		"toml",
		"json",
		"yaml",
		"sql",
		"rust",
		"css",
		"html",
		"lua",
		"vim",
		"vimdoc",
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
	pattern = '*.abi',
	callback = function(args)
		vim.treesitter.start(args.buf, 'json')
	end
})
