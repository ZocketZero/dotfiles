return {
  -- load github theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          -- transparent = true,
        },
      })
    end,
  },
  -- load dracula theme
  { "Mofiqul/dracula.nvim" },
  -- load catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_default",
      -- colorscheme = "catppuccin",
      colorscheme = "dracula",
      -- colorscheme = "tokyonight",
    },
  },
}
