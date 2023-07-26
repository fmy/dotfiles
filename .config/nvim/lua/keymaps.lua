local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',


-- コロンセミコロン入れ変え
keymap("n", ";", ":", { noremap = true })
keymap("n", ":", ";", { noremap = true })

-- move cursor
keymap("n", "<C-a>", "0", opts)
keymap("n", "<C-e>", "$", opts)
keymap("n", "j", "gjzz", opts)
keymap("n", "k", "gkzz", opts)
keymap("n", "G", "Gzz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- delete current buffer
keymap("n", "<C-c>", ":bd<CR>", opts)

-- 挿入モードでのカーソル移動
keymap("i", "<C-n>", "<Down>", opts)
keymap("i", "<C-p>", "<Up>", opts)
keymap("i", "<C-b>", "<Left>", opts)
keymap("i", "<C-f>", "<Right>", opts)

-- show undotree
keymap("n", "<Space>u", ":<C-u>:UndotreeToggle<CR>", opts)

-- vim-test
keymap("n", "<Space>tt", ":<C-u>:TestNearest<CR>", opts)
keymap("n", "<Space>ta", ":<C-u>:TestFile<CR>", opts)

-- git fugitive
keymap("n", "<Space>gst", ":Gstatus<CR>", opts)
keymap("n", "<Space>gd", ":Gdiff<CR>", opts)
keymap("n", "<Space>gb", ":Git blame<CR>", opts)
keymap("n", "<Space>gh", ":GBrowse<CR>", opts)

-- telescope
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
vim.keymap.set("n", "<Space>fs", builtin.grep_string, opts)
vim.keymap.set("n", "<Space>fd", builtin.lsp_references, opts)
keymap("n", "<Space>fh", "<C-u>:Telescope frecency workspace=CWD<CR>", opts)
vim.keymap.set("n", "<Space>ff", extensions.file_browser.file_browser, opts)
vim.keymap.set("n", "<Space>fh", extensions.frecency.frecency, opts)
