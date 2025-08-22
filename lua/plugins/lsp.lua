return {
  -- Using mason helps manage external dependencies from within config
  -- {
  --   "mason-org/mason.nvim",
  --   opts = {
  --     ui = {
  --       icons = {
  --         package_installed = "✓",
  --         package_pending = "➜",
  --         package_uninstalled = "✗"
  --       }
  --     }
  --   }
  -- },

  -- Needed for rust analyzer usage and coldelldb(not set up yet)
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- {
  --   'saecki/crates.nvim',
  --   ft = {"toml"},
  --   config = function()
  --     require("crates").setup {
  --       completion = {
  --         cmp = {
  --           enabled = true
  --         },
  --       },
  --     }
  --     require('cmp').setup.buffer({
  --       sources = { {name = "crates"} }
  --     })
  --   end
  -- },


  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --
  --   end,
  -- },
}
