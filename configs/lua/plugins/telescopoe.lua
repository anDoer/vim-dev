local function setup()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.load_extension("fzf")
    telescope.load_extension("mapper")
    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            mapper = {
              -- do not assign the default keymap (<leader>MM)
              no_map = false,
              -- where should ripgrep look for your keybinds definitions.
              -- Default config search path is ~/.config/nvim/lua
              search_path = os.getenv("HOME") .. "/.config/nvim/lua",
              -- what should be done with the selected keybind when pressing enter.
              -- Available actions:
              --   * "definition" - Go to keybind definition (default)
              --   * "execute" - Execute the keybind command
              action_on_enter = "definition",
            },
        },
        pickers = {
            git_files = {
                show_untracked = true,
            },
        },
        defaults = {
            mappings = {
                i = {
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-k>"] = actions.move_selection_previous,
                    -- source: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-esc-to-quit-in-insert-mode
                    ["<esc>"] = actions.close,
                    ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
            },
            file_ignore_patterns = { "node_modules", "%.git/" },
            prompt_prefix = " ",
            use_less = false,
            sorting_strategy = "ascending",
            selection_caret = "  ",
            entry_prefix = "  ",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            path_display = { "truncate" },
            border = {},
            set_env = { ["COLORTERM"] = "truecolor" },
        },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    config = function()
        setup()
    end,
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
          "nvim-lua/popup.nvim",
        }
    },
    --keys = {
    --    { "<leader>tf", "<cmd>Telescope find_files<CR>" },
    --    --{ "<leader>fo", "<cmd>Telescope file_browser<CR>" },
    --    { "<leader>tg", "<cmd>Telescope git_files<CR>" },
    --    { "<leader>tl", "<cmd>Telescope live_grep<CR>" },
    --    { "<leader>tb", "<cmd>Telescope buffers<CR>" },
    --    { "<leader>th", "<cmd>Telescope help_tags<CR>" },
    --    { "<leader>to", "<cmd>Telescope oldfiles<CR>" },
    --},
    cmd = "Telescope",
}
