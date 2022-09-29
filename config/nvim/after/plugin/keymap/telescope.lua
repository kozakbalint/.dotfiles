local Remap = require("cossuck.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")

nnoremap("<Leader>pf", function ()
    require('telescope.builtin').find_files()
end)

nnoremap("<Leader>ps", function ()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
