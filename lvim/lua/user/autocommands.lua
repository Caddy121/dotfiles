local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--  ╒═════════════════════════════════════════════════════════════════════════╕
--    Do not add additional comments when entering next line after commenting
--  ╘═════════════════════════════════════════════════════════════════════════╛
local FormatOptions = augroup('FormatOptions', { clear = true })
autocmd('BufEnter', {
  group = FormatOptions,
  pattern = '*',
  desc = 'Set buffer local formatoptions.',
  callback = function()
    vim.opt_local.formatoptions:remove {
      'r', -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
      'o', -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
    }
  end,
})
--                           ╒═══════════════════════╕
--                             Treesitter no conceal
--                           ╘═══════════════════════╛
autocmd({ 'Filetype' }, {
  pattern = { 'json', 'jsonc' },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Briefly highlight yanked
-- autocmd({ "CursorHold" }, {
--   callback = function()
--     local status_ok, luasnip = pcall(require, "luasnip")
--     if not status_ok then
--       return
--     end
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end,
-- })
