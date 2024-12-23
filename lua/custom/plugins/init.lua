-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-runner',

    config = function()
      if vim.env.TMUX ~= nil then
        vim.g['test#strategy'] = 'vtr'
      else
        vim.g['test#strategy'] = 'neovim'
      end
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require 'nvim-tmux-navigation'

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }

      vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  { 'vim-scripts/bufkill.vim' },
  {
    'janko-m/vim-test',
    config = function()
      vim.keymap.set('n', '<leader>tn', ':TestNearest<cr>', { silent = true, desc = 'Run the nearest test' })
      vim.keymap.set('n', '<leader>tf', ':TestFile<cr>', { silent = true, desc = 'Run the whole file' })
      vim.keymap.set('n', '<leader>ta', ':TestSuite<cr>', { silent = true, desc = 'Run the whole test suite' })
      vim.keymap.set('n', '<leader>tl', ':TestLast<cr>', { silent = true, desc = 'Run the last test again' })
      vim.keymap.set('n', '<leader>tg', ':TestVisit<cr>', { silent = true, desc = 'Go to the last run test' })
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'tpope/vim-projectionist' },
  {
    'elixir-tools/elixir-tools.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local elixir = require 'elixir'
      local elixirls = require 'elixir.elixirls'

      elixir.setup {
        nextls = {
          enable = false,
          init_opts = {
            experimental = {
              completions = {
                enable = true,
              },
            },
          },
        },
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = true,
            suggestSpecs = true,
            signatureAfterComplete = true,
          },
          on_attach = function(_, _)
            vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
            vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
            vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true,
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
