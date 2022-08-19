-- create function to open file browser when opening a directory
_G.browse_if_dir = function()
	if require("plenary.path"):new(vim.fn.expand("%:p")):is_dir() then
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
		vim.api.nvim_buf_set_option(buf, "buflisted", false)
		vim.api.nvim_buf_set_option(buf, "swapfile", false)
		vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
		require("telescope").extensions.vinegar.file_browser()
	end
end

-- autocommand to run the above function when launching
vim.api.nvim_command("au VimEnter * call v:lua.browse_if_dir()")
