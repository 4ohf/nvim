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
	--  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
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
	--use "folke/zen-mode.nvim"
	--use 'lervag/vimtex'
	use { "williamboman/mason.nvim" }
	--use "itchyny/lightline.vim"
  -- some other bs {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
