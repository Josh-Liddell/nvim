return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Lua lsp setup
      require("lspconfig").lua_ls.setup { capabilites = capabilities }

      -- Python lsp setup
      -- require("lspconfig").pylsp.setup { capabilities = capabilities }
      require("lspconfig").pylsp.setup {
        -- capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = true, ignore = { "W391" }, maxLineLength = 200 },
              pylint = { enabled = false }, -- Disable pylint if not needed
              pyflakes = { enabled = true },
              yapf = { enabled = true },    -- Enable yapf for auto-formatting
            },
          },
        },
      }


      -- This is where it is being setup to format the file using lsp upon writing it
      -- Attaching a file and language server
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" or vim.bo.filetype == "python" then
            -- if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id }) -- "only run it for this buffer on this client"
              end,
            })
          end
        end,
      })
    end,
  }
}
