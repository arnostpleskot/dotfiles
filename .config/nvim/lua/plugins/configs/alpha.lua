local ok, alpha = pcall(require, "alpha")

if ok then
    local dashboard = require "alpha.themes.dashboard"

    local function button(sc, txt, keybind, keybind_opts)
        local b = dashboard.button(sc, txt, keybind, keybind_opts)
        b.opts.hl = "DashboardShortCut"
        b.opts.hl_shortcut = "DashboardHeader"
        return b
    end
    dashboard.section.header.val = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "           ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ",
        "         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒        ",
        "       ▒▒▒▒▒▒▒▒   ▒▒▒▒   ▒▒▒▒▒▒▒▒      ",
        "      ▒▒▒▒▒▒▒▒▒ ██▒▒▒▒ ██▒▒▒▒▒▒▒▒▒     ",
        "      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
        "      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
        "      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
        "      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
        "      ▒▒▒▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒     ",
        "",
        "      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
    }
    dashboard.section.buttons.val = {
        button("␣ f f", "  Find File", "<cmd>Telescope find_files<cr>"),
        button("␣ f o", "  Recents", "<cmd>Telescope oldfiles<cr>"),
        button("␣ f g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
        button("␣ f m", "  Bookmarks", "<cmd>Telescope marks<cr>"),
    }
    dashboard.section.footer.val = ""
    dashboard.section.footer.opts.hl = "DashboardFooter"

    alpha.setup(dashboard.opts)
end
