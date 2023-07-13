return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "tzachar/cmp-tabnine",
    },
    opts = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
            require("luasnip").filetype_extend("typescript", { "javascript" })
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = function(callback)
            callback()
          end,
          ["<C-e>"] = function()
            if cmp.visible() then
              return cmp.close()
            end
            cmp.complete()
          end,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- if cmp.visible() then
          --   cmp.select_next_item()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- -- ["<Tab>"] = cmp.mapping.confirm { select = false },
        -- -- ["<Right>"] = cmp.mapping.confirm { select = false },
        -- ["<C-e>"] = function()
        --   if cmp.visible() then
        --     return cmp.close()
        --   end
        --   cmp.complete()
        -- end,
        -- ["<down>"] = function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end,
        -- ["<up>"] = function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   else
        --     fallback()
        --   end
        -- end,
        -- ["<CR>"] = function(callback)
        --   callback()
        -- end,
        -- ["<Tab>"] = require("cmp").mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.confirm({
        --       behavior = cmp.ConfirmBehavior.Insert,
        --       select = false,
        --     })
        --   elseif require("luasnip").expand_or_jumpable() then
        --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = require("cmp").mapping(function(fallback)
        --   if require("luasnip").jumpable(-1) then
        --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        --   else
        --     fallback()
        --   end
        -- end, { "i" }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
}
