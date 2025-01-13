return {
  {
    "OXY2DEV/bars-N-lines.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require('bars').setup {
        statusline = false
      }
    end,
  },

  {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    opts = {},
    enabled = true
  },
}
