from: Neovim for Beginners - Status Line
https://alpha2phi.medium.com/neovim-for-beginners-statusline-dd0c97fba978
 local function status_line()
 	local file_name = "%-.25t"
 	local buf_nr = "[%n]"
 	local modified = " %-m"
 	local file_type = " %y"
 	local right_align = "%="
 	local line_no = "%10([%l/%L%)]"
 	local pct_thru_file = "%5p%%"
 
 	return string.format(
 		"%s%s%s%s%s%s%s",
 		file_name,
 		buf_nr,
 		modified,
 		file_type,
 		right_align,
 		line_no,
 		pct_thru_file
 	)
 end
 vim.opt.statusline = status_line()
