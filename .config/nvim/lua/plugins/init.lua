local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
vim.cmd([[packadd packer.nvim]])

local ok, packer = pcall(require, "packer")

if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 600,
	},
	auto_clean = true,
	compile_on_sync = false,
})

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- UI
	use({ "rmehri01/onenord.nvim" })
	use({ "goolord/alpha-nvim", config = require("plugins.configs.alpha") })
	use({ "kyazdani42/nvim-web-devicons", config = require("plugins.configs.icons") })
	use({
		"nvim-lualine/lualine.nvim",
		config = require("plugins.configs.lualine"),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "folke/which-key.nvim" })
	use({ "jiaoshijie/undotree" })

	-- Syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
		},
		run = ":TSUpdate",
		config = require("plugins.configs.treesitter"),
	})
	use({
		"lewis6991/spellsitter.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			config = require("plugins.configs.spellsitter"),
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins.configs.context"),
	})

	-- Utilities
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.configs.indent") })
	use({ "windwp/nvim-autopairs", config = require("plugins.configs.autopairs") })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = require("plugins.configs.telescope"),
	})
	use({ "norcalli/nvim-colorizer.lua", config = require("plugins.configs.colorizer") })
	use({ "RRethy/vim-illuminate" })
	use({ "numToStr/Comment.nvim", config = require("plugins.configs.comment") })
	use({ "tpope/vim-rsi" })
	use({ "tpope/vim-vinegar" })
	use({ "beauwilliams/focus.nvim", config = require("plugins.configs.focus") })
	use({
		"kylechui/nvim-surround",
		config = require("plugins.configs.surround"),
	})

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		requires = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/typescript.nvim",
		},
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = require("plugins.configs.navic"),
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = require("plugins.configs.cmp"),
	})

	-- -- Snippets
	use({ "kitagry/vs-snippets" })
	use({ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" })

	-- Tmux
	use({ "aserowy/tmux.nvim", config = require("plugins.configs.tmux") })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = require("plugins.configs.gitsigns"),
	})

	-- Rust
	use({
		"simrat39/rust-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		config = require("plugins.configs.rust-tools"),
	})

	use({
		"nvim-neorg/neorg",
		config = require("plugins.configs.neorg"),
		require = {
			"nvim-lua/plenary.nvim",
		},
	})
end)
