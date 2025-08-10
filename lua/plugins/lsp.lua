return {
  -- plugin to install and manage LSP servers (rust analyzer), debuggers and linters. and a plugin to complement it
  {
    'williamboman/mason.nvim',
    opts = {    
      ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
      }
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {}
  },

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
}
