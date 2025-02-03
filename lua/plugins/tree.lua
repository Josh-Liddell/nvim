return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- enabled = false,
  config = function()
    require("nvim-tree").setup {
      renderer = {
        highlight_git = true, -- Enables git highlights
        icons = {
          show = {
            git = false, -- Disable git icons
          },
        },
      },
    }
  end,
}
