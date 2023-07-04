-- Author: shadmansaleh
-- Credit: glepnir

local colors = {
    bg = "#2E3440",
    fg = "#E5E9F0",
    yellow = "#EBCB8B",
    cyan = "#88C0D0",
    darkblue = "#5E81AC",
    green = "#A3BE8C",
    orange = "#D08770",
    violet = "#8A3FA0",
    magenta = "#B48EAD",
    blue = "#81A1C1",
    red = "#BF616A",
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 79
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local section_color = { fg = colors.fg, bg = colors.gb }

local function setup()
    return {
        options = {
            globalstatus = true,
            theme = {
                normal = {
                    a = section_color,
                    b = section_color,
                    c = section_color,
                },
                inactive = {
                    x = section_color,
                    y = section_color,
                    z = section_color,
                },
            },
            component_separators = "",
            section_separators = "",
        },
        extensions = { "quickfix" },
        sections = {
            lualine_a = {
                {
                    function()
                        return "▊"
                    end,
                    color = { fg = colors.darkblue },
                    padding = { left = 0, right = 1 },
                },
            },
            lualine_b = {
                {
                    function()
                        local mode_color = {
                            n = colors.red,
                            i = colors.blue,
                            v = colors.green,
                            [""] = colors.green,
                            V = colors.green,
                            c = colors.magenta,
                            no = colors.red,
                            s = colors.orae,
                            S = colors.orange,
                            [""] = colors.orange,
                            ic = colors.yellow,
                            R = colors.violet,
                            Rv = colors.violet,
                            cv = colors.red,
                            ce = colors.red,
                            r = colors.cyan,
                            rm = colors.cyan,
                            ["r?"] = colors.cyan,
                            ["!"] = colors.red,
                            t = colors.red,
                        }
                        local mode_names = {
                          n = "Normal",
                          i = "Insert",
                          v = "Visual",
                          V = "V-Line",
                          [""] = "V-Block",
                          c = "Command",
                          s = "Select",
                          S = "S-Line",
                          [""] = "S-Block",
                          t = "Terminal",
                        }
                        vim.api.nvim_command(
                            "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg
                        )
                        return mode_names[vim.fn.mode()]
                    end,
                    color = "LualineMode",
                    padding = { right = 1 },
                },
            },
            lualine_c = {
                {
                    "branch",
                    icon = "",
                    cond = conditions.check_git_workspace,
                    color = { fg = colors.darkblue, gui = "bold" },
                },
                {
                    "diff",
                    symbols = { added = " ", modified = " ", removed = " " },
                    diff_color = {
                        added = { fg = colors.green },
                        modified = { fg = colors.orange },
                        removed = { fg = colors.red },
                    },
                    cond = conditions.hide_in_width,
                },
                {
                    function()
                        local virtualenv = require("swenv.api").get_current_venv()
                        if virtualenv then
                            return virtualenv.name
                        end

                        return ""
                    end,
                    color = { fg = colors.cyan },
                    icon = "",
                },
                {
                    function()
                        return "%="
                    end,
                },
                {
                    function()
                        local msg = "No Active Lsp"
                        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = "| LSP:",
                    color = { fg = colors.yellow },
                },
                {
                    "diagnostics",
                    cond = conditions.hide_in_width,
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " " },
                    diagnostics_color = {
                        color_error = { fg = colors.red },
                        color_warn = { fg = colors.yellow },
                        color_info = { fg = colors.cyan },
                    },
                },
            },
            lualine_x = {
                {
                    "filename",
                    cond = conditions.buffer_not_empty,
                    color = { fg = colors.blue, gui = "bold" },
                    path = 1,
                },
                {
                    "location",
                    cond = conditions.hide_in_width,
                },
                {
                    "fileformat",
                    cond = conditions.hide_in_width,
                },
            },
            lualine_y = {
                {
                    "filetype",
                    cond = conditions.buffer_not_empty,
                },
            },
            lualine_z = {
                {
                    function()
                        return "▊"
                    end,
                    color = { fg = colors.cyan },
                    padding = { left = 1 },
                },
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_v = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    opts = setup(),
    dependencies = {
        "nvim-web-devicons",
    },
}
