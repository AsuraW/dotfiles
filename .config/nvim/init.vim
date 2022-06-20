" vim:fileencoding=utf-8:foldmethod=marker:filetype=vim

"	                  _..--+~/@-~--.     Retro-setup: inlcudes vimscript
"	               _-=~      (  .   '    configurations for neovim,
"	            _-~     _.--=.\ \''''    old plugins and other prehistoric
"	          _~      _-       \ \_\     technologies.
"	         =      _=          '--'
"	        '      =                             .
"	       :      :       ____                   '=_. ___
"	  ___  |      ;                            ___ '~--.~.
"	       ;      ;                               _____  } |
"	    ___=       \ ___ __     __..-...__           ___/__/__
"	       :        =_     _.-~~          ~~--.__
"	  _____ \         ~-+-~                   ___~=_______
"	       ~@#~~ == ...______ __ ___ _--~~--_
" 
" Options{{{

let mapleader = "\<Space>"
set t_Co=256

set noshowmode
filetype plugin indent on
set number
set nomore
set encoding=utf-8
set termencoding=utf-8
set noeol
set hidden
set ruler
set cmdheight=2
set splitbelow
set splitright
set smarttab
set expandtab
set smartindent
set autoindent
set cursorline
set updatetime=300
set timeoutlen=100
set formatoptions-=cro
set clipboard=unnamedplus
set mouse=a
set scrolloff=10
set foldmethod=marker
highlight LineNr ctermfg=grey
syntax on

" }}}
" Plugged{{{

call plug#begin('~/.config/nvim/plugged')

" TEXT SUPPORT

" LaTeX Support

Plug 'lervag/vimtex'
Plug 'dense-analysis/ale' " LaTeX Linting

" Markdown
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}



" FILE MANAGMENT

" Git integration

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Explorer
" For now i prefer CoC-explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons



" ADDITIONAL FUNCLTIONS

"Intelisense

"Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Keeping up to date with master
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rbgrouleff/bclose.vim'

" APPEARANCE

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/vim-auto-save'
Plug 'fneu/breezy'


call plug#end()

":}}}
" Plugins config{{{

" Keys
nmap <silent> <leader>e :CocCommand explorer<CR>
nnoremap <silent> <leader>e :CocCommand explorer<CR>
nmap <leader>f :CocCommand explorer --preset floatingRightside<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
map <leader>c :w! \| !compiler "<c-r>%"<CR>
map <leader>a :CocAction<CR>

" LaTeX bindings
nnoremap <leader>c :VimtexCompile<CR>
nnoremap <leader>i :VimtexTocToggle<CR>
nnoremap <leader>p :VimtexView<CR>
" nnoremap <space>x :VimtexClean<CR>
" nnoremap <leader>c :VimtexCountWords<CR>
" nnoremap <space>l :VimtexLabelsToggle<CR>

let g:auto_save_no_updatetime = 1 " dont autosave while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification

" }}}
" Theme{{{
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_symbols.maxlinenr = ' ' " fix overlaping in konsole

set background=light
set termguicolors
colorscheme breezy
let g:airline_theme='breezy'
let python_highlight_all=1
let g:airline_powerline_fonts = 1

" Transparent terminal
hi Normal guibg=NONE ctermbg=NONE

" }}}
" Other{{{
" File encoding
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.
" }}}
