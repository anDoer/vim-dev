return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
        { "<leader>do", "<cmd>DiffviewOpen<CR>" },
        { "<leader>dq", "<cmd>DiffviewClose<CR>" },
        { "<leader>dh", "<cmd>DiffviewFileHistory<CR>" },
    },
}

