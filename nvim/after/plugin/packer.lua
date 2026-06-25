vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Silencia o aviso de depreciação do vim.tbl_islist em plugins antigos como o Packer
if vim.islist then
  vim.tbl_islist = vim.islist
end
