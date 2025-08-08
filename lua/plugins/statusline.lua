return {
  {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    opts = {
      style = "fg",
    },
    dependencies = {
      { 'echasnovski/mini.nvim', version = false },
      'lewis6991/gitsigns.nvim',
    }
  },

}
