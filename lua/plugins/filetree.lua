return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Initialize nvim-tree with default settings
    require("nvim-tree").setup {}

    -- --- Keymaps for NvimTree ---

    -- 1. Toggle NvimTree (standard mapping)
    vim.keymap.set('n', '<leader>ne', '<cmd>NvimTreeToggle<CR>', {
      desc = 'NvimTree: Toggle file explorer'
    })

    -- 2. Find/Reveal the current file in the tree
    -- Changed from <leader>nf to <leader>nn to avoid common conflicts.
    -- This command automatically opens the tree if it is closed and highlights the current buffer's file.
    vim.keymap.set('n', '<leader>nn', '<cmd>NvimTreeFindFile<CR>', {
      desc = 'NvimTree: Find/Reveal current file'
    })

    -- 3. Change the root directory of the tree to the directory of the current file
    -- Replaced the non-working command with a Lua function that explicitly gets the current buffer's directory
    -- and calls the API function 'change_root(path)' for broader compatibility.
    vim.keymap.set('n', '<leader>nc', function()
      local current_file_dir = vim.fn.expand('%:p:h')
      require('nvim-tree.api').tree.change_root(current_file_dir)
    end, {
      desc = 'NvimTree: Change root to current file directory'
    })
  end,
}
