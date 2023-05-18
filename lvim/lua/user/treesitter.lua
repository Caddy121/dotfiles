lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cmake",
  "css",
  "diff",
  "gitignore",
  "graphql",
  "help",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "jsonc",
  "lua",
  "markdown",
  "markdown_inline",
  "norg",
  "org",
  "python",
  "query",
  "regex",
  "scss",
  "sql",
  "svelte",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "yaml",
  "json",
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "help" }

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["at"] = "@class.outer",
      ["it"] = "@class.inner",
      ["ac"] = "@call.outer",
      ["ic"] = "@call.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
      ["a/"] = "@comment.outer",
      ["i/"] = "@comment.inner",
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",
      ["as"] = "@statement.outer",
      ["is"] = "@scopename.inner",
      ["aA"] = "@attribute.outer",
      ["iA"] = "@attribute.inner",
      ["aF"] = "@frame.outer",
      ["iF"] = "@frame.inner",
    },
  },
}
