vim.pack.add {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/wakatime/vim-wakatime',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/morhetz/gruvbox',
}

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

vim.g.mapleader = ','
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.colorcolumn = '100'
vim.opt.textwidth = 100
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.path:append { '**' }
vim.opt.smoothscroll = true
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
-- vim.opt.statusline = '[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'

-- vim.cmd.colorscheme('retrobox')

-- disable mouse popup yet keep mouse enabled
vim.cmd [[
aunmenu PopUp
autocmd! nvim.popupmenu
]]

-- Only highlight with treesitter
vim.cmd('syntax off')

require("nvim-highlight-colors").setup {
    render = 'virtual',
    virtual_symbol = '⚫︎',
    virtual_symbol_suffix = '',
}
require('oil').setup {
    keymaps = { ['<C-h>'] = false },
    columns = { 'size', 'mtime' },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
}

-- Keymaps

vim.keymap.set('n', '<leader><leader>', ':Oil<CR>', { silent = true })

vim.keymap.set('n', '<leader>a', function()
    vim.cmd('$argadd %')
    vim.cmd('argdedup')
end)
vim.keymap.set('n', '<C-h>', function() vim.cmd('silent! 1argument') end)
vim.keymap.set('n', '<C-j>', function() vim.cmd('silent! 2argument') end)
vim.keymap.set('n', '<C-k>', function() vim.cmd('silent! 3argument') end)
vim.keymap.set('n', '<C-n>', function() vim.cmd('silent! 4argument') end)
vim.keymap.set('n', '<C-m>', function() vim.cmd('silent! 5argument') end)

-- QOL
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set('n', '<leader>v', ':e $MYVIMRC<CR>', { silent = true })

-- Fzf
vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':FzfLua grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':FzfLua helptags<CR>', { silent = true })

-- Autocommands

vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.o.signcolumn = 'yes:1'
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.o.complete = 'o,.,w,b,u'
            vim.o.completeopt = 'menu,menuone,popup,noinsert'
            vim.lsp.completion.enable(true, client.id, args.buf)
        end
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})


-- Snippets

local ls = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- Neovide Configuration

if vim.g.neovide then
    vim.o.guifont = "Monaco"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.keymap.set('n', '<D-=>', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end,
        { desc = "Zoom in" })
    vim.keymap.set('n', '<D-->', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end,
        { desc = "Zoom out" })
    vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p', { desc = "Paste from clipboard" })
    vim.keymap.set('i', '<D-v>', '<C-r>+', { desc = "Paste from clipboard" })
    vim.keymap.set('n', '<D-0>', function() vim.g.neovide_scale_factor = 1.0 end, { desc = "Reset zoom" })
end
