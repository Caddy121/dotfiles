require "user.lsp.languages.rust"
require "user.lsp.languages.go"
require "user.lsp.languages.python"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"
require "user.lsp.languages.css"

lvim.lsp.diagnostics.virtual_text = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "tsserver",
  "pyright",
  "cssls",
  "html",
  "tailwindcss",
  "lua_ls",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "google_java_format", filetypes = { "java" } },
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt",  filetypes = { "sh", "zsh" } },
  {
    command = "prettier",
    filetypes = { "css", 'html', 'javascript', 'javascriptreact', 'scss', 'typescript',
      'typescriptreact', 'json' },
    extra_args = {
      "--print-width=100",
      "--single-quote=true",
      "--jsx-single-quote=true",
      "--single-attribute-per-line=true",
    },
  },
}

require("lvim.lsp.manager").setup("emmet_ls")

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }
