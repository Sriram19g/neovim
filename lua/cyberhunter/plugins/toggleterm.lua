return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local keymap = vim.keymap
        vim.keymap.set(
            "n",
            "<leader>th",
            "<cmd>ToggleTerm direction=horizontal<CR>",
            { noremap = true, silent = true, desc = "Terminal bottom" }
        )
        vim.keymap.set(
            "n",
            "<leader>tt",
            "<cmd>ToggleTerm direction=float<CR>",
            { noremap = true, silent = true, desc = "Terminal Float" }
        )
        vim.keymap.set("t", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
        vim.keymap.set("t", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
    end,
}
