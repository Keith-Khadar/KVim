local function setup_layout()
  local opened_file = vim.fn.argc() > 0

  if not opened_file then
    vim.cmd('enew')
  end

  vim.cmd('botright split')
  vim.cmd('resize 15')
  vim.cmd('terminal')
  vim.cmd('wincmd k')

  -- Wait for nvim-tree to be loaded before calling it
  vim.defer_fn(function()
    local ok = pcall(vim.cmd, 'NvimTreeOpen')
    if not ok then
      vim.cmd("echo 'nvim-tree not loaded yet'")
    end
  end, 100)

  vim.cmd('wincmd l')

  if not opened_file then
    vim.defer_fn(function()
      require('telescope.builtin').find_files()
    end, 150)
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.defer_fn(setup_layout, 10)
  end,
  once = true,
})

-- Auto-resize terminal to maintain proportional height
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == 'terminal' then
        local height = math.floor(vim.o.lines * 0.25)
        vim.api.nvim_win_set_height(win, height)
      end
    end
  end,
})

require('nvim-tree').setup({
  view = {
    width = 30,
  },
})

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.bufhidden = 'hide'
  end,
})
