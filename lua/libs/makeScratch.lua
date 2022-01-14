-- in tools.lua
local api = vim.api
local M = {}
function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  --vim.bo[0].buftype=nofile -- set the current buffer's (buffer 0) buftype to nofile
  --vim.bo[0].bufhidden=hide
  --vim.bo[0].swapfile=false
  vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(0, 'swapfile', false)
  vim.api.nvim_buf_set_option(0, 'bufhidden', 'hide')
end
return M
