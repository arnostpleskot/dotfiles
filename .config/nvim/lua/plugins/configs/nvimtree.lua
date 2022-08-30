local nvimtree = require("utils").safeLoad("nvim-tree")

if nvimtree then
	nvimtree.setup({
		hijack_netrw = true,
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		hijack_cursor = true,
		disable_netrw = true,
		actions = {
			change_dir = {
				enable = false,
			},
		},
		view = {
			mappings = {
				list = {
					{ key = "<CR>", action = "edit_in_place" },
				},
			},
		},
	})
end
