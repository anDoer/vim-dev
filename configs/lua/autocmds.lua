-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local create_augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local create_autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

local config_group = create_augroup("ConfigGroup", { clear = true })
local terminal_config_group = create_augroup("TerminalConfig", { clear = true })


-- General settings:
--------------------

create_autocmd("FocusLost", {
    group = config_group,
    pattern = "*",
    command = "silent! wa!",
})

create_autocmd("Filetype", {
    group = config_group,
    pattern = { "gitcommit", "md", "tex", "txt" },
    command = "setlocal spell",
})

-- Highlight on yank
create_autocmd("TextYankPost", {
    group = config_group,
    pattern = "*",
    command = "lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 250 })",
})


-- Remove whitespace on save
create_autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
create_autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for filetypes:
--------------------------

-- Disable line length marker
create_augroup('setLineLength', { clear = true })
create_autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'json' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
create_augroup('setIndent', { clear = true })
create_autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'yaml', 'lua', 'json'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Open a Terminal on the right tab
create_autocmd('CmdlineEnter', {
  command = 'command! Term :bo split term://$SHELL'
})

-- Enter insert mode when switching to terminal
create_autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

create_autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
create_autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})


