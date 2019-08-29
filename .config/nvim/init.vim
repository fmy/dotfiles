"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
let g:vim_bootstrap_editor = "nvim" " nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'cohama/lexima.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'jacoborus/tender.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'ruanyl/vim-gh-line'
" languages
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'moll/vim-node'
Plug 'fatih/vim-go'
Plug 'zah/nim.vim'
Plug 'elmcast/elm-vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
" slack memo
Plug 'mattn/webapi-vim'
Plug 'tsuyoshiwada/slack-memo-vim'


let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()


" Required
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set autoindent

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set smartindent
set inccommand=split

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" clipboard
set clipboard=unnamed,unnamedplus

" runtime path
set rtp+=/usr/local/opt/fzf

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set cursorline
set list
set listchars=tab:>-,trail:-,nbsp:%

let no_buffers_menu=1
if (has("termguicolors"))
 set termguicolors
endif

if !exists('g:not_finish_vimplug')
  syntax enable
  " colorscheme tender
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

if has("syntax")
  syntax on

  " PODバグ対策
  syn sync fromstart
  function! ActivateInvisibleIndicator()
    "# 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endf
  augroup invisible
  autocmd! invisible
  autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif


" カーソル位置の復元
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"zz" | endif
augroup END

" sudo write
cabbrev sudo w !sudo tee %

" copy
autocmd InsertLeave * set nopaste

"*****************************************************************************
"" Key Remap
"*****************************************************************************
"--------------------------------------------------
" コマンド       ノーマル 挿入 コマンド ビジュアル
" map /noremap       @     -      -        @
" nmap / nnoremap    @     -      -        -
" imap / inoremap    -     @      -        -
" cmap / cnoremap    -     -      @        -
" vmap / vnoremap    -     -      -        @
" map! / noremap!    -     @      @        -
"--------------------------------------------------

nmap     <Space>   [Space]
nnoremap [Space]   <Nop>

" コロンセミコロン入れ変え
noremap ; :
noremap : ;

" move cursor
nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap j gjzz
nnoremap k gkzz
nnoremap G Gzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" reload config
nnoremap <Space>r :<C-u>source ~/.config/nvim/init.vim<CR>

" delete current buffer
nnoremap <C-c> :bd<CR>

" 挿入モードでのカーソル移動
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
"inoremap <C-a> <C-o>^
"inoremap <C-e> <C-o>$

"*****************************************************************************
"" fzf
"*****************************************************************************
nnoremap [fzf] <Nop>
nmap     <Space>f [fzf]
nnoremap <silent> [fzf]h :<C-u>:History<CR>
nnoremap <silent> [fzf]f :<C-u>:GFiles?<CR>
nnoremap <silent> [fzf]a :<C-u>:GFiles<CR>
nnoremap <silent> [fzf]s :call fzf#run({'source': 'git grep ' . expand('<cword>'), 'sink': function('Extract_from_grep')})<CR>

nnoremap <Space><Space> :<C-u>:Buffers<CR>

command! -nargs=1 V call fzf#run({'source': 'rg -n "' . expand('<args>') . '"', 'sink': function('Extract_from_grep')})

function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! Extract_from_grep(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

"*****************************************************************************
"" lightline.vim
"*****************************************************************************
" lightline settings
let g:lightline = {
  \ 'colorscheme': 'tender',
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode'
  \ }
\ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"*****************************************************************************
"" git fugitive
"*****************************************************************************
nnoremap [git]    <Nop>
nmap     <Space>g [git]

nnoremap <silent> [git]st  :<C-u>Gstatus<CR>
nnoremap <silent> [git]d   :<C-u>Gdiff<CR>
nnoremap <silent> [git]b   :<C-u>Gblame<CR>
nnoremap <silent> [git]h   v:Gbrowse<CR>

"*****************************************************************************
"" deoplete
"*****************************************************************************
let g:deoplete#enable_at_startup = 1

"inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
"inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : deoplete#mappings#manual_complete()

"*****************************************************************************
"" neomake
"*****************************************************************************
autocmd! BufWritePost * Neomake " 保存時に実行する
let g:neomake_javascript_enabled_makers = ['eslint']

"*****************************************************************************
"" other plugins
"*****************************************************************************
" vim-multiple-cursors

"*****************************************************************************
"" vim auto cursorline
"*****************************************************************************
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

"*****************************************************************************
"" osyo-manga/vim-textobj-multiblock
"*****************************************************************************
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"*****************************************************************************
"" osyo-manga/vim-textobj-multiblock
"*****************************************************************************
nmap s <Plug>(operator-replace)


"*****************************************************************************
"" vim-lsp
"*****************************************************************************
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif


" load local settings
if filereadable(expand('~/.config/nvim/local.vim'))
  source ~/.config/nvim/local.vim
endif

