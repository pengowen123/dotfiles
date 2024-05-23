" Enable filetype plugins
filetype on

" Fix glsl not being detected
au BufNewFile,BufRead *.glsl* set ft=glsl

" Plugin config is done in a separate file
source $HOME/.config/nvim/plugin.vim

" Set colorscheme
colorscheme Tomorrow-Night-Bright

" Set tabline colors
hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow

" Make cursor a block in normal mode
set guicursor=

" Use GUI colors
if (has("termguicolors"))
	set termguicolors
endif

" Set formatting options
au BufNewFile,BufRead * call SetFormatOptions()

function! SetFormatOptions()
	set tw=100
	set fo+=t
	set fo-=l
endfunction

" Reload buffer on file change
set autoread
au CursorHold * checktime

" Disable netrw
let loaded_netrwPlugin = 1

" Mappings
nmap <C-Space> :noh<CR>
nmap <Space> :wa<CR>
nmap <C-f> zfa}
nmap j gj
nmap k gk
nmap gg ggzz
nmap '' ''zz
nmap `` ``zz
nmap <Leader>d :bd<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
imap <C-d> <Delete>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>t :!touch %<CR>
 map <C-i> <C-i>zz
nmap <C-o> <C-o>zz


" Settings
set rnu hidden undofile noshowmode cursorline smarttab ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set inccommand=nosplit
set scrolloff=5
