local awful = require("awful")
local wibox = require("wibox")
local lunajson = require('lunajson')

return wibox.widget{
  widget = wibox.container.margin,
  left = 20,
  {
    awful.widget.watch('sensors -j', 15, function (widget, stdout)
      local parsed = lunajson.decode(stdout)
      local temp = parsed['k10temp-pci-00c3']['Tctl']['temp1_input']
      widget:set_text(' '.. math.floor(temp) .. '°C')
    end),
    {
      widget = wibox.container.margin,
      left = 20
    },
    awful.widget.watch('sensors -j', 15, function (widget, stdout)
      local parsed = lunajson.decode(stdout)
      local temp = parsed['amdgpu-pci-0c00']['junction']['temp2_input']
      widget:set_text('﬙ '.. math.floor(temp) .. '°C')
    end),
    {
      widget = wibox.container.margin,
      left = 20
    },
    awful.widget.watch("bash -c \"free -h -t | awk '/Total/ {print $3}'\"", 15, function (widget, stdout)
      widget:set_text(' ' .. string.gsub(stdout, "(%s+)", ""))
    end),
    {
      widget = wibox.container.margin,
      left = 20
    },
    awful.widget.watch("bash -c \"yay -Qu | wc -l\"", 180, function (widget, stdout)
      widget:set_text(' ' .. string.gsub(stdout, "(%s+)", ""))
    end),
    {
      widget = wibox.container.margin,
      left = 20
    },
    awful.widget.watch("bash -c \"pactl list short sources | grep -e \"RUNNING\" | wc -l\"", 15, function (widget, stdout)
      if tonumber(stdout) > 0 then
        widget:set_text('')
      else
        widget:set_text('')
      end
    end),
    {
      widget = wibox.container.margin,
      left = 20
    },
    layout = wibox.layout.fixed.horizontal
  },
}

