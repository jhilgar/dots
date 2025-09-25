vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.pack.add{
    { src = 'https://github.com/catppuccin/nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.cmd("colorscheme catppuccin-macchiato")

vim.diagnostic.config{
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
}

vim.lsp.enable('basedpyright')
vim.lsp.config('basedpyright', {
    settings = {
        basedpyright = {
            typeCheckingMode = "basic",
        },
    },
})
