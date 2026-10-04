#!/bin/sh
# This file is executed when starting Ly (before the TTY is taken control of)
# Custom startup code can be placed in this file or the start_cmd var can be pointed to a different file


# Uncomment the example below for an example of changing the default TTY colors to an alternitive palette on linux
# Colors are in red/green/blue hex (the current colors are a brighter palette than default)
#
# if [ "$TERM" = "linux" ]; then
# 	BLACK="232323"
# 	DARK_RED="D75F5F"
# 	DARK_GREEN="87AF5F"
# 	DARK_YELLOW="D7AF87"
# 	DARK_BLUE="8787AF"
# 	DARK_MAGENTA="BD53A5"
# 	DARK_CYAN="5FAFAF"
# 	LIGHT_GRAY="E5E5E5"
# 	DARK_GRAY="2B2B2B"
# 	RED="E33636"
# 	GREEN="98E34D"
# 	YELLOW="FFD75F"
# 	BLUE="7373C9"
# 	MAGENTA="D633B2"
# 	CYAN="44C9C9"
# 	WHITE="FFFFFF"

# 	COLORS="${BLACK} ${DARK_RED} ${DARK_GREEN} ${DARK_YELLOW} ${DARK_BLUE} ${DARK_MAGENTA} ${DARK_CYAN} ${LIGHT_GRAY} ${DARK_GRAY} ${RED} ${GREEN} ${YELLOW} ${BLUE} ${MAGENTA} ${CYAN} ${WHITE}"

# 	i=0
# 	while [ $i -lt 16 ]; do
# 		printf "\033]P%x%s" ${i} "$(echo "$COLORS" | cut -d ' ' -f$(( i + 1)))"

# 		i=$(( i + 1 ))
# 	done

# 	clear # for fixing background artifacting after changing color
# fi

# Gruvbox Material console palette
printf '\033]P0282828'   # black   -> background
printf '\033]P1ea6962'   # red
printf '\033]P2a9b665'   # green   -> olive
printf '\033]P3d8a657'   # yellow  -> ochre
printf '\033]P47daea3'   # blue
printf '\033]P5d3869b'   # magenta
printf '\033]P689b482'   # cyan
printf '\033]P7d4be98'   # white   -> beige text
printf '\033]P8928374'   # bright black
printf '\033]P9ea6962'
printf '\033]PAa9b665'
printf '\033]PBd8a657'
printf '\033]PC7daea3'
printf '\033]PDd3869b'
printf '\033]PE89b482'
printf '\033]PFd4be98'
clear
