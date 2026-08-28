local servers = {
	lua_ls = require("marviuz.utils.servers.lua_ls"),
	eslint = require("marviuz.utils.servers.eslint"),
	biome = require("marviuz.utils.servers.biome"),
	ts_ls = require("marviuz.utils.servers.ts_ls"),
	tailwindcss = require("marviuz.utils.servers.tailwindcss"),
	mdx_analyzer = require("marviuz.utils.servers.mdx_analyzer"),
	emmet_ls = require("marviuz.utils.servers.emmet_ls"),
	-- vue_ls = require("marviuz.utils.servers.vue_ls"),
	angularls = require("marviuz.utils.servers.angularls"),
	intelephense = require("marviuz.utils.servers.intelephense"),
	laravel_ls = require("marviuz.utils.servers.laravel_ls"),
	marksman = require("marviuz.utils.servers.marksman"),
	pylsp = require("marviuz.utils.servers.pylsp"),
	jsonls = require("marviuz.utils.servers.jsonls"),
  rust_analyzer = require('marviuz.utils.servers.rust_analyzer'),
}

return servers
