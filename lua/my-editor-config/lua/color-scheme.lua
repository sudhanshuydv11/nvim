require("gruvbox").setup({
	undercurl = true,
	underline = true,
	overrides = {
		DiagnosticUnderlineError = { underline = true, sp = "Red" },
		DiagnosticUnderlineInfo = { underline = true, sp = "#8be9fd" },
		DiagnosticUnderlineHint = { underline = true, sp = "#50fa7b" },
		DiagnosticUnderlineOk = { underline = true, sp = "#bd93f9" },
		DiagnosticUnderlineWarn = { underline = true, sp = "#ffb86c" },
	},
})

vim.cmd("colorscheme gruvbox")
