if not pcall(require, "zen-mode") then
	return
end

require("zen-mode").setup {
	window = {
--		backdrop = 1,
		width = 120,
	},
}
