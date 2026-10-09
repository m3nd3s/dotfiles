-- coder/claudecode.nvim — integração Claude Code <-> Neovim
-- O setup principal já é chamado no packer.lua; aqui ficam os atalhos.
--
-- terminal_cmd aponta para um wrapper porque o plugin não passa pelo shell
-- (roda o binário direto via termopen), e nossas credenciais vêm das funções
-- do claude-gateway.sh (ANTHROPIC_BASE_URL/AUTH_TOKEN/MODEL por token/API,
-- não por login). Sem o wrapper, o claude dentro do Neovim abre sem auth.
local claudecode = require("claudecode").setup({
  terminal_cmd = vim.fn.expand("~/.config/nvim/scripts/claude-gateway-wrapper.sh"),
})

vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCode<cr>", { desc = "ClaudeCode: Toggle" })
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCodeContinue<cr>", { desc = "ClaudeCode: Continue última conversa" })
-- ClaudeCodeAdd exige argumento: ClaudeCodeAdd <arquivo> [linha-ini] [linha-fim]
-- por isso os mapas passam o arquivo (e as linhas, no modo visual) via função.
vim.keymap.set("n", "<leader>av", function()
  vim.cmd("ClaudeCodeAdd " .. vim.fn.fnameescape(vim.fn.expand("%:p")))
end, { desc = "ClaudeCode: Enviar buffer como contexto" })
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeSend<cr>", { desc = "ClaudeCode: Enviar ao Claude sem focar" })
vim.keymap.set("v", "<leader>as", function()
  local s, e = vim.fn.line("'<"), vim.fn.line("'>")
  vim.cmd(("ClaudeCodeAdd %s %d %d")
    :format(vim.fn.fnameescape(vim.fn.expand("%:p")), s, e))
end, { desc = "ClaudeCode: Enviar seleção como contexto" })
vim.keymap.set("n", "<leader>aD", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "ClaudeCode: Aceitar diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "ClaudeCode: Rejeitar diff" })
