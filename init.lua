vim.pack.add{
    { src = 'https://github.com/catppuccin/nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
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

require("bufferline").setup{
  options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      show_buffer_close_icons = true,
      show_close_icon = false,
  }
}

vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = 'pick buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'prev buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'next buffer' })

vim.cmd("colorscheme catppuccin-macchiato")

vim.diagnostic.config{
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, bufopts)
    end,
})
vim.lsp.enable('ruff')

vim.lsp.config('ty', {
    cmd = { 'ty', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ty.toml', '.git' },
})
vim.lsp.enable('ty')
