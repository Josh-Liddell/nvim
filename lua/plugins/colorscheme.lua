return {
  "folke/tokyonight.nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({

      -- transparent background
      transparent = true,

      -- For changing the color pallete:
      on_colors = function(colors)
        -- colors.bg = "#131720"
        -- colors.bg_sidebar = "#101218"
        colors.bg_float = "NONE"
      end,

      -- For changing the color for highlight groups:
      on_highlights = function(highlights, colors)

        ---------- My Adjustments ----------

        highlights["Number"] = { fg = "#fbb2e5" }
        -- highlights["String"] = { fg = "#94a9f6" }
        highlights["Boolean"] = { fg = "#4ad6ff" }
        highlights["Function"] = { fg = "#6086ff" }
        highlights["Type"] = { fg = "#6086ff" }
        highlights["PreProc"] = { fg = "#746eff" }
        highlights["@variable.parameter"] = { fg = "#ffffff" }


        highlights["@property"] = { fg = "#566fcf" }
        highlights["@variable.member"] = { fg = "#465aa9" }
        highlights["@operator"] = { fg = "#D85987" }

        highlights["@type.builtin"] = { fg = "#6086ff" }
        highlights["@punctuation.bracket"] = { fg = "#7fa8f6" }
        highlights["@constructor"] = { fg = "#7fa8f6" }

        ------------------------------------
        -- highlights["@keyword"] = { fg = "#ff7c8b", italic = true }
        -- highlights["Statement"] = { fg = "#ff7c8b", italic = true }
        -- highlights["@keyword.function"] = { fg = "#ff7c8b", italic = true }

        -- highlights["@property"] = { fg = "#465aa9" }


        -- Other colors to test out

        -- highlights["CurSearch"] = { bg = "#efd7ca" }
        -- highlights["@operator"] = { fg = "#f04052" }
        -- highlights["String"] = { fg = "#746eff" }
        -- highlights["@property"] = { fg = "#354c8e" }
        -- highlights["@type.builtin"] = { fg = "#94a9f6" }
        -- highlights["@property"] = { fg = "#4D67A9" }
        -- highlights["String"] = { fg = "#19A88F" }
        -- highlights["@keyword"] = { fg = "#4D67A9" }
        -- highlights["@keyword"] = { fg = "#BCA0DE" }
        -- highlights["Type"] = { fg = "#65BCFF" }


        -- Setting some elements to be transparent
        highlights["StatusLine"] = { bg = "NONE" }
        highlights["StatusLineNC"] = { bg = "NONE" }
        highlights["NeoTreeNormal"] = { bg = "NONE" }
        highlights["NeoTreeNormalNC"] = { bg = "NONE" }
        highlights["NeoTreeEndOfBuffer"] = { bg = "NONE" }

      end,
    })

    vim.cmd.colorscheme("tokyonight") -- apply the color scheme

  end
}
-- For other plugins to use this color pallete read:
-- https://github.com/folke/tokyonight.nvim

-- COLORS TO USE
-- #D4B2E0
-- #D85987
-- #4D67A9
-- #f04052
