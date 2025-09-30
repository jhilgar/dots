vim.pack.add{
    { src = 'https://github.com/catppuccin/nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
}

vim.g.mapleader = " "

vim.keymap.set(
	'n',
	'<leader>ff', 
	function() require('fzf-lua').files() end,
	 { desc = 'find files' }
 )

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true



vim.cmd("colorscheme catppuccin-macchiato")

vim.diagnostic.config{
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
}

vim.lsp.config('basedpyright', {
    settings = {
        basedpyright = {
            typeCheckingMode = "basic",
        },
    },
})
vim.lsp.enable('basedpyright')

vim.lsp.enable('ruff')
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, bufopts)
    end,
})
