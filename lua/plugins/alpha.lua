return {
  --
  -- alpha dashboard
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                    ",
      "  ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                    ",
    }
    -- if x86_64, use type color, else use string color
    if vim.fn.system("uname -m") == "x86_64\n" then
      dashboard.section.header.opts.hl = 'Function'
    else
      dashboard.section.header.opts.hl = 'String'
    end

    -- Set buttons
    dashboard.section.buttons.val = {
      dashboard.button("r", "󰁯  >  [R]estore [S]ession", "<cmd>SessionRestore<CR>"),
      dashboard.button("n", "  >  [N]ew File", "<cmd>ene<CR>"),
      dashboard.button("f", "󰱼  >  [S]earch [F]ile", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "  >  [S]earch [G]rep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("t", "  >  [T]oggle [T]ree", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("q", "⏏  >  [Q]uit NVIM", "<cmd>qa<CR>"),
    }

    -- Set footer
    dashboard.section.footer.val = {
      vim.fn.strftime("%A, %d %B %Y"),
    }
    dashboard.section.footer.opts.hl = "Type"

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
