require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "cmake", "vim", "vimdoc", "json", "bash", "python", "html", "css", "javascript",
                        "doxygen", "glsl", "hlsl", "java", "kotlin", "nix", "sql", "yaml", "toml", "zig", "rust", "lua",
                        "markdown"},
    auto_install = false,
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})
