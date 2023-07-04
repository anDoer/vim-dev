return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        use_treesitter = true,
        filetype_exclude = { "alpha", "help", "man", "packer" },
    },
    event = "BufRead",
}

