" define usermap {{{1
let g:mapleader = "\<Space>"
" }}}
"

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein {{{1
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  let s:toml = '~/.config/nvim/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" }}}1

" completion options {{{1
set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
" inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"pumvisible() ? "" : "

" }}} 1

set timeoutlen=1000 ttimeoutlen=0

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

let loaded_matchparen = 1

command! FZFFileListInBuffer call fzf#run({
			\ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
			\ 'sink': 'e',
			\ 'window': 'enew',
			\ })

inoremap <silent> jj <ESC>

" tmux {{{2
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap s0 <C-w>t
nnoremap sT <C-w>T
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap th :-tabm<CR>
nnoremap tl :+tabm<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
" }}}

" Quick toggle options.
nnoremap <silent> <Leader>on :<C-u>setlocal number! number?<CR>

map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

" move in insert
inoremap <C-f> <Right>
inoremap <C-b> <Left>

nnoremap <silent> <Leader><Leader> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" refresh hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>

" fileTypeIndent{{{2
augroup fileTypeIndent
	autocmd!
	autocmd BufRead,BufNewFile *.go setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.rs setlocal tabstop=4 softtabstop=4 shiftwidth=4
	autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufRead,BufNewFile *.cabal setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufRead,BufNewFile *.copl setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.java setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.s setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.c setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.h setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.asm setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufRead,BufNewFile *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2  expandtab
	autocmd BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.asm setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.fs setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd BufRead,BufNewFile *.ml setlocal tabstop=4 softtabstop=4 shiftwidth=4
	autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufRead,BufNewFile *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.s setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile *.hdl setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufRead,BufNewFile Makefile setlocal tabstop=8 softtabstop=8 shiftwidth=8
	autocmd BufRead,BufNewFile *.make setlocal tabstop=4 softtabstop=4 shiftwidth=4
	autocmd BufRead,BufNewFile *.dockerfile setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufRead,BufNewFile Dockerfile setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
" }}}

set foldmethod=marker
