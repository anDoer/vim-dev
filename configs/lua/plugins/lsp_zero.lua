-- ###### OPTIONS ######
local required_lsp_servers = {"lua_ls", "dockerls", "cmake", "pylsp", "clangd", "marksman", "bashls" }
local lsp_underline = false
local no_virtual_text = false
local debugging = false

-- #####################



-- ##### Helper function to use the current environment #####
local log = function(message)

  if debugging then
    local log_file_path = '/tmp/nvim_debug.log'
    log_file = io.open(log_file_path, "a")
    io.output(log_file)
    io.write(message.."\n")
    io.close(log_file)
  end
end

local function contains(list, x)
  for _, v in pairs(list) do
    if v == x then return true end
  end
  return false
end

local function get_python_path(workspace)
  local util = require('lspconfig/util')
  local path = util.path

  log("[In get_python_path]: get virtual env...")
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  log("[In get_python_path]: did not work...look for environment in current folder")

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  log("[In get_python_path]: Did not work, fall back to default")
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end



local function disable_virtual_text()
    vim.diagnostic.config({ virtual_text = false })
end
--
local function setup_lsp_zero()

  if no_virtual_text then
    disable_virtual_text()
  end

  lsp_zero = require('lsp-zero')
  lsp_zero.preset({
    float_boarder = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps=false,
    manage_nvim_cmp = {
      set_sources = 'minimal',
      set_basic_mappings=true,
      set_extra_mappings=false,
      use_luasnip = true,
      set_format = true,
      documentation_window = true
    },
  })

  local opts = {buffer = bufnr}

  -- SET DEFAULT KEYBINDINGS
  lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps(opts)

    -- Add / replace keybindings
    local mapper = require('../mapper')
    local keymap_opts = {buffer = bufnr, silent = true, noremap = true}
    local m_opts = {noremap = true, silent = true}

    mapper.map_buf(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', m_opts, "LSP", "go_definition", 'Goto Definition')
    mapper.map_buf(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', m_opts, "LSP", "lsp_hover", 'Hover warnings or errors')
    mapper.map_buf(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', m_opts, "LSP", "lsp_declaration", 'Go to declaration')
    mapper.map_buf(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', m_opts, "LSP", "lsp_implementation", 'Go to implementation')
    mapper.map_buf(bufnr, 'n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', m_opts, "LSP", "lsp_type_definition", 'Go to type definition')
    mapper.map_buf(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', m_opts, "LSP", "lsp_references", 'Go to references')
    mapper.map_buf(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', m_opts, "LSP", "lsp_signature_help", 'Show signature help')
    mapper.map_buf(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', m_opts, "LSP", "lsp_rename", 'Rename')
    mapper.map_buf(bufnr, {'n','x'}, '<F3>', function()
      vim.lsp.buf.format({async = false, timeout_ms = 10000}) end, m_opts, "LSP", 'lsp_format', 'Format current buffer')
    mapper.map_buf(bufnr, 'n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', m_opts, "LSP", "lsp_code_action", 'Code Action')

    mapper.map_buf(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', m_opts, "Diagnostic", "lsp_open_float", 'LSP open float')
    mapper.map_buf(bufnr, 'n', 'gL', '<cmd>lua vim.diagnostic.setloclist()<cr>', m_opts, "Diagnostic", "lsp_toclist", 'Show diagnostics list')
    mapper.map_buf(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', m_opts, "Diagnostic", "lsp_curr_diag", 'Go to previous diagnostic')
    mapper.map_buf(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', m_opts, "Diagnostic", "lsp_next_diag", 'Go to next diagnostic')


    --vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', keymap_opts)
    --vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', keymap_opts)
    --vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', keymap_opts)
    --vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', keymap_opts)
    --vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', keymap_opts)
    --vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', keymap_opts)
    -- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
    -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', keymap_opts)
    -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', keymap_opts)
    -- vim.keymap.set({'n', 'x'}, '<F3>', function()
    --   vim.lsp.buf.format({async = false, timeout_ms = 10000})
    -- end, keymap_opts)
    -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', keymap_opts)

    -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', keymap_opts)
    -- vim.keymap.set("n", "gL", '<cmd> lua vim.diagnostic.setloclist()<cr>', keymap_opts)
    -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', keymap_opts)
    -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', keymap_opts)

  -- DISABLE KEYBINDINGS
  --lsp.default_keymaps({
  --  buffer = bufnr,
  --  omit = {'gs', 'K'},
  --})

  end)


  -- Install required nameservers!
  lsp_zero.ensure_installed(required_lsp_servers)
  -- # Ensure to use active python environment
  if contains(required_lsp_servers, "pylsp") then
    --require('lspconfig').pylsp.setup({
    --  before_init = function(_, config)
    --    local python_path = get_python_path(config.root_dir)
    --    -- config.settings.python.pythonPath = python_path
    --    vim.g.python_host_prog = python_path
    --    vim.g.python3_host_prog = python_path
    --  end
    --})
  end

  lsp_zero.setup()

  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    --- Make the first item in completion menu alywas ne selected
    preselect = 'item',
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    ---
    -- CMP config
    ---
    mapping = {
      ['<Tab>'] = cmp_action.tab_complete(),
      ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-k'] = cmp.mapping.select_prev_item(cmp_select_opts),
      ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
      ['<C-p>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item(cmp_select_opts)
        else
          cmp.complete()
        end
      end),
      ['<C-n>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item(cmp_select_opts)
        else
          cmp.complete()
        end
      end),
    },
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    }
  })

end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    config = function()
      setup_lsp_zero()
    end,
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = ":MasonUpdate"
      },
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {"ntevearc/dressing.nvim"}
    }
  }
}
--return {
--  {
--    "williamboman/mason.nvim",
--    config = function()
--      setup_mason()
--    end,
--    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
--  },
--  {
--    "williamboman/mason-lspconfig.nvim",
--    config = function()
--      setup_mason_lsp()
--    end,
--    dependencies = {
--      "williamboman/mason.nvim"
--    }
--  },
--  {
--    'neovim/nvim-lspconfig',
--    config = function()
--      setup_nvim_lspconfig()
--    end,
--    dependencies = {
--      'williamboman/mason.nvim',
--      'williamboman/mason-lspconfig.nvim',
--      "ntevearc/dressing.nvim",
--      --'jose-elias-alvarez/null-ls.nvim'
--    },
--  },
--}


