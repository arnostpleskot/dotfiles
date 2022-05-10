local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

local colors = require("theme").colors

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}
