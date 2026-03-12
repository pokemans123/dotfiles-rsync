require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","pyright","lua_ls","ruff","bashls","beautysh","shellcheck" }
vim.lsp.enable(servers)
vim.keymap.set({'n','v'},'<leader>ca',vim.lsp.buf.code_action, {})
-- read :h vim.lsp.config for changing options of lsp servers 
vim.keymap.set('n','K',vim.lsp.buf.hover, {})
vim.keymap.set('n','gD',vim.lsp.buf.declaration, {})
