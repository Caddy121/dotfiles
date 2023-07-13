return {
  --                           ╒═══════════════════════╕
  --                             jose elias typescript
  --                           ╘═══════════════════════╛
  { "jose-elias-alvarez/typescript.nvim" },
  --                              ╒════════════════╕
  --                                nvim-lspconfig
  --                              ╘════════════════╛
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = true,
        underline = false,
        float = {
          border = "rounded",
        },
      },
      {
        function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
          local cmp = require("cmp")
          vim.cmd(":set winhighlight=" .. cmp.config.window.bordered().winhighlight)
        end,
      },
      servers = {
        tsserver = {},
        pyright = {},
        cssls = {},
        html = {},
        tailwindcss = {},
        lua_ls = {},
        yamlls = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              vim.keymap.set(
                "n",
                "<leader>co",
                "TypescriptOrganizeImports",
                { buffer = buffer, desc = "Organize Imports" }
              )
              vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
