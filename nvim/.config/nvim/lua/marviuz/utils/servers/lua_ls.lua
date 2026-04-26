return {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			completion = { callSnippet = "Replace" },
		},
	},
}