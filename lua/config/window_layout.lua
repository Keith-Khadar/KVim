local function setup_layout()
  local opened_file = vim.fn.argc() > 0
  
  if not opened_file then
    vim.cmd('enew')
  end
  
  vim.cmd('botright split')
  vim.cmd('resize 15')
  vim.cmd('terminal')
  vim.cmd('wincmd k')
  
  -- Choose your file explorer:
  vim.cmd('NvimTreeOpen')
  -- vim.cmd('Neotree show left')
  -- vim.cmd('Vexplore | vertical resize 30')
  
  vim.cmd('wincmd l')
  
  if not opened_file then
    require('telescope.builtin').find_files()
    -- require('telescope.builtin').git_files()
    -- require('telescope.builtin').live_grep()
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.defer_fn(setup_layout, 10)
  end,
  once = true,
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
  end,
})
