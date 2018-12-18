# ----------------------------- kiwi command prompt start -------------------------------
# 优化命令提示符##
[ $UID -eq 0 ] && export PS1='\[\e[01;31m\]\u@\h\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\]\$ '
[ $UID -ne 0 ] && export PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\]\$ '

# 优化终端标题##
SSH_SERVER=$(echo $SSH_CONNECTION | awk '{print $3}') && [ -n "$SSH_SERVER" ] && echo -en "\e]0;$SSH_SERVER\a"
# ----------------------------- kiwi command prompt end ---------------------------------
