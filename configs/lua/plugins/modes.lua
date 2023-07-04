return {
    "mvllow/modes.nvim",
    version = "v0.2.0",
    event = "BufRead",
    config = function()
        require("modes").setup()
    end,
}

