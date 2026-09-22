---@module 'lazy'
---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'horizontal',
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    size = 15,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    local terminal = require 'toggleterm.terminal'

    local function switch_terminal(id)
      for _, term in ipairs(terminal.get_all()) do
        if term.id ~= id and term:is_open() then term:close() end
      end

      vim.cmd(id .. 'ToggleTerm')
    end

    vim.keymap.set('n', '<leader>t1', function() switch_terminal(1) end, { desc = 'Switch to terminal 1' })
    vim.keymap.set('n', '<leader>t2', function() switch_terminal(2) end, { desc = 'Switch to terminal 2' })
    vim.keymap.set('n', '<leader>t3', function() switch_terminal(3) end, { desc = 'Switch to terminal 3' })
    vim.keymap.set('n', '<leader>t4', function() switch_terminal(4) end, { desc = 'Switch to terminal 4' })
  end,
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle floating terminal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Toggle vertical terminal' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Toggle horizontal terminal' },
    { '<leader>t1', '<cmd>1ToggleTerm<cr>', desc = 'Switch to terminal 1' },
    { '<leader>t2', '<cmd>2ToggleTerm<cr>', desc = 'Switch to terminal 2' },
    { '<leader>t3', '<cmd>3ToggleTerm<cr>', desc = 'Switch to terminal 3' },
    { '<leader>t4', '<cmd>4ToggleTerm<cr>', desc = 'Switch to terminal 4' },
  },
}
