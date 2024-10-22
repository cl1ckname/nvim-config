local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},
	view = {
		docs = {
			auto_open = false,
		},
	},
	completion = {
		autocomplete = false,
		completeopt = "menu"
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = {

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Я не люблю, когда вещи автодополняются на <Enter>
		-- ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp',               keyword_length = 140, }, -- LSP 👄
		{ name = 'nvim_lsp_signature_help' },                 -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                                 -- Luasnip 🐌
		{ name = 'path' },                                    -- Пути 🪤
		{ name = "emoji" },                                   -- Эмодзи 😳
		-- { name = 'buffer' },                    -- Буфферы 🐃
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
