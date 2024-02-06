local lush = require('lush')
local hsl = lush.hsl

local colours = {}

colours.accent = hsl("#B87333")
colours.error = hsl("#FF7B00")
colours.warning = hsl("#FFC086")
colours.white = hsl("#FFFFFF")
colours.black = hsl("#000000")
colours.gray = hsl("#7a7a7a")
colours.border = hsl("#444444")

colours.gray_1 = hsl("#1e1e1e") 
colours.gray_2 = hsl("#2d2d2d")
colours.gray_3 = hsl("#3c3c3c")

colours.gray_10 = hsl("#aeaeae")
colours.gray_15 = hsl("#ececec")

return colours
