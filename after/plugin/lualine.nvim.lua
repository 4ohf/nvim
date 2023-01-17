if not pcall(require, "lualine.nvim") then
	return
end

require('lualine').setup {
	options = { 
		section_separators = '', component_separators = '|' 
	},
  sections = {
    lualine_x = {'encoding', 'filetype'},
  },
}
