# ----------------------------- kiwi command prompt start -------------------------------
# 优化命令提示符##
[ $UID -eq 0 ] && export PS1='\[\e[01;31m\]\u@\h\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\]\$ '
[ $UID -ne 0 ] && export PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\]\$ '

# 优化终端标题，再配合Xshell，达到在标签上显示当前机器IP的效果，Xshell配置：右键标签--显示终端标题--勾选上##
SSH_SERVER=$(echo $SSH_CONNECTION | awk '{print $3}') && [ -n "$SSH_SERVER" ] && echo -en "\e]0;$SSH_SERVER\a"
# ----------------------------- kiwi command prompt end ---------------------------------
