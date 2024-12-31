return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- enabled = false,
  config = function()
    require("nvim-tree").setup {}
  end,
}
