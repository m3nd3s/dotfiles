
local bifrost = require("bifrost")

-- Copiar e Abrir no Navegador
vim.keymap.set("n", "<leader>bo", bifrost.open_file, { desc = "Bifrost: Abrir arquivo no Git" })
vim.keymap.set("n", "<leader>bl", bifrost.open_line, { desc = "Bifrost: Abrir linha no Git" })

-- Apenas Copiar para o Clipboard
vim.keymap.set("n", "<leader>bc", bifrost.copy_file, { desc = "Bifrost: Copiar link do arquivo" })
vim.keymap.set("n", "<leader>by", bifrost.copy_line, { desc = "Bifrost: Copiar link da linha" })

vim.api.nvim_create_user_command("BifrostOpenFile", bifrost.open_file, {})
vim.api.nvim_create_user_command("BifrostOpenLine", bifrost.open_line, {})
vim.api.nvim_create_user_command("BifrostCopyFile", bifrost.copy_file, {})
vim.api.nvim_create_user_command("BifrostCopyLine", bifrost.copy_line, {})
