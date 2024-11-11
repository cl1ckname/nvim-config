-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function(use)
	-- Добавляем Packer в список, чтобы он обновлял сам себя
	use 'wbthomason/packer.nvim'

	use {
		'williamboman/mason.nvim',
		config = function()
			require('plugins/mason')
		end
	}
	use {
		'akinsho/bufferline.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('plugins/bufferline')
		end
	}

	-- LSP SECTION
	use {
		'ray-x/go.nvim',
		requires = {
			'ray-x/guihua.lua'
		},
		config = function()
			require("plugins/go")
		end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require("plugins/lspconfig")
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins/treesitter")
		end,
	}

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins/cmp")
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
		}
	})

	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })

	use("onsails/lspkind-nvim")

	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins/luasnip")
		end,
		-- follow latest release.
	})
	use({ "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } })

	use {
		-- 'folke/tokyonight.nvim',
		--	'NLKNguyen/papercolor-theme'
		'rose-pine/neovim', as = 'rose-pine'
		--'frenzyexists/aquarium-vim'
		--'marko-cerovac/material.nvim'
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require 'window-picker'.setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			require("plugins/neotree")
		end
	}

	use 'ryanoasis/vim-devicons'
	use {
		'nvim-tree/nvim-web-devicons',
		config = function()
			require("plugins/webicons-config")
		end
	}
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup()
		end
	}
	use({
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		--requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
		-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require('render-markdown').setup({})
		end,
	})
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require("plugins/lualine")
		end,
	}

	-- Tests

	use {
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- ----------------------	
			'nvim-neotest/neotest-jest',
			"fredrikaverpil/neotest-golang",
		}
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('plugins/indent')
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
	}

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require('plugins/gitsigns')
		end
	}
	use({
		"dnlhc/glance.nvim",
		config = function()
			require('plugins/glance')
		end,
	})
	use {
		'jdhao/better-escape.vim',
		event = 'InsertEnter',
	}
	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('plugins/dashboard')
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}
	use {
		'stevearc/dressing.nvim',
		config = function()
			require("plugins/dressing")
		end
	}
	use {
		'Allaman/emoji.nvim',
		config = function()
			require('plugins/emoji')
		end,
		after = { "nvim-cmp", "telescope.nvim", "dressing.nvim" }
	}
end)
