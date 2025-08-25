-- TODO: This is an example
-- NOTE: This is an example
-- HACK: This is an example
-- PERF: This is an example
-- WARNING: This is an example
-- FIX: This is an example

return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = 'VimEnter',
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
