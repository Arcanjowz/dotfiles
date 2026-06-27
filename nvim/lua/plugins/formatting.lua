return {
  -- Conform: formata ao salvar (:w)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Python: três etapas do ruff em sequência
        -- ruff_fix: corrige erros lint automaticamente
        -- ruff_format: formata o código
        -- ruff_organize_imports: organiza e limpa imports
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },

        -- JS/TS: biome para projetos novos, prettierd como fallback
        -- Para projetos com biome.json na raiz, biome assume automaticamente
        -- Para projetos legado sem biome.json, prettierd é usado
        javascript = { "biome", stop_after_first = true },
        typescript = { "biome", stop_after_first = true },
        javascriptreact = { "biome", stop_after_first = true },
        typescriptreact = { "biome", stop_after_first = true },
        json = { "biome", stop_after_first = true },

        -- HTML/CSS: prettierd (biome ainda não tem suporte completo)
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        yaml = { "prettierd" },

        -- Go: gofumpt (mais estrito que gofmt, compatível com gopls)
        go = { "gofumpt" },

        -- Rust: rustfmt nativo
        rust = { "rustfmt" },

        -- C/C++: clang-format (requer .clang-format na raiz do projeto)
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- Lua
        lua = { "stylua" },

        -- SQL: sleek é mais simples e rápido; sqlfluff para projetos que precisam de lint
        sql = { "sleek" },
      },
    },
  },
}
