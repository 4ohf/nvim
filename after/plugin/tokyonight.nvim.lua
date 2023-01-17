if not pcall(require, "tokyonight") then
	return
end

require("tokyonight").setup{
	style = night,
	transparent = true,
}

vim.cmd'colorscheme tokyonight'
