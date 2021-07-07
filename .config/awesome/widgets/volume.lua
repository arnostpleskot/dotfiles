local lain = require("lain")

return lain.widget.pulse {
    settings = function()
        local icon = "墳 "
        local vlevel = icon .. volume_now.left .. "%"
        if volume_now.muted == "yes" then
            vlevel = "婢"
        end
        widget:set_markup(vlevel)
    end
}

