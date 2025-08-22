-- {
--   -- Command and arguments to start the server.
--   cmd = { 'lua-language-server' },
--
--   -- Filetypes to automatically attach to.
--   filetypes = { 'lua' },
--
--   -- Sets the "root directory" to the parent directory of the file in the
--   -- current buffer that contains either a ".luarc.json" or a
--   -- ".luarc.jsonc" file. Files that share a root directory will reuse
--   -- the connection to the same LSP server.
--   -- Nested lists indicate equal priority, see |vim.lsp.Config|.
--   root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
--
--   -- Specific settings to send to the server. The schema for this is
--   -- defined by the server. For example the schema for lua-language-server
--   -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--     }
--   }
-- }
--


return {
  -- Command and arguments to start the server
  cmd = { 'pyright-langserver', '--stdio' },

  -- Filetypes to attach to
  filetypes = { 'python' },

  root_markers = { '.git' },

  -- Root directory markers
  -- root_markers = require('lspconfig.util').root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'),

  -- Server-specific settings
  -- settings = {
  --   python = {
  --     analysis = {
  --       typeCheckingMode = "basic",  -- can be "off", "basic", "strict"
  --       autoSearchPaths = true,
  --       useLibraryCodeForTypes = true,
  --     }
  --   }
  -- }
}
