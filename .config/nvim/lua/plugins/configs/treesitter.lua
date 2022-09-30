local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
	return
end

treesitter.setup({
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"dockerfile",
		"elixir",
		"erlang",
		"fish",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"make",
		"markdown",
		"norg",
		"prisma",
		"ql",
		"query",
		"regex",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
