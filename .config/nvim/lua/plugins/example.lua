return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        layout = {
          layout = {
            width = 30,
          },
        },
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
          },
        },
      },
    },
  },
  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require("venv-selector").setup()
  --   end,
  -- },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    version = "^5",
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     window = { width = 30 },
  --   },
  -- },
}
