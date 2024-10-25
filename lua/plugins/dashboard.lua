local header = {
	[[ ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░ ]],
	[[ ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
	[[ ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
	[[ ░▒▓█▓▒░      ░▒▓██████▓▒░    ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░   ]],
	[[ ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░         ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
	[[ ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░         ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
	[[ ░▒▓████████▓▒░▒▓████████▓▒░  ░▒▓█▓▒░  ░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░ ]],
	[[ ]],
	[[ ]],
	[[ ]],
	[[ ]],

}
-- local header = {
-- 	"", "", "", "", "", "",
-- 	[[ ███▄    █     ▒█████      ██▓    ▄████▄     ▓█████   ]],
-- 	[[ ██ ▀█   █    ▒██▒  ██▒   ▓██▒   ▒██▀ ▀█     ▓█   ▀   ]],
-- 	[[▓██  ▀█ ██▒   ▒██░  ██▒   ▒██▒   ▒▓█    ▄    ▒███     ]],
-- 	[[▓██▒  ▐▌██▒   ▒██   ██░   ░██░   ▒▓▓▄ ▄██▒   ▒▓█  ▄   ]],
-- 	[[▒██░   ▓██░   ░ ████▓▒░   ░██░   ▒ ▓███▀ ░   ░▒████▒  ]],
-- 	[[░ ▒░   ▒ ▒    ░ ▒░▒░▒░    ░▓     ░ ░▒ ▒  ░   ░░ ▒░ ░  ]],
-- 	[[░ ░░   ░ ▒░     ░ ▒ ▒░     ▒ ░     ░  ▒       ░ ░  ░  ]],
-- 	[[   ░   ░ ░    ░ ░ ░ ▒      ▒ ░   ░              ░     ]],
-- 	[[         ░        ░ ░      ░     ░ ░            ░  ░  ]],
-- 	[[                                 ░                    ]]
-- }
require('dashboard').setup {
	config = {
		packages = { enable = false },
		header = header,
		week_header = {
			enable = false,
			append = { "for true { code() }" },
		},
		footer = { "󱎓 It's time to make great things " },
		shortcut = {
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				desc = '  New file',
				group = 'Macro',
				key = 'n',
				action = 'enew',
			},
			{
				desc = ' Config nvim',
				group = '@conditional',
				key = 'c',
				action = ':execute \'cd \' . fnamemodify(expand(\'$MYVIMRC\'), \':h\') | enew',
			},
		}
	},
	theme = 'hyper',
}