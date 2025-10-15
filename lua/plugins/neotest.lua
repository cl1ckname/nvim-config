local neotest = require("neotest")

local go_config = { -- Specify configuration
	go_test_args = {
		"-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
	},
	testify_enabled = true,
}

local jest_config = {
	jestCommand = "npm test --",
	jestConfigFile = "custom.jest.config.ts",
	env = { CI = true },
	cwd = function(path)
		return vim.fn.getcwd()
	end,
}

neotest.setup({
	adapters = {
		require("neotest-golang")(go_config), -- Apply configuration
		require("neotest-jest")(jest_config),
	},
})
