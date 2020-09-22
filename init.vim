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

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする

command! FZFFileListInBuffer call fzf#run({
			\ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
			\ 'sink': 'e',
			\ 'window': 'enew',
			\ })
