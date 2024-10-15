local lspconfig = require('lspconfig')
-- setup clangd (C/C++/ObjC/ObjC++ support)
-- TODO: abstract each lsp setup
lspconfig.lua_ls.setup({})

lspconfig.clangd.setup({
    cmd = {"clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu", "--completion-style=bundled"}
})

lspconfig.rust_analyzer.setup({})
