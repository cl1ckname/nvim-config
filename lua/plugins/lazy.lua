local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins/mason")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/bufferline")
		end,
	},

	-- LSP SECTION
	{
		"ray-x/go.nvim",
		dependencies = { "ray-x/guihua.lua" },
		config = function()
			require("plugins/go")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins/treesitter")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		config = function()
			require("plugins/none")
		end,
	},

	-- cmp: Autocomplete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins/cmp")
		end,
	},
	{ "onsails/lspkind-nvim" },
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins/luasnip")
		end,
	},

	-- Colorschemes
	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({ transparent = true })
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							bo = {
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			require("plugins/neotree")
		end,
	},

	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({ keymaps = { useDefaults = true } })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("plugins/treesitter-objects")
		end,
	},

	{ "ryanoasis/vim-devicons" },
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/webicons-config")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"3rd/image.nvim",
		config = function()
			require("image").setup()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/lualine")
		end,
	},

	-- Tests
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"fredrikaverpil/neotest-golang",
		},
		config = function()
			require("plugins/neotest")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins/indent")
		end,
	},
	{ "nvim-telescope/telescope.nvim", version = "0.1.8" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns")
		end,
	},
	{
		"dnlhc/glance.nvim",
		config = function()
			require("plugins/glance")
		end,
	},
	{ "jdhao/better-escape.vim", event = "InsertEnter" },
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/dashboard")
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins/dressing")
		end,
	},
	{
		"Allaman/emoji.nvim",
		dependencies = { "nvim-cmp", "nvim-telescope/telescope.nvim", "stevearc/dressing.nvim" },
		config = function()
			require("plugins/emoji")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			require("plugins/prettier")
		end,
	},
})
