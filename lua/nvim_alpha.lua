
local alpha = require('alpha')
local startify = require('alpha.themes.startify')

startify.section.header.opts = { position = "center" }
startify.section.header.val = {
  [[  ██████╗ ██╗███████╗███████╗███╗   ███╗██╗██╗     ██╗      █████╗ ██╗ ██╗ ]],
  [[  ██╔══██╗██║██╔════╝██╔════╝████╗ ████║██║██║     ██║     ██╔══██╗██║ ██║ ]],
  [[  ██████╔╝██║███████╗███████╗██╔████╔██║██║██║     ██║     ███████║██████║ ]],
  [[  ██╔══██╗██║╚════██║╚════██║██║╚██╔╝██║██║██║     ██║     ██╔══██║██╔═██║ ]],
  [[  ██████╔╝██║███████║███████║██║ ╚═╝ ██║██║███████╗███████╗██║  ██║██║ ██║ ]],
  [[  ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚╝ ]],
}

startify.section.top_buttons.opts = { position = "center" }
startify.section.top_buttons.val = {
  {
    type = "text",
    val  = "Quick links",
    opts = {
      hl = "Type",
      shrink_margin = false,
    }
  },
  { type = "padding", val = 1 },
  startify.button("ee", " New file", "<cmd>ene <CR>"),
  startify.button("ff", " Find file", ":Telescope find_files <CR>"),
  startify.button("fb", " Switch buffer", ":Telescope buffers <CR>"),
  startify.button("fg", " Find text", ":Telescope live_grep <CR>"),
}

startify.section.mru.opts = { position = "center" }
startify.section.mru_cwd.opts = { position = "center" }

startify.section.bottom_buttons.opts = { position = "center" }
startify.section.footer.opts = { position = "center" }

alpha.setup(startify.config)
