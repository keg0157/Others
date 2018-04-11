# オプション
export PATH=/bin:$PATH
setopt always_to_end        # 補完の後にカーソルを末尾に移動する
setopt auto_cd              # ディレクトリ名で cd する
setopt auto_list            # TAB を1回入力後に補完候補を一覧で表示する
setopt auto_menu            # TAB で補完候補を選択する
setopt auto_param_keys      # 括弧の対応などを補完する
setopt correct              # コマンドのスペルミスを訂正する
setopt correct_all          # ファイル名など、入力の全てについてスペルミスを訂正する
setopt extended_history     # ヒストリに時刻を付加する
setopt glob_subst           # コマンドライン引数を補完する
setopt hist_expand          # 補完にヒストリを利用する
setopt hist_ignore_dups     # 直前と同一のコマンドをヒストリに追加しない
setopt list_packed          # 補完候補を可能な限り詰めて表示する
setopt list_types           # 補完候補にファイルの種類を表示する
setopt list_rows_first      # 補完候補を横方向に表示する
setopt magic_equal_subst    # コマンドライン引数での ’=‘ の後ろを補完する
setopt share_history        # 他のシェルのヒストリをリアルタイムで共有する
setopt histignorealldups    # ヒストリーの重複を許容しない
setopt print_eight_bit      # 日本語のファイル名も表示可能にする
autoload -Uz compinit       # コマンドを補完する
compinit -u                 # -u: compinit によるセキュリティのチェックを無効に>する
function chpwd() { ls -1 }  # cd したらls
# 色
autoload -Uz colors         # シェルをカラーで表示する
colors

# ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 環境変数
export LANG=ja_JP.UTF-8
export EDITOR=vi
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH=$PATH:/Users/masuda/bin
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# エイリアス
alias mv='mv -i'                    # -i: 上書きされるファイルが存在する場合に確認する
alias cp='cp -i'                    # -i: 上書きされるファイルが存在する場合に確認する
alias vi='vim'                      # viでvimを開く
alias mkdir='mkdir -p'              # エラーを表示せず記述したディレクトリが存在しなければ作成する
alias ls='ls -F'                    # -F: エントリ名に / , @ , * などの種別を表>す文字を付加する
alias -g C='| pbcopy'               # |pbcopy ⇒ |C
alias count='ls -U1 | wc -l'        # dirのファイル数を表示
alias ...='cd ../..'                # cd ../../ ⇒ ..
alias ....='cd ../../..'            # cd ../../../ ⇒ ...
alias subl='/Applications/Sublime\ Text\ \(3103\).app/Contents/SharedSupport/bin/subl' # sublでSublimeTextを開く

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -G"            # -G: ls をカラーで表示する
    ;;
    linux*)
        alias ls="ls --color"       # --color: ls をカラーで表示する
    ;;
esac

# コマンドプロンプトの外観
PROMPT="%B%F{magenta}%n %B%F{white}at %B%F{yellow}%m %f%F{white} (%W %T) %f%b %B%F{white}in  %{${fg[cyan]}%}%~%{${reset_color}%}  "$'\n'"%# "
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1                     # 補完候補をハイライトする, 矢印キーで補完候補を選択する
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}    # 補完候補もLS_COLORSに合わせて色が付くようにする
