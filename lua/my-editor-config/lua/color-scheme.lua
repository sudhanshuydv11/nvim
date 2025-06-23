
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  overrides = {
    DiagnosticUnderlineError = { underline = true, sp = "#f1fa8c" },
    DiagnosticUnderlineInfo  = { underline = true, sp = "#8be9fd" },
    DiagnosticUnderlineHint  = { underline = true, sp = "#50fa7b" },
    DiagnosticUnderlineOk    = { underline = true, sp = "#bd93f9" },
  },
})

vim.cmd("colorscheme gruvbox")
