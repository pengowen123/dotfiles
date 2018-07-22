" Plugin installation and configuration

" Install plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'romainl/Apprentice'
Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
Plug 'vmchale/ion-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'lotabout/skim'
Plug 'lotabout/skim.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'itchyny/lightline.vim'
Plug 'tommcdo/vim-exchange'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-buftabline'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'zhou13/vim-easyescape'
"Plug 'neomake/neomake'
Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh'
	\ }
call plug#end()

" Make deoplete completion selection work
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Use skim with rg for the Ag plugin
" FIXME: This doesn't work
"let g:ag_prg = "sk --ansi -i -c 'rg `{}`'"


" Enable neomake error window
"let g:neomake_open_list = 2

" Change neomake rust maker to use cargo
"augroup my_neomake_cmds
    "autocmd!
    " Have neomake run cargo when Rust files are saved.
    "autocmd BufWritePost *.rs Neomake cargo
"augroup END


" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }


" Language server config
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup','run','nightly','rls'],
	\ }

" EasyMotion settings
let g:EasyMotion_smartcase = 1

" Rainbow settings
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'rust': {
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" Configure easyescape
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 60
cnoremap jk <ESC>
cnoremap kj <ESC>
