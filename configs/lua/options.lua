-- Hint: use `:h <option>` to figure out the meaning if needed
vim.cmd("syntax on")
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
--
---- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python
--
---- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.showmode = true
vim.opt.linebreak = true 					-- break entire word in new line
vim.opt.scrolloff = 5								-- keep cursor a little bit higher while scrolling
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.equalalways = false				-- disables resizing windows to a unique size, if a window was closed
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.cmdheight = 2							  -- more space for status messages
vim.opt.wrap = false								-- disable wrap, can be enabled by Lead + w

---- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true             -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered
vim.o.path = vim.o.path .. "**"

----
-- Backup, Swap and co
if not vim.fn.isdirectory(vim.fn.expand("$HOME") .. "/.local/share/nvim/undodir") then
    vim.fn.mkdir(vim.fn.expand("$HOME") .. "/.local/share/nvim/undodir", "p", 0700)
end

vim.o.undodir = vim.fn.expand("~/.local/share/nvim/undodir/") -- store all changes in this directory
vim.o.undofile = true

if not vim.fn.isdirectory(vim.fn.expand("$HOME") .. "/.local/share/nvim/swap") then
    vim.fn.mkdir(vim.fn.expand("$HOME") .. "/.local/share/nvim/swap", "p", 0700)
end

vim.o.directory = vim.fn.expand("~/.local/share/nvim/swap/") -- directory for swap files
vim.o.swapfile = false -- we don't want to have a swap file
vim.o.backup = false -- Immediately delete backup file, we can use undofiles to restore changes
vim.o.hidden = true -- we can change buffers if file is not saved

-- Show linebreaks, tabs and so on!
-- Can be disabled with a command!
vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    eol = "¬",
    trail = "⋅",
    extends = "❯",
    precedes = "❮",
}

vim.opt.showbreak = "↪"

