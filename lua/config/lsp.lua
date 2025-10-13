-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.
-- Use :checkhealth lsp to view LSP related diagnostics and to view all of your configured LSP servers.

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'rust-analyzer',
  -- 'sql-server',
})

-- Diagnostics config
vim.diagnostic.config({
    virtual_lines = {
      current_line = true
    },
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘ ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})
