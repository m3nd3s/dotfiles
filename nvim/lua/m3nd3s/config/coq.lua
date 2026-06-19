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

require("coq")

-- ==========================================
-- CONFIGURAÇÃO AUTOMÁTICA DO ECOSSISTEMA RAILS
-- ==========================================

-- 1. Ruby LSP
local ruby_lsp_config = {
  name = "ruby_lsp",
  cmd = { "ruby-lsp" },
  root_dir = vim.fs.root(0, { "Gemfile", ".tool-versions", ".git" }) or vim.fn.getcwd(),
  init_options = { formatter = "auto" },
}

-- 2. JavaScript (vtsls)
local js_lsp_config = {
  name = "vtsls",
  cmd = { "vtsls", "--stdio" },
  root_dir = vim.fs.root(0, { "package.json", ".git" }) or vim.fn.getcwd(),
}

-- 3. YAML Server (Para as configs do Rails)
local yaml_lsp_config = {
  name = "yamlls",
  cmd = { "yaml-language-server", "--stdio" },
  root_dir = vim.fs.root(0, { ".git" }) or vim.fn.getcwd(),
}

-- 4. Emmet Server (Para autocompletar HTML ultra rápido nas views .erb)
local emmet_lsp_config = {
  name = "emmet_ls",
  cmd = { "emmet-language-server", "--stdio" },
  root_dir = vim.fs.root(0, { "Gemfile", ".git" }) or vim.fn.getcwd(),
}

-- ==========================================
-- GATILHOS DE INICIALIZAÇÃO (AUTOCMDs)
-- ==========================================

-- Gatilho Ruby
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "eruby" },
  callback = function()
    vim.lsp.start(ruby_lsp_config)
  end,
})

-- Gatilho JS/TS
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.lsp.start(js_lsp_config)
  end,
})

-- Gatilho YAML
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "eruby" }, -- mapeia yaml e permite rodar configs se necessário
  callback = function()
    vim.lsp.start(yaml_lsp_config)
  end,
})

-- Gatilho Emmet (Ativado especificamente para HTML, CSS e Views do Rails)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "eruby", "html.erb" },
  callback = function()
    vim.lsp.start(emmet_lsp_config)
  end,
})
