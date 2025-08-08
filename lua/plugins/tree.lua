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

-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   -- enabled = false,
--   config = function()
--     require("nvim-tree").setup {
--       renderer = {
--         highlight_git = true, -- Enables git highlights
--         -- icons = {
--         --   show = {
--         --     git = false, -- Disable git icons
--         --   },
--         -- },
--       },
--     }
--   end,
-- }
