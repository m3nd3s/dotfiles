local neotest_ok, neotest = pcall(require, 'neotest')
if not neotest_ok then return end

local rspec_ok, neotest_rspec = pcall(require, 'neotest-rspec')
if not rspec_ok then return end

local overseer_ok, overseer = pcall(require, 'overseer')
if not overseer_ok then
  vim.notify("Neotest: Plugin overseer.nvim não encontrado!", vim.log.levels.ERROR)
  return
end

-- 1. Descobre o caminho do plugin dinamicamente
local plugin_path = ""
for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
  if rtp:match("neotest%-rspec") then
    plugin_path = rtp
    break
  end
end

if plugin_path == "" then
  vim.notify("Neotest: Plugin neotest-rspec não encontrado!", vim.log.levels.ERROR)
  return
end

local cwd = vim.fn.getcwd()
local host_formatter = plugin_path .. '/neotest_formatter.rb'
local project_spec_dir = cwd .. '/spec'
local target_formatter = project_spec_dir .. '/neotest_formatter.rb'
local target_results = project_spec_dir .. '/neotest_results.json'

-- 2. Copia o formatador para a pasta spec/ do projeto
vim.fn.mkdir(project_spec_dir, 'p')
local uv = vim.loop or vim.uv
uv.fs_copyfile(host_formatter, target_formatter)

-- 3. Cria o adaptador base do RSpec
local base_adapter = neotest_rspec({
  rspec_cmd = function()
    return { './docker/rspec' }
  end,
  results_path = function()
    return target_results
  end,
})

-- 4. Intercepta o comando do Neotest para corrigir o caminho do --require
local custom_adapter = vim.tbl_deep_extend('force', {}, base_adapter)

custom_adapter.build_spec = function(args)
  local spec = base_adapter.build_spec(args)
  if spec and spec.command then
    for i, cmd_arg in ipairs(spec.command) do
      if type(cmd_arg) == 'string' and cmd_arg:match('neotest_formatter%.rb$') then
        spec.command[i] = target_formatter
      end
    end
  end
  return spec
end

-- 5. Configura o Neotest usando o Overseer como consumidor de tarefas
neotest.setup({
  adapters = {
    custom_adapter
  },
  consumers = {
    overseer = require("neotest.consumers.overseer"),
  },
})

-- ==========================================
-- ESTRATÉGIA OVERSEER + HERDR
-- ==========================================
local function run_in_herdr(position_args)
  neotest.run.run({
    position_args,
    strategy = "overseer",
    extra_opts = {
      on_create = function(task)
        -- Extrai a linha de comando gerada pelo neotest
        local cmd = table.concat(task.cmd, " ")
        
        -- Cancela a execução interna padrão do overseer
        task:dispose()

        -- Dispara um novo split no Herdr mantendo o processo rodando visível
        vim.fn.jobstart(string.format('herdr split --command %q', cmd), { detach = true })
      end,
    },
  })
end

-- ==========================================
-- Mapeamento de Atalhos
-- ==========================================
local keymap = vim.keymap.set

-- Executar e Acompanhar no Herdr
keymap('n', '<leader>tr', function()
  vim.notify("🚀 Executando teste no Herdr...", vim.log.levels.INFO, { title = "Neotest + Herdr" })
  run_in_herdr()
end, { desc = 'Rodar Teste Mais Próximo no Herdr' })

keymap('n', '<leader>tf', function()
  vim.notify("🚀 Executando arquivo no Herdr...", vim.log.levels.INFO, { title = "Neotest + Herdr" })
  run_in_herdr(vim.fn.expand('%'))
end, { desc = 'Rodar Arquivo Atual no Herdr' })

-- Atalhos de Inspeção do Neotest
keymap('n', '<leader>ta', function()
  neotest.run.attach()
end, { desc = 'Anexar Split de Terminal ao Teste' })

keymap('n', '<leader>tp', function()
  neotest.output_panel.toggle()
end, { desc = 'Alternar Painel de Saída' })

keymap('n', '<leader>to', function()
  neotest.output.open({ enter = true })
end, { desc = 'Ver Saída do Teste (Pop-up)' })

keymap('n', '<leader>ts', function()
  neotest.summary.toggle()
end, { desc = 'Alternar Árvore de Testes' })
