--  ________  ________   ________  ________ ___  ___     
-- |\   ____\|\   ___  \|\   __  \|\  _____\\  \|\  \    
-- \ \  \___|\ \  \\ \  \ \  \|\  \ \  \__/\ \  \\\  \   
--  \ \_____  \ \  \\ \  \ \   __  \ \   __\\ \  \\\  \  
--   \|____|\  \ \  \\ \  \ \  \ \  \ \  \_| \ \  \\\  \ 
--     ____\_\  \ \__\\ \__\ \__\ \__\ \__\   \ \_______\
--    |\_________\|__| \|__|\|__|\|__|\|__|    \|_______|
--    \|_________|                                       
--
-- OS specific {{{
if vim.fn.has "win32" then
	vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
-- }}}
-- Autocommands{{{
vim.cmd	'autocmd FileType * set formatoptions-=o'
-- }}}
-- Keymaps {{{
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>g', 	':Goyo<CR>', {Desc})
--vim.keymap.set('n', '<leader>g', 	':ZenMode<CR>')
vim.keymap.set('n', '<leader>p', 	':Pencil<CR>')
vim.keymap.set('n', '<leader>e', 	':Explore<CR>')
vim.keymap.set('n', '<leader>c',	':bd<CR>')
-- }}}
-- require("4ohf.statusline")
-- Neovide {{{
if vim.g.neovide then
	vim.g.neovide_cursor_trail_lenght = 0
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_transparency = 0.8
	-- vim.o.guifont = "Jetbrains Mono"
end
-- }}}
require("4ohf.packer")
