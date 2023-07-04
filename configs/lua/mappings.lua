-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local mapper_opts = {noremap = true, silent = true}

-- Disable arrow keys
map('', '<up>', ':lua print("NO ARROW KEY")<CR>')
map('', '<down>', ':lua print("NO ARROW KEY")<CR>')
map('', '<left>', ':lua print("NO ARROW KEY")<CR>')
map('', '<right>', ':lua print("NO ARROW KEY")<CR>')

-- Define undo breakpoints
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', '(', '(<c-g>u')
map('i', ')', ')<c-g>u')
map('i', '[', '[<c-g>u')
map('i', ']', ']<c-g>u')
map('i', '{', '{<c-g>u')
map('i', '}', '}<c-g>u')

-- enable / disable wrap
Mapper.map('n', '<leader>w', ':set wrap!<CR>', mapper_opts, 'Wrapping', 'enable_disable_wrap', 'Toggles Wrap')

-- buffer navigation
Mapper.map('n', '<leader>k', ':bp!<CR>', mapper_opts, 'Navigation', 'naviate_buffer_up', 'Navigate One Buffer Up')
Mapper.map('n', '<leader>j', ':bn!<CR>', mapper_opts, 'Navigation', 'navigate_buffer_down', 'Navigate one Buffer Down')

-- Change split orientation
Mapper.map('n', '<leader>ch', '<C-w>t<C-w>K', mapper_opts, 'Navigation', 'change_split_orientation_h', 'Change split orientation horizontally')
Mapper.map('n', '<leader>cv', '<C-w>t<C-w>H', mapper_opts, 'Navigation', 'change_split_orientation_v', 'Change split orientation vertically')

Mapper.map('n', '<C-w>n', '<C-w>n', mapper_opts, 'Navigation', 'create_new_split_below', 'Creates an empty split below')
Mapper.map('n', '<C-w>v', '<C-w>v', mapper_opts, 'Navigation', 'create_new_split_vertical', 'Creates an empty split vertically')


-- Fast saving
Mapper.map('n', '<leader>s', ':w<CR>', mapper_opts, 'Quick Command', 'fast_saving', 'Quick Save')
-- Close all windows and exist from Neovim
Mapper.map('n', '<leader>q', ':wqa<CR>', mapper_opts, 'Quick Command', 'fast_save_and_close', 'Quick Safe and Close')

-- Moving lines up and down
map('n', '<C-A-j>', ":m .+1<CR>==")
map('n', '<C-A-k>', ":m .-2<CR>==")
map('i', '<C-A-j>', "<ESC>:m .+1<CR>==gi")
map('i', '<C-A-k>', "<ESC>:m .-2<CR>==gi")
map('v', '<C-A-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-A-k>', ":m '<-2<CR>gv=gv")

-- Shift + Tab for inverse shift
map('i', '<S-Tab>', '<C-d>')

-- Splits
Mapper.map('n', '<leader>sv', ':vsplit<CR>', mapper_opts, 'Split', 'split_vertically', 'Split vertically')
Mapper.map('n', '<leader>sh', ':split<CR>', mapper_opts,  'Split', 'split_horizontally', 'Split horizontally')

-- Split Navigation
map('n', '<C-j>', '<C-W><C-J>')
map('n', '<C-k>', '<C-W><C-K>')
map('n', '<C-l>', '<C-W><C-L>')
map('n', '<C-h>', '<C-W><C-H>')

-- Tabs
Mapper.map('n', 'tn', ':tabnew<CR>', mapper_opts, 'Tabs', 'new_tab', 'Create a new tab')
Mapper.map('n', 'tc', ':tabc<CR>', mapper_opts, 'Tabs', 'close_tab', 'Close a tab')

-- Resize Splits
map('n', '<A-l>', ":vertical resize +5<CR>")
map('n', '<A-h>', ":vertical resize -5<CR>")
map('n', '<A-k>', ":resize +5<CR>")
map('n', '<A-j>', ":resize -5<CR>")
map('n', ',=', '<C-w>=')

-- Select entire content
map('n', '<leader>a', 'ggVG')

-- copy, cut and poase
map('v', '<C-c>', '+y', {})
map('v', '<C-x>', '+c', {})
map('v', '<C-v>', 'c<ESC>"+p', {})
map('i', '<C-v>', '<ESC>"+pa', {})

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
Mapper.map('n', '<leader>T', ':Term<CR>', { noremap = true }, 'Terminal', 'new_term', 'Create a new Terminal') -- open
map('t', '<Esc>', '<C-\\><C-n>')                       -- exit
map('t', '<C-A-c>', '<C-\\><C-n>', { noremap = true }) -- exit


------------------------------------------------------------
-- Telescope
-------------------------------------------------------------

Mapper.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', mapper_opts, 'Telescope', 'telescope_find_files', 'Find files in Telescope')
Mapper.map('n', '<leader>tl', '<cmd>Telescope live_grep<cr>', mapper_opts, 'Telescope', 'telescope_live_grep', 'Live grep with Telescope')
Mapper.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', mapper_opts, 'Telescope', 'telescope_buffers', 'Live grep with Telescope')
Mapper.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', mapper_opts, 'Telescope', 'telescope_help_tags', 'Shows all help tags with telescope')
Mapper.map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', mapper_opts, 'Telescope', 'telescope_old_files', 'Shows recently used files')
