-- Import lspconfig dan cmp_nvim_lsp
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Kemampuan tambahan untuk mendukung autocompletion lebih lengkap
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Konfigurasi untuk TypeScript dan JSX/TSX
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

-- Konfigurasi untuk PHP (gunakan Intelephense sebagai language server PHP)
lspconfig.intelephense.setup {
  capabilities = capabilities,
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000;
      };
    }
  }
}

-- ESLint setup untuk mendukung linting JSX/TSX
lspconfig.eslint.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js", ".git"),
}

