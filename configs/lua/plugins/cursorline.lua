return {
    "yamatsum/nvim-cursorline",
    opts = {
        cursorline = {
            enable = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        },
    },
    event = "BufRead",
}

