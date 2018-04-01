# ----------------------------- kiwi bash history start --------------------------------
# 保证新登录的用户不会显示上一个用户的最后一条命令。##
echo "--New USER LONGIN--" >>~/.bash_history

# 使用readonly，防止有经验的用户使用覆盖的方式的恶意绕过历史命令记录。##
readonly HISTFILESIZE=9999
readonly HISTSIZE=9999
# 清空HISTCONTROL变量，禁用前导空格不记录功能。##
readonly HISTCONTROL=""
readonly HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
# 使用系统日志命令logger记录历史命令，logger通过socket实现，解决了普通用户无权限写入到/var/log中的问题。命令历史会被记录在/var/log/localmessages中，具体可以参考/etc/syslog-ng/syslog-ng.conf中的配置。日志的转储由lograte负责，具体可参考/etc/logrotate.d/syslog 中的配置。##
readonly PROMPT_COMMAND='cur_time=$(date "+%Y-%m-%d %H:%M:%S"); cur_cmd=$(history 1 | sed "s|^[[:space:]]*[0-9][0-9]*[[:space:]][[:space:]]*[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] ||g"); cur_dir=$(pwd); cur_user=$(whoami); cur_login_info=$(who -m | tr -s " "); logger -i -p local0.info -t "bash_history_enhance" "TIME:[$cur_time], CMD:[$cur_cmd], PWD:[$cur_dir], USER:[$cur_user], LOGIN_INFO:[$cur_login_info]"'
# ----------------------------- kiwi bash history end ----------------------------------
