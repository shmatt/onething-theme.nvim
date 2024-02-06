
local M = {}
M.theme = function()
  local onething_colours = require("lush_theme.onething-colours")
  local colors = {
    darkgray = onething_colours.white.mix(onething_colours.black, 80).hex,
    gray = onething_colours.gray.hex,
    innerbg = onething_colours.white.mix(onething_colours.black, 90).hex,
    outerbg = onething_colours.white.mix(onething_colours.black, 75).hex,
    normal = onething_colours.gray.hex,
    insert = onething_colours.white.hex,
    visual = onething_colours.accent.hex, 
    replace = onething_colours.error.hex, 
    command = onething_colours.warning.hex,
  }
  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end
return M
