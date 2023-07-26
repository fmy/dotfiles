-- lualine
require('lualine').setup()

-- LSP
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })

-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
]]

local function on_attach(client, bufnr)
  -- Find the clients capabilities
  local cap = client.resolved_capabilities

  -- Only highlight if compatible with the language
  if cap.document_highlight then
    vim.cmd('augroup augroup lsp_document_highlight')
    vim.cmd('autocmd!')
    vim.cmd('autocmd CursorHoldI * lua vim.lsp.buf.document_highlight()')
    vim.cmd('autocmd CursorMovedI * lua vim.lsp.buf.clear_references()')
    vim.cmd('augroup END')
  end
end
require('lspconfig').tsserver.setup({on_attach = on_attach})

-- completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- ['<Tab>'] = cmp.mapping.confirm({ select = true })
  }),
  experimental = {
    ghost_text = true,
  },
})

-- color of floating window
vim.cmd [[
hi NormalFloat guibg=#495057
]]


-- method textDocument/documentHighlight
