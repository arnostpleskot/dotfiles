local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local M = {}
M.setup = function(on_attach)
	null_ls.setup({
		sources = {
			diagnostics.hadolint,
			diagnostics.eslint_d,
			diagnostics.fish,

			formatting.prettierd,
			formatting.eslint_d,
			formatting.stylua,
			formatting.shfmt.with({
				filetypes = { "sh", "bash", "zsh" },
			}),

			code_actions.eslint_d,
		},
		on_attach = on_attach,
	})
end

return M
