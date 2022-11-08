local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  fileencodings = "utf-8,iso-2022-jp,sjis,ccp932,euc-jp",
  bomb = true,
  binary = true,
  -- Fix backspace indent
  backspace = "indent,eol,start",
  -- Tabs. May be overriten by autocmd rules
  tabstop = 2,
  softtabstop = 0,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  -- Enable hidden buffers
  hidden = true,
  -- Searching
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  smartindent = true,
  inccommand = "split",

  -- Directories for swp files
  backup = false,
  swapfile = false,

  fileformats = "unix,dos,mac",
  showcmd = true,
  shell = "$SHELL",
  -- clipboard
  clipboard = "unnamed,unnamedplus",

  undofile = true,
  ruler = true,
  number = true,
  cursorline = true,
  list = true,
  listchars = "tab:>-,trail:-,nbsp:%",
  termguicolors = true,

  mousemodel = "popup",
  guifont = "Menlo:h12",

}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set expandtab")
