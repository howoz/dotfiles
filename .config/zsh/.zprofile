if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #black
    echo -en "\e]P8928374" #darkgrey
    echo -en "\e]P1cc241d" #darkred
    echo -en "\e]P9fb4934" #red
    echo -en "\e]P298971a" #darkgreen
    echo -en "\e]PAb8bb26" #green
    echo -en "\e]P3d79921" #brown
    echo -en "\e]PBfabd2f" #yellow
    echo -en "\e]P4458588" #darkblue
    echo -en "\e]PC83a598" #blue
    echo -en "\e]P5b16286" #darkmagenta
    echo -en "\e]PDd3869b" #magenta
    echo -en "\e]P6689d6a" #darkcyan
    echo -en "\e]PE8ec07c" #cyan
    echo -en "\e]Pa89984" #lightgrey
    echo -en "\e]PFebdbb2" #white
    clear #for background artifacting
fi

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
	exec startx "$XINITRC"	
fi
