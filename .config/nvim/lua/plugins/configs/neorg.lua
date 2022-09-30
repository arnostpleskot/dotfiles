local ok, neorg = pcall(require, "neorg")

if not ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Documents/Norg/Notes/",
					journal = "~/Documents/Norg/Journal",
				},
			},
		},
	},
})
