require "nvchad.options"

-- add yours here!

vim.o.guifont = "DankMono Nerd Font Mono:h20"

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
o.relativenumber = true

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
vim.g.neovide_cursor_animation_length = 0.01
vim.opt.clipboard = "unnamedplus"
vim.g.neovide_cursor_trail_size = 0.1
