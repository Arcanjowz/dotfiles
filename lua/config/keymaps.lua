-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Roda o arquivo atual com <leader>r
map("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local cmds = {
    python = "python3 " .. file,
    javascript = "node " .. file,
    typescript = "npx ts-node " .. file,
    c = "gcc " .. file .. " -o /tmp/out && /tmp/out",
    cpp = "g++ " .. file .. " -o /tmp/out && /tmp/out",
    go = "go run " .. file,
    rust = "rustc " .. file .. " -o /tmp/out && /tmp/out",
    sh = "bash " .. file,
    bash = "bash " .. file,
  }
  local cmd = cmds[ft]
  if cmd then
    require("toggleterm.terminal").Terminal
      :new({
        cmd = cmd .. "; echo; echo '✓ Concluído — pressione Enter para fechar'; read",
        close_on_exit = true,
        direction = "float",
      })
      :toggle()
  else
    vim.notify("Linguagem não suportada: " .. ft, vim.log.levels.WARN)
  end
end, { desc = "Rodar arquivo atual" })

-- Navega entre splits com Ctrl+hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Split esquerdo" })
map("n", "<C-l>", "<C-w>l", { desc = "Split direito" })
map("n", "<C-j>", "<C-w>j", { desc = "Split abaixo" })
map("n", "<C-k>", "<C-w>k", { desc = "Split acima" })

-- Move linhas selecionadas com Shift+J/K no visual
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move seleção abaixo" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move seleção acima" })

-- Mantém o cursor no centro ao rolar
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Colar sem sobrescrever o clipboard
map("v", "p", '"_dP', { desc = "Colar sem perder clipboard" })

-- Diagnósticos rápidos
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Ver diagnóstico" })
