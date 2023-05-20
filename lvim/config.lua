reload 'user.plugins'
reload 'user.options'
reload 'user.keymaps'
reload 'user.lsp'
reload 'user.autocommands'
reload 'user.bufferline'
reload 'user.colorizer'
reload 'user.dial'
reload 'user.emmet-ls'
reload 'user.inlay-hints'
reload 'user.neogit'
reload 'user.neoscroll'
reload 'user.neo-tree'
reload 'user.surround'
reload 'user.telescope'
reload 'user.todo-comments'
reload 'user.treesitter'


-- NEOVIDE CONFIG
if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.o.guifont = "JetBrainsMono Nerd Font:15"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_input_macos_alt_is_meta = true
end
