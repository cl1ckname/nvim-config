local _cmp, cmp = pcall(require, "cmp")
local _luasnip, luasnip = pcall(require, "luasnip")
local _lspkind, lspkind = pcall(require, "lspkind")

if not _cmp or not _lspkind or not _luasnip then
	return
end
cmp.setup {
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Luasnip expand
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
		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<C-[>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['K'] = cmp.mapping(function(fallback)
			if cmp.visible_docs() then
				cmp.close_docs()
			elseif cmp.visible() then
				cmp.open_docs()
			else
				fallback()
			end
		end),
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
			show_labelDetails = true,
			before = function(entry, vim_item)
				vim_item.menu = entry:get_completion_item().detail
				return vim_item
			end
		})
	}
}
