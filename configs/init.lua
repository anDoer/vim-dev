--  _   _         __     ___
-- | \ | | ___  __\ \   / (_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
-- | |\  |  __/ (_) \ V / | | | | | | |
-- |_| \_|\___|\___/ \_/  |_|_| |_| |_|
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('init_mappings')
require('options')
require('autocmds')
require("lazy").setup("plugins", {
    ui = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
})
Mapper = require('mapper')
require('mappings')
require('colorscheme')

--require('plugins/mason-config')
--require('plugins/colorscheme')
-- require('plugins/nvim-tree')
