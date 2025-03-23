-- init.lua inside colors directory

-- Specify the name of the colorscheme you want to use
local colorscheme = 'gruvbox' -- Change this to 'tokyonight', 'nord', etc.

-- Require the colorscheme file based on the variable
local colorscheme_config = require('colors.' .. colorscheme)

-- Return the colorscheme configuration
return {colorscheme_config }
