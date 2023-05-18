return {
  "folke/which-key.nvim",
  opts = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>a"] = { "gg<S-v>G", "Select All" },
    })
  end,
}
