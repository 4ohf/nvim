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
