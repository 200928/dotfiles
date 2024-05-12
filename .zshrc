# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# cd ~
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# 设置代理
export HTTP_PROXY="http://127.0.0.1:8889"
export HTTPS_PROXY="http://127.0.0.1:8889"

export NODE_OPTIONS="--max-old-space-size=4096"

export QT_PLUGIN_PATH="/usr/lib/qt/plugins"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 # ZSH_THEME="murilasso"
# ZSH_THEME="awesomepanda" # 单一箭头
# ZSH_THEME="re5et"
# ZSH_THEME="robbyrussell"  
# ZSH_THEME="agnoster"
# ZSH_THEME="amuse"
# ZSH_THEME="random" 
# ZSH_THEME="eastwood" 		# [~]$ 
# ZSH_THEME="dieter" 		# 20:45:35 minghui@Mingarch ~
# ZSH_THEME="gentoo"
# ZSH_THEME="essembeh"
# ZSH_THEME="jonathan"
ZSH_THEME="ys"

######################主题样式##########################
# [oh-my-zsh] Random theme 'jtriley' loaded
# 18:31 minghui@Arch /home/minghui

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	wd
	sudo
	vi-mode
    web-search
    last-working-dir
    catimg
    z
    fzf-tab
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

######################################### vim光标切换 ##########################################
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[6 q'

# Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[6 q'
}

_fix_cursor() {
	echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)

KEYTIMEOUT=1

############################################################################################
#########################fzf-begin
# export FZF_COMPLETION_TRIGGER='\'
#########################fzf-end
#
#Hypeland
# 启动 wayland 桌面前设置一些环境变量
 function set_wayland_env
 {
  cd ${HOME}
  # 设置语言环境为中文
  export LANG=zh_CN.UTF-8
  # 解决QT程序缩放问题
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
  # QT使用wayland和gtk
  export QT_QPA_PLATFORM="wayland;xcb"
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  # 使用qt5ct软件配置QT程序外观
  export QT_QPA_PLATFORMTHEME=qt5ct

  # 一些游戏使用wayland
  export SDL_VIDEODRIVER=wayland
  # 解决java程序启动黑屏错误
  export _JAVA_AWT_WM_NONEREPARENTING=1
  # GTK后端为 wayland和x11,优先wayland
  export GDK_BACKEND="wayland,x11"

 }

 # 命令行输入这个命令启动hyprland,可以自定义
 function start_hyprland
 {
  set_wayland_env

  export XDG_SESSION_TYPE=wayland
  export XDG_SESSION_DESKTOP=Hyprland
  export XDG_CURRENT_DESKTOP=Hyprland
  # 启动 Hyprland程序
  exec Hyprland

 }
#########

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

HIST_STAMPS="yyyy-mm-dd"
#echo "Hello!!!" | lolcat
export PATH=$PATH:/home/minghui/.local/share/gem/ruby/3.0.0/bin
export PATH=/home/minghui/.local/bin/:$PATH
# alias blog_upload="cd /mnt/file/Blog/灰灰爱吃小云朵/ && ./ArchLinux.shell && cd -"
alias s="startx"
alias up="sudo pacman -Syu"
alias ls="colorls"
alias ll="colorls -l"
# alias vim='nvim'
alias ra='ranger'
alias ssh-aws-minghui="ssh -i \"/home/minghui/Downloads/FanGe.pem\" minghui@ec2-52-34-142-230.us-west-2.compute.amazonaws.com" 
alias ne="neofetch | lolcat"
alias xclipi="xclip -i -selection clipboard"
alias xclipo="xclip -o -selection clipboard"
alias pi="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
alias pu="yay -Qu | cut -d ' ' -f1 | fzf --multi | xargs yay -S"
alias pun="yay -Q | cut -d ' ' -f1 | fzf --multi | xargs -o yay -Rns"

alias kill_port="lsof -i -P | awk 'NR>1 {print \$2, \$1, \$9}' | fzf --preview 'echo \"Process Details:\"; echo {}; echo \"----------\"; ps -p \$(echo {} | awk \"{print \$1}\") -o pid,user,cmd' --preview-window=up:40%:wrap | awk '{print \$1}' | xargs -r kill"
alias kill_name="ps -ef | fzf -m --preview 'echo \"Process Details:\"; echo {}; echo \"----------\"; ps -p \$(echo {} | awk \"{print \$2}\") -o pid,user,cmd' --preview-window=up:40%:wrap | awk '{print \$2}' | xargs -r kill"
# alias kill_port="lsof -i -P | awk 'NR>1 {print $2, $1, $9}' | fzf --preview 'echo "Process Details:"; echo {}; echo "----------"; ps -p $(echo {} | awk "{print \$1}") -o pid,user,cmd' --preview-window=up:40%:wrap | awk '{print $1}' | xargs -r kill"
# alias kill_name="ps -ef | fzf -m --preview 'echo "Process Details:"; echo {}; echo "----------"; ps -p $(echo {} | awk "{print \$2}") -o pid,user,cmd' --preview-window=up:40%:wrap | awk '{print $2}' | xargs -r kill
# "
alias npmsg="npm -registry http://10.88.4.34:8181/repository/npm-public/"
alias pysudo="sudo PYTHONPATH=/home/minghui/.local/lib/python3.11/site-packages/:$PYTHONPATH "
alias lgit=lazygit
alias lg=leetgo

# 防止误删
alias rm="rm -i"
alias mv="advmv -g"
alias cp="advcp -g"

export EDITOR=/usr/bin/nvim
source /usr/share/nvm/init-nvm.sh

PATH="/home/minghui/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/minghui/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/minghui/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/minghui/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/minghui/perl5"; export PERL_MM_OPT;
eval "$(atuin init zsh)"
