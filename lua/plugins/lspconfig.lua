-- Import lspconfig dan cmp_nvim_lsp
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Kemampuan tambahan untuk mendukung autocompletion lebih lengkap
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.util.default_config =
vim.tbl_deep_extend('force', lspconfig.util.default_config, {
    capabilities = capabilities,
})

-- Fungsi on_attach untuk keybindings khusus LSP di setiap buffer
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Konfigurasi untuk TypeScript dan JSX/TSX
lspconfig.ts_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

-- Konfigurasi untuk PHP (menggunakan Intelephense sebagai language server PHP)
lspconfig.intelephense.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
            },
        }
    }
}

-- ESLint setup untuk mendukung linting JSX/TSX
lspconfig.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js", ".git"),
}

-- Contoh tambahan untuk Python dengan Pyright
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", "pyproject.toml", "setup.py"),
}

-- Golang config
lspconfig.gopls.setup {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- Konfigurasi Diagnostics agar lebih informatif
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Menambahkan ikon untuk diagnostics
local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Keybindings untuk navigasi diagnostics
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap=true, silent=true })

-- Setup untuk nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- Ganti dengan luasnip atau lainnya jika digunakan
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
    },
})

