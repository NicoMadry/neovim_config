return {
    "kosayoda/nvim-lightbulb",
    config = function()
        require("nvim-lightbulb").setup {
            autocmd = {
                enabled = true
            }
        }
    end
}
