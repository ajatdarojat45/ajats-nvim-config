-- Konfigurasi nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- Syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Parsers yang akan di-install otomatis
  ensure_installed = {
    "html", "css", "javascript", "typescript", "tsx", "php",
    "bash", "lua", "python", "rust", "go", "java", "json", "yaml", "markdown",
    "sql", "ruby", "cpp", "c"
  },

  -- Auto close tags
  autotag = {
    enable = true,
  },

  -- Rainbow brackets untuk visualisasi tanda kurung
  rainbow = {
    enable = true,
    extended_mode = true, -- Aktifkan untuk lebih banyak tipe kode
    max_file_lines = nil, -- Tidak ada batasan jumlah baris
    colors = {
      "#ff6188", "#fc9867", "#ffd866", "#a9dc76", "#78dce8", "#ab9df2"
    },
  },

  -- Auto-indentasi
  indent = {
    enable = true,
  },

  -- Refactoring tools
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr", -- Tombol untuk rename
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd", -- Tombol untuk pergi ke definisi
        list_definitions = "gnD", -- Tombol untuk daftar definisi
        list_definitions_toc = "gO", -- Tombol untuk daftar definisi di TOC
        goto_next_usage = "<a-*>", -- Tombol untuk penggunaan berikutnya
        goto_previous_usage = "<a-#>", -- Tombol untuk penggunaan sebelumnya
      },
    },
  },

  -- Incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- Tombol untuk mulai pemilihan
      node_incremental = "grn", -- Tombol untuk meningkatkan pemilihan node
      node_decremental = "grm", -- Tombol untuk mengurangi pemilihan node
      scope_incremental = "grc", -- Tombol untuk meningkatkan pemilihan scope
    },
  },

  -- Text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Mencari teks ke depan
      keymaps = {
        ["af"] = "@function.outer", -- Memilih seluruh fungsi
        ["if"] = "@function.inner", -- Memilih isi fungsi
        ["ac"] = "@class.outer", -- Memilih seluruh kelas
        ["ic"] = "@class.inner", -- Memilih isi kelas
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Menyimpan langkah untuk navigasi
      goto_next_start = {
        ["]m"] = "@function.outer", -- Pergi ke awal fungsi berikutnya
        ["]]"] = "@class.outer", -- Pergi ke awal kelas berikutnya
      },
      goto_next_end = {
        ["]M"] = "@function.outer", -- Pergi ke akhir fungsi berikutnya
        ["]["] = "@class.outer", -- Pergi ke akhir kelas berikutnya
      },
      goto_previous_start = {
        ["[m"] = "@function.outer", -- Pergi ke awal fungsi sebelumnya
        ["[["] = "@class.outer", -- Pergi ke awal kelas sebelumnya
      },
      goto_previous_end = {
        ["[M"] = "@function.outer", -- Pergi ke akhir fungsi sebelumnya
        ["[]"] = "@class.outer", -- Pergi ke akhir kelas sebelumnya
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner", -- Menukar parameter ke depan
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner", -- Menukar parameter sebelumnya
      },
    },
  },
}

-- Konfigurasi LSP untuk diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

-- Navigasi Diagnostics
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap=true, silent=true })

