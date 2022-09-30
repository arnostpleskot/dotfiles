local _M = {}

_M.signs = { Error = "", Warn = "", Hint = "", Info = "" }
_M.setSpacesSize = function(filetypes)
	for filetype, size in pairs(filetypes) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetype,
			callback = function()
				vim.opt.shiftwidth = size
				vim.opt.tabstop = size
			end,
		})
	end
end

_M.buf_command = function(bufnr, name, fn, opts)
	vim.api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

_M.table = {
	some = function(tbl, cb)
		for k, v in pairs(tbl) do
			if cb(k, v) then
				return true
			end
		end
		return false
	end,
}

_M.safeLoad = function(packageName)
	local ok, loadedPackage = pcall(require, packageName)

	if ok then
		return loadedPackage
	end

	vim.notify(packageName .. " did not load", vim.log.levels.ERROR)
end

return _M
