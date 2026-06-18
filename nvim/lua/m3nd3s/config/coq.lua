-- 1. Definições de Configuração (Devem vir ANTES do require)
vim.g.coq_settings = {
  -- Ajusta o comportamento de exibição do menu de completamento
  display = {
    icons = {
      mode = "short", -- Abrevia os nomes das fontes para economizar espaço na tela
    },
    preview = {
      border = "rounded", -- Deixa a janela flutuante de documentação com bordas arredondadas
    },
  },
}

-- 2. Inicialização Oficial do Plugin
require("coq")
