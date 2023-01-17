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
-- Basic Options {{{
local options = {
	number = true,
	relativenumber = true,
	foldmethod = 'marker',
	linebreak = true,
	cursorline = true,
	termguicolors = true,
	tabstop = 2,
	shiftwidth = 2,
	showtabline = 2,
}
-- {{{
for k, v in pairs(options) do
	vim.opt[k] = v
end
-- }}}
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
-- Statusline{{{
-- from: Neovim for Beginners - Status Line
-- https://alpha2phi.medium.com/neovim-for-beginners-statusline-dd0c97fba978
--	local function status_line()
--		local file_name = "%-.25t"
--		local buf_nr = "[%n]"
--		local modified = " %-m"
--		local file_type = " %y"
--		local right_align = "%="
--		local line_no = "%10([%l/%L%)]"
--		local pct_thru_file = "%5p%%"
--	
--		return string.format(
--			"%s%s%s%s%s%s%s",
--			file_name,
--			buf_nr,
--			modified,
--			file_type,
--			right_align,
--			line_no,
--			pct_thru_file
--		)
--	end
--	vim.opt.statusline = status_line()
-- }}}
-- Neovide {{{
if vim.g.neovide then
	vim.g.neovide_cursor_trail_lenght = 0
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_transparency = 0.8
	-- vim.o.guifont = "Jetbrains Mono"
end
-- }}}
-- Packer {{{
--  automatic bs {{{
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
	--}}}
  use "wbthomason/packer.nvim" -- Have packer manage itself
	use "preservim/vim-pencil"
	-- use "junegunn/goyo.vim"
	--  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	--  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	--
	use "folke/tokyonight.nvim"
	use 'ixru/nvim-markdown'
	--  use {
	--    'iamcco/markdown-preview.nvim',
	--    run = function() vim.fn["mkdp#util#install"]() end,
	--  }
	use "nvim-lualine/lualine.nvim"
	use "folke/which-key.nvim"
	use "folke/zen-mode.nvim"
	use 'lervag/vimtex'
	--use "itchyny/lightline.vim"
  -- some other bs {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
-- }}}
