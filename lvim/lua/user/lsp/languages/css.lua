local formatters = require 'lvim.lsp.null-ls.formatters'
formatters.setup {
  {
    command = 'prettier',
    filetypes = { 'css' },
    extra_args = {
      "--print-width=100",
      "--single-quote=true",
      "--jsx-single-quote=true",
      "--single-attribute-per-line=true",
    },
  }
}
