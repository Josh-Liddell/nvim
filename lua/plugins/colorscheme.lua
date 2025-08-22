return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({

      -- transparent background
      transparent = true,

      -- Changing the color pallete
      on_colors = function(colors)
        -- Example: Change the "hint" color to the "orange" color, and make the "error" color bright red
        -- colors.hint = "#ff0000"
        -- colors.error = colors.blue
        -- colors.bg = "#131720"
        -- colors.bg_sidebar = "#101218"
        colors.bg_float = "NONE"
        -- colors.error = { fg = colors.error, bg = "NONE" }
        -- colors.warn = { fg = colors.warn, bg = "NONE" }
        -- colors.info = { fg = colors.info, bg = "NONE" }
        -- colors.hint = { fg = colors.hint, bg = "NONE" }
        -- colors.warning = colors.blue
      end,

      -- Changing the color for highlight groups
      on_highlights = function(highlights, colors)

        highlights["Number"] = { fg = "#fbb2e5" }
        highlights["StatusLine"] = { bg = "NONE" }
        highlights["StatusLineNC"] = { bg = "NONE" }
        highlights["NeoTreeNormal"] = { bg = "NONE" }
        highlights["NeoTreeNormalNC"] = { bg = "NONE" }
        highlights["NeoTreeEndOfBuffer"] = { bg = "NONE" }

        highlights["DiagnosticVirtualTextError"] = { fg = colors.error, bg = "NONE" }
        highlights["DiagnosticVirtualTextWarn"] = { fg = colors.warning, bg = "NONE" }
        highlights["DiagnosticVirtualTextInfo"] = { fg = colors.info, bg = "NONE" }
        highlights["DiagnosticVirtualTextHint"] = { fg = colors.hint, bg = "NONE" }

      end,
    })

    vim.cmd.colorscheme("tokyonight") -- apply the color scheme

  end
}

-- For other plugins to use this color pallete read:
-- https://github.com/folke/tokyonight.nvim

