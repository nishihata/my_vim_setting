colorscheme one
:syntax on
:set hlsearch
":set tabstop=4
":set autoindent
":set expandtab
":set shiftwidth=4
:set noswapfile

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/300606/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/300606/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'slim-template/vim-slim'

" =========================================================================================
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" =========================================================================================
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" unite.vimの設定
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " ファイル一覧
noremap <C-U><C-R> :Unite file_mru<CR> " 最近使ったファイル一覧
au FileType unite nnoremap <silent> <buffer> <expr> <C-i>
" unite#do_action('split') " ウィンドウを分割して開く
au FileType unite inoremap <silent> <buffer> <expr> <C-i>
" unite#do_action('split')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" =========================================================================================
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" =========================================================================================
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" unite-tagsの設定
"autocmd BufEnter *
"\   if empty(&buftype)
"\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
"\|  endif

" =========================================================================================
NeoBundle 'soramugi/auto-ctags.vim'
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1
set tags+=.git/tags

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

