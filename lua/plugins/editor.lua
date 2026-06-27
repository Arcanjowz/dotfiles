return {
  -- Destaca TODO/FIXME/HACK/NOTE nos comentários
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Comentários rápidos com gcc / gc+motion
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Git: blame inline, diff de hunks, navegação
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]h", gs.next_hunk, "Próximo hunk")
        map("n", "[h", gs.prev_hunk, "Hunk anterior")
        map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>gb", gs.blame_line, "Blame linha")
        map("n", "<leader>gd", gs.diffthis, "Diff")
      end,
    },
  },

  -- Diff side-by-side completo + histórico de commits
  -- :DiffviewOpen para ver diff do working tree
  -- :DiffviewFileHistory % para histórico do arquivo atual
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview abrir" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Histórico do arquivo" },
      { "<leader>gX", "<cmd>DiffviewClose<cr>", desc = "Diffview fechar" },
    },
    opts = {},
  },

  -- Histórico de yanks: após colar com p, navegue com <C-n>/<C-p>
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    opts = {
      ring = {
        history_length = 20,
        storage = "memory",
      },
    },
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Colar (yanky)" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Colar antes (yanky)" },
      { "<C-n>", "<Plug>(YankyCycleForward)", desc = "Próximo yank" },
      { "<C-p>", "<Plug>(YankyCycleBackward)", desc = "Yank anterior" },
    },
  },

  -- Sublinha todas as ocorrências da palavra sob o cursor
  {
    "nvim-mini/mini.cursorword",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
