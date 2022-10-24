local ok, lualine = pcall(require, "lualine")

if not ok then
	return
end

local colors = require("theme").colors
local navic = require("nvim-navic")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local winbarFilename = {
	"filename",
	cond = conditions.buffer_not_empty,
	path = 1,
	shorting_target = 80,
	symbols = {
		modified = " ",
		readonly = " ", -- Text to show when the file is non-modifiable or readonly.
		unnamed = " ", -- Text to show for unnamed buffers.
		newfile = " ",
	},
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.blue },
	},
}

local lsp = {
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end

		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes

			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "",
	cond = conditions.buffer_not_empty,
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	color = {
		bg = colors.bg0,
	},
}

lualine.setup({
	options = {
		-- theme = bubbles_theme,
		theme = "tokyonight",
		component_separators = "|",
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = { "filetype" },
		lualine_c = { lsp, diagnostics },
		lualine_x = { diff },
		lualine_y = { "branch" },
		lualine_z = {
			"progress",
			"location",
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
	winbar = {
		lualine_a = {
			{
				"filetype",
				cond = conditions.buffer_not_empty,
				icon_only = true,
				colored = false,
			},
		},
		lualine_b = {
			winbarFilename,
		},
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
	},
	inactive_winbar = {
		lualine_a = {
			{
				"filetype",
				cond = conditions.buffer_not_empty,
				icon_only = true,
				colored = false,
			},
		},
		lualine_b = { winbarFilename },
		lualine_c = {},
	},
})
