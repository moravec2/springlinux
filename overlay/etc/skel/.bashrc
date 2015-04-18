#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# Add nano as default editor
export EDITOR=nano
export TERMINAL=lxterminal
export BROWSER=firefox
# Gtk themes 
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

alias ls='ls --color=auto'

alias state='sudo sv status /var/service/*'

