-- tabout
return {
  {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- Disable tabout re-mapping of tab (cmp-nvim owns tab mapping)
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        -- default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'", nested=true},
          { open = '"', close = '"', nested=true},
          { open = '`', close = '`', nested=true},
          { open = '(', close = ')', nested=true},
          { open = '[', close = ']', nested=true},
          { open = '{', close = '}', nested=true}
        },
        --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        -- So anything before first opening parenthesis can be shifted
        ignore_beginning = false, 
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    -- Set the event to 'InsertCharPre' for better compatibility
    -- No, don't do that. That would make plugin load too lazily for my taste
    -- one keypress in insert mode before is required for tabout to work...
    -- just load it when going into insert mode without typing anything
    event = 'InsertEnter',
  },
}

