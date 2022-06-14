local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

telescope.setup({
	picker = {
		hidden = false,
	},
	defaults = {
		prompt_prefix = "     ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.80,
			height = 0.85,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		mappings = {
			i = {
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
				["<C-Down>"] = require("telescope.actions").cycle_history_next,
				["<C-Up>"] = require("telescope.actions").cycle_history_prev,
			},
			n = {
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
				["<C-Down>"] = require("telescope.actions").cycle_history_next,
				["<C-Up>"] = require("telescope.actions").cycle_history_prev,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})

telescope.load_extension("ui-select")