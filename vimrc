" 入力関連
set tabstop=4           		"タブの幅をスペース4つ分
set expandtab           		"タブを半角で挿入
set noexpandtab         		"タブではなく半角スペースを挿入
set shiftwidth=4        		"自動インデントでずれる幅をスペース4つ分
set shiftround                  "インデントをshiftwidthの値の倍数にする
set autoindent 					"前行のインデントを継続して改行
set whichwrap=b,s,[,],<,> 		"カーソルの回り込みを可能に 
set matchpairs+=<:>             "(%)入力で閉じ括弧を検索
set backspace=indent,eol,start  "Backspaceキーの影響範囲に制限を設けない
set encoding=utf-8		    	"デフォルト文字コード UTF-8
set textwidth=0 	            "勝手に改行されるのを防ぐ
set noswapfile                  "swapファイルの作成を無効
set infercase                   "補完時に大文字小文字を区別しない
set virtualedit=all             "カーソルを文字が存在しない部分でも動けるようにする
set hidden                      "バッファを閉じる代わりに隠す（Undo履歴を残すため
set switchbuf=useopen           "新しく開く代わりにすでに開いてあるバッファを開く
set fenc=utf-8                  "文字コードをutf-8に
set title 						"編集中ファイル名の表示
set showcmd                     " 入力中のコマンドをステータスに表示する

" 検索関連
set ignorecase          		"大文字小文字を区別しない
set smartcase           		"検索文字に大文字がある場合は大文字小文字を区別
set incsearch           		"インクリメンタルサーチ
set hlsearch            		"検索マッチテキストをハイライト
set wrapscan 		   		    "検索がファイル末尾まで進んだらファイル先頭から再び検索

" 表示関連
set syntax=markdown
set ruler                       "ルーラー表示
set title               		"タイトル表示
set history=100                 "コロンコマンドを記録する数
set showmatch               	"対応する括弧やブレースを強調表示
set matchtime=1                 "対応する括弧やブレースを強調表示にかかる時間
set cursorline                  "行を強調表示
set nonumber              		"行数表示しない
set pumheight=10                "補完メニューの数を10個に制限
syntax on  						"強調表示
colorscheme molokai             "カラースキーマ
set background=dark             "背景を黒色にする
let &t_ti.="\e[5 q"             "カーソルを変更

highlight Comment ctermfg=DarkCyan
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" その他
set t_vb=				"beep音をoff
inoremap <Leader>c <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

""" Markdown関連
"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  " 初回起動時のみruntimepathにneobundleのパスを指定する  
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

au BufRead,BufNewFile *.md set filetype=markdown
