local leap = require('leap')
local keymap = vim.keymap

-- Tambahkan default mappings
leap.add_default_mappings()

-- Contoh custom keybindings (opsional)
keymap.set('n', 'f', function() leap.leap { direction = 'forward' } end, { desc = 'Leap forward' })
keymap.set('n', 'F', function() leap.leap { backward = true } end, { desc = 'Leap backward' })
