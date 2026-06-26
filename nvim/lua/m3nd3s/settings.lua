-------------------------------------------------------------------------------
-- 1. SISTEMA, CODIFICAÇÃO E PERFORMANCE
-------------------------------------------------------------------------------
vim.opt.encoding = 'utf-8'         -- Define a codificação interna do editor
vim.scriptencoding = 'utf-8'       -- Define a codificação para scripts Vim
vim.opt.fileencoding = 'utf-8'     -- Garante que novos arquivos sejam salvos em UTF-8

-- Tempo de resposta do editor (Otimização crucial para IA, LSP e Copilot)
vim.opt.updatetime = 250           -- Dispara diagnósticos e previews mais rápido (padrão é 4000ms)
vim.opt.timeoutlen = 300           -- Tempo de espera (ms) para sequências de atalhos (ex: <leader>gv)

-------------------------------------------------------------------------------
-- 2. INTERFACE E VISUAL
-------------------------------------------------------------------------------
vim.opt.number = true              -- Ativa a numeração de linhas
vim.opt.relativenumber = true      -- Numeração híbrida/relativa (essencial para velocidade de navegação)
vim.opt.numberwidth = 1            -- Largura mínima da coluna de números (deixa o layout enxuto)
vim.opt.cursorline = true          -- Destaca visualmente a linha horizontal onde o cursor está
vim.opt.colorcolumn = "120"        -- Linha guia vertical na coluna 120 (limite de boa leitura do código)
vim.opt.termguicolors = true       -- Ativa suporte a cores 24-bit (obrigatório para temas como Catppuccin)
vim.opt.showmatch = true           -- Pisca brevemente o parêntese/colchete correspondente ao fechar
vim.opt.wrap = false               -- Desativa quebra de linha visual (linhas longas continuam para a direita)

-------------------------------------------------------------------------------
-- 3. NAVEGAÇÃO E REPOSITÓRIO DE ABAS (Tabline)
-------------------------------------------------------------------------------
vim.opt.showtabline = 2            -- Sempre mostra a barra de abas no topo (obrigatório para o Tabby)
vim.opt.tabpagemax = 20            -- Limite máximo de abas abertas simultaneamente

-------------------------------------------------------------------------------
-- 4. ESPAÇAMENTO E TABULAÇÃO (O Padrão Ruby on Rails)
-------------------------------------------------------------------------------
vim.opt.tabstop = 2                -- Largura visual de uma tabulação padrão fixa em 2 espaços
vim.opt.shiftwidth = 2             -- Tamanho da indentação automática (padrão da comunidade Ruby)
vim.opt.softtabstop = 2            -- Faz o Backspace apagar 2 espaços de uma vez se foram inseridos via Tab
vim.opt.expandtab = true           -- Transforma qualquer pressão da tecla Tab em espaços reais
vim.opt.smarttab = true            -- Insere espaços baseados na indentação da linha anterior ao teclar Tab
vim.opt.smartindent = true         -- Indenta o código de forma inteligente após blocos (def, class, do, if)

-------------------------------------------------------------------------------
-- 5. COMPORTAMENTO DE BUSCA (Search)
-------------------------------------------------------------------------------
vim.opt.ignorecase = true          -- Ignora maiúsculas/minúsculas ao buscar termos simples
vim.opt.smartcase = true           -- Se usar uma letra maiúscula na busca, ele passa a ser case-sensitive
vim.opt.incsearch = true           -- Destaca os resultados na tela interativamente enquanto você digita

-------------------------------------------------------------------------------
-- 6. GERENCIAMENTO DE JANELAS (Splits)
-------------------------------------------------------------------------------
vim.opt.splitright = true          -- Divisões verticais (:vsplit) abrem naturalmente à direita
vim.opt.splitbelow = true          -- Divisões horizontais (:split) abrem naturalmente abaixo

-------------------------------------------------------------------------------
-- 7. INTEGRAÇÃO COM O SISTEMA OPERACIONAL e MOUSE
-------------------------------------------------------------------------------
-- Compartilha a área de transferência do NeoVim com o Ctrl+C / Ctrl+V do seu sistema operacional
vim.opt.clipboard = "unnamedplus"  
vim.opt.mouse = 'a'                -- Ativa suporte completo ao mouse (útil para clicar em abas e redimensionar)

-------------------------------------------------------------------------------
-- 8. BACKUP, SWAP E HISTÓRICO PERSISTENTE (Undo)
-------------------------------------------------------------------------------
vim.opt.backup = false             -- Desativa arquivos de backup automáticos do Vim
vim.opt.swapfile = false           -- Desativa arquivos .swap (evita avisos chatos se o terminal cair)

-- Ativa o histórico de "Desfazer" persistente, mesmo após fechar o arquivo e desligar o PC
vim.opt.undofile = true            
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Pasta central onde os Undos ficam guardados

-------------------------------------------------------------------------------
-- 9. CORRETOR ORTOGRÁFICO (Spell Check)
-------------------------------------------------------------------------------
-- vim.opt.spell = true            -- Opcional: Descomente para ativar a verificação ortográfica
vim.opt.spelllang = { 'en', 'pt' } -- Configura o corretor para aceitar Inglês e Português simultaneamente
