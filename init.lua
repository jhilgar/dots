-- "there are many like it, but this one is mine"
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.pack.add{
    { src = 'https://github.com/folke/tokyonight.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
    { src = 'https://github.com/folke/drop.nvim' },
    { src = 'https://codeberg.org/andyg/leap.nvim' },
    { src = 'https://github.com/itchyny/lightline.vim' },
}

vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', '<C-j>', '<Esc>')
vim.keymap.set('i', '<C-j>', '<Esc>')
vim.keymap.set('v', '<C-j>', '<Esc>')
vim.keymap.set('s', '<C-j>', '<Esc>')
vim.keymap.set('x', '<C-j>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Esc>')
vim.keymap.set('o', '<C-j>', '<Esc>')
vim.keymap.set('l', '<C-j>', '<Esc>')
vim.keymap.set('t', '<C-j>', '<Esc>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')

vim.keymap.set(
	'n',
	'<leader>ff', 
	function() require('fzf-lua').files() end,
	 { desc = 'find files' }
 )

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')

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

vim.cmd("colorscheme tokyonight")

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
