local _cmp, cmp = pcall(require, "cmp")
local _luasnip, luasnip = pcall(require, "luasnip")
local _lspkind, lspkind = pcall(require, "lspkind")
local types = require('cmp.types')

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
		['<C-g>'] = cmp.mapping.complete({ config = {
			sources = {
				{ name = 'luasnip' },
			},
			snippet = {

				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Luasnip expand
				end,
			},

		} }, { 'i' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Я не люблю, когда вещи автодополняются на <Enter>
		-- Используем <C-e> для того чтобы прервать автодополнение
		[';'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		[')'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
		['('] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['K'] = cmp.mapping(function(fallback)
			if cmp.visible_docs() then
				cmp.close_docs()
			elseif cmp.visible() then
				cmp.open_docs()
			else
				fallback()
			end
		end),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
				-- elseif has_words_before() then
				--     cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp',
			keyword_length = 140,
			entry_filter = function(entry, ctx)
				local kind = types.lsp.CompletionItemKind[entry:get_kind()]

				if kind == "Text" then return false end
				return true
			end,
		},                              -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'nvim_lua' },
		-- { name = 'neodev' },
		-- { name = 'path' }, -- Пути 🪤
		-- { name = "emoji" }, -- Эмодзи 😳
		-- { name = 'buffer' },                    -- Буфферы 🐃
	}, {
	}),
	formatting = {
		fields = {
			"kind",
			"abbr",
			"menu",
		},
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

-- Use buffer source for `/` & `?`.
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = { { name = "path" }, { name = "cmdline" } },
-- })
