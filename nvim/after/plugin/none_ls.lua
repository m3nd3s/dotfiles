local status, null_ls = pcall(require, "null-ls") -- O nome do modulo interno ainda é null-ls
if not status then return end

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Ativa o Reek para analisar o arquivo ao salvar e jogar no vim.diagnostic
    diagnostics.reek,
    
    -- NOTA: Se o seu ruby-lsp já mostra o RuboCop, não precisa ativar o RuboCop aqui.
    -- Mas se quiser centralizar tudo por aqui no futuro, poderia descomentar a linha abaixo:
    -- diagnostics.rubocop, 
  },
})
