return {
  -- Terminal flutuante ou split com Ctrl+T
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<C-t>" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-t>]],
      direction = "float", -- float | horizontal | vertical
      float_opts = {
        border = "curved",
      },
      shade_terminals = true,
      persist_mode = true, -- lembra se estava em insert ou normal
    },
  },
}
