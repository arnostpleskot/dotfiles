local ok, wk = pcall(require, "which-key")

if not ok then
	return
end

local options = {
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}

local optionsN = {
	mode = "n",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}

local optionsV = {
	mode = "v",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}

wk.register({
	-- [[Illuminate]]
	["<Tab>"] = { "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>", "[ILLUMINATE] Next reference" },
	["<S-Tab>"] = {
		"<cmd>lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>",
		"[ILLUMINATE] Next reference",
	},

	-- [[ Telescope ]]
	["<leader>f"] = {
		name = "[TELESCOPE]",
		f = { "<cmd>Telescope find_files hidden=true<cr>", "[TELESCOPE] Find File" },
		g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep" },
		b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "[TELESCOPE] Help tags" },
		m = { "<cmd>Telescope marks<cr>", "[TELESCOPE] Marks" },
		c = { "<cmd>Telescope git_status<cr>", "[TELESCOPE] Git changes" },
	},

	["<C-Space>"] = { "<cmd>Telescope oldfiles only_cwd=true<cr>", "[TELESCOPE] Recent" },

	-- [[ Gitsigns ]]
	["<leader>g"] = {
		name = "[GITSIGNS]",
		s = { "<cmd>Gitsigns toggle_signs<cr>", "[GITSIGNS] Toggle signs" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "[GITSIGNS] Preview hunk" },
		d = { "<cmd>Gitsigns diffthis<cr>", "[GITSIGNS] Show diff" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "[GITSIGNS] Prev hunk" },
		h = { "<cmd>Gitsigns next_hunk<cr>", "[GITSIGNS] Next hunk" },
	},

	-- [[ UI ]]
	["<leader>u"] = {
		name = "[UI]",
		u = { "<cmd>UndotreeToggle<cr>", "[UI] Undotree" },
		a = { "<cmd>Alpha<cr>", "[UI] Alpha" },
	},

	-- [[ Window ]]
	["<leader>w"] = {
		name = "[Window]",
		["\\"] = { "<cmd>vsplit<CR>", "[Window] split vertical" },
		["|"] = { "<cmd>vsplit<CR>", "[Window] split vertical" },
		["-"] = { "<cmd>split<CR>", "[Window] split horizontal" },
		h = { "<C-w>K", "[Window] vertical to horizontal" },
		v = { "<C-w>H", "[Window] horizontal to vertical" },

		-- switching panes
		m = { "<C-W>h", "switch pane to left" },
		n = { "<C-W>j", "switch pane to down" },
		e = { "<C-W>k", "switch pane to up" },
		i = { "<C-W>l", "switch pane to right" },
	},

	-- [[ LSP ]]
	K = "[LSP] hover",
	["<leader>d"] = "[DIAGNOSTIC] open float",
	["<M-CR>"] = "[LSP] code action",
	["<leader>l"] = {
		name = "[LSP]",
		p = "[DIAGNOSTIC] prev",
		n = "[DIAGNOSTIC] next",
		q = "[DIAGNOSTIC] open list",

		D = "[LSP] definition",
		r = "[LSP] rename",
		f = "[LSP] format",

		w = {
			name = "[WORKSPACE]",
			a = "[WORKSPACE] add workspace folder",
			r = "[WORKSPACE] remove workspace folder",
			l = "[WORKSPACE] list workspace folders",
		},
	},
	g = {
		D = "[LSP] declaration",
		d = "[LSP] definition",
		r = "[LSP] reference",
		i = "[LSP] implementation",
	},

	-- global shortcuts
	["<C-q>"] = { "<cmd>q<CR>", "close window" },
	["<C-s>"] = { "<cmd>wa<CR>", "save all app" },
}, optionsN)

wk.register({
	["<"] = { "<gv", "Shift to left" },
	[">"] = { ">gv", "Shift to right" },
}, optionsV)

wk.register({
	-- Colemak
	-- movement
	m = { "h", "move Left" },
	n = { "gj", "move Down" },
	e = { "gk", "move Up" },
	i = { "l", "move Right" },
	t = { "i", "(t)ype - replaces (i)nsert" },
	T = { "I", "(T)ype - replaces (I)nsert" },
	E = { "e", "end of word - replaces (e)nd" },
	h = { "n", "next match - replaces (n)ext" },
	k = { "N", "previous match - replaces (N) prev" },
	M = { "m|", "mark - replaces (m)ark" },

	-- page up/down
	["<A-e>"] = { "<C-b>H", "page up" },
	["<A-n>"] = { "<C-f>", "page down" },

	-- moving on line
	["<A-m>"] = { "g^", "move cursor to start of line" },
	["<A-i>"] = { "g$", "move cursor to end of line" },
}, options)

wk.setup({})
