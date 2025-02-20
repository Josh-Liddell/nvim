return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      -- use the night style
      -- style = "night",
      -- disable italic for functions
      styles = {
        functions = {},
      },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        -- colors.hint = "#ff0000"
        -- colors.error = colors.blue

        colors.bg = "#131720"
        colors.bg_sidebar = "#101218"
        colors.bg_float = "#131720"
        colors.warning = colors.blue
      end
    })
  end
}
