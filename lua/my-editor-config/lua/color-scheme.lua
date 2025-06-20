require("gruvbox").setup({
  overrides = {
    DiagnosticUnderlineError = { underline = true },
    DiagnosticUnderlineWarn  = { underline = true },
    DiagnosticUnderlineInfo  = { underline = true },
    DiagnosticUnderlineHint  = { underline = true },
    DiagnosticUnderlineOk    = { underline = true },
  }
})

vim.cmd('colorscheme gruvbox')
