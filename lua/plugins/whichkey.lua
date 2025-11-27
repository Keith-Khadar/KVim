return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  config = function()
    local wk = require("which-key")

    wk.setup()

    wk.add({

      -- Groups
      { "<leader>n", group = "[N]avigation / Explorer" },
      { "<leader>e", group = "[E]dit Configs" },
      { "<leader>f", group = "[F]ind / Telescope" },
      { "<leader>w", group = "[W]indow / Splits" },

      -- Edit configs
      {
        "<leader>ev",
        function()
            vim.cmd("edit $MYVIMRC")
            local current_file_dir = vim.fn.expand('%:p:h')
            require('nvim-tree.api').tree.change_root(current_file_dir)
            vim.defer_fn(function()
                vim.cmd("NvimTreeFindFile")
            end, 100)
        end,
        desc = "[V]imrc/Config"
      },

      -- Telescope
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]iles" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[G]rep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[B]uffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[H]elp Tags" },

      -- Windows
      { "<leader>w=", "<C-w>=", desc = "Equalize Splits" },
      { "<leader>wh", "<C-w>h", desc = "Move Left" },
      { "<leader>wj", "<C-w>j", desc = "Move Down" },
      { "<leader>wk", "<C-w>k", desc = "Move Up" },
      { "<leader>wl", "<C-w>l", desc = "Move Right" },
      { "<leader>ws", "<cmd>split<CR>", desc = "[S]plit Horizontal" },
      { "<leader>wv", "<cmd>vsplit<CR>", desc = "[V]split Vertical" },
    })
  end,
}
