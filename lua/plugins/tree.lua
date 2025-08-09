return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("neo-tree").setup({

      -- This was one way that I disabled status column for neotree
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.statuscolumn = ""
          end,
        },
      },


    })
  end,
}
