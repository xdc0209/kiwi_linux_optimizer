# ----------------------------- kiwi common commands start ------------------------------
# 按行输出参数，方便人眼查看过多的参数##
function WordsToLines()
{
    # stdin：如果没有参数，则读取标准输入##
    [ $# -eq 0 ] && cat /dev/stdin | sed 's/\s\s*/\n/g'

    # args：存在参数，直接处理参数##
    [ $# -ne 0 ] && echo "$@" | sed 's/\s\s*/\n/g'
}

# 彩色版cat命令，方便人眼区分不同的行(在终端上，过长的行会被折行，导致不易分辨不同的行)##
function ColorLines()
{
    local colors=(31 32 33 34 35 36 37)
    local count=0

    [ $# -eq 0 ] && local files=/dev/stdin # stdin：如果没有文件，则读取标准输入##
    [ $# -ne 0 ] && local files="$@"       # files：指定文件，直接处理文件##

    for file in $files
    do
        cat $file | while read line
        do
            local color="${colors[$((count++ % ${#colors[@]}))]}"
            echo -e "\e[${color}m${line}\e[0m"
        done
    done
}

# tailf日志并用tee重定向##
function Tailf()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <logFileName>" && return 1

    local log=$(readlink -m $1)
    local teeLog=$(dirname $log)/tee.$(basename $log)

    [ ! -f $log ]                  && echo "[$log] is not a file!"    && return 1
    [ -e $teeLog -a ! -f $teeLog ] && echo "[$teeLog] is not a file!" && return 1

    >$teeLog
    tailf $log | tee -a $teeLog
}

# 简化find用法##
function Find()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <searchString>" && return 1

    find . -iname "*$1*" | grep -i --color "$1"
}

# 简化grep用法##
function Grep()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <searchString>" && return 1

    grep -inr --color "$1" .

    # 替代方案##
    # echo "alias Grep='find . | xargs grep -inr --color'" >>$HOME/.bashrc##
}

# 简化du用法##
function Du()
{
    du --max-depth=1 "$@"

    # 替代方案##
    # echo "alias Du='du --max-depth=1'" >>$HOME/.bashrc##
}

# 简化ps用法##
function Ps()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <searchString>" && return 1

    ps -efww | grep -v grep | grep -i --color "$1"
}

# 简化netstat用法##
function Netstat()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <searchString>" && return 1

    netstat -anp | grep -i --color "$1"
}

# 查看网卡速率##
function NicRate()
{
    [ $# -ne 1 ] && echo "Usage: $FUNCNAME <ethX>" && return 1

    while [ "1" ]
    do
        eth=$1
        RXpre=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $2}')
        TXpre=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $10}')
        sleep 1
        RXnext=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $2}')
        TXnext=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $10}')
        clear
        RX=$((${RXnext} - ${RXpre}))
        TX=$((${TXnext} - ${TXpre}))

        if [[ $RX -lt 1024 ]]; then
            RX="${RX}B/s"
        elif [[ $RX -gt 1048576 ]]; then
            RX=$(echo $RX | awk '{print $1/1048576 "MB/s"}')
        else
            RX=$(echo $RX | awk '{print $1/1024 "KB/s"}')
        fi

        if [[ $TX -lt 1024 ]]; then
            TX="${TX}B/s"
        elif [[ $TX -gt 1048576 ]]; then
            TX=$(echo $TX | awk '{print $1/1048576 "MB/s"}')
        else
            TX=$(echo $TX | awk '{print $1/1024 "KB/s"}')
        fi

        # -e参数使换行符\n、制表符\t等可以生效##
        echo -e "$(date +%k:%M:%S) RX(receive) TX(transport) \n$eth $RX $TX" | column -t
    done
}

# 统计各个TCP连接状态的个数，用于方便排查系统连接负荷问题##
function TcpConnectionStateCounter()
{
    netstat -an | awk '/^tcp/ {++status_count_array[$NF]} END{for(status in status_count_array) print status, status_count_array[status]}' | column -t | sort -nr -k2
}

# 简化tcpdump用法##
function Tcpdump()
{
    if [ $# -eq 1 ]; then
        local port=$1
        echo "tcpdump -nSX -s 0 port $port"
        tcpdump -nSX -s 0 port $port
    elif [ $# -eq 2 ]; then
        local ethX=$1
        local port=$2
        echo "tcpdump -nSX -s 0 -i $ethX port $port"
        tcpdump -nSX -s 0 -i $ethX port $port
    else
        echo "Usage1: $FUNCNAME <port>"
        echo "Usage2: $FUNCNAME <ethX> <port>"
        return 1
    fi
}

# 展示帮助信息##
function HelpLinux()
{
    echo 'WordsToLines              按行输出参数，方便人眼查看过多的参数'
    echo 'ColorLines                彩色版cat命令，方便人眼区分不同的行'
    echo 'Tailf                     tailf日志并用tee重定向'
    echo 'Find                      简化find用法'
    echo 'Grep                      简化grep用法'
    echo 'Du                        简化du用法'
    echo 'Ps                        简化ps用法'
    echo 'Netstat                   简化netstat用法'
    echo 'NicRate                   查看网卡速率'
    echo 'TcpConnectionStateCounter 统计各个TCP连接状态的个数'
    echo 'Tcpdump                   简化tcpdump用法'
    echo
    echo 'HelpLinux                 展示帮助信息'
}

# 其他命令##
alias l='ls -alF'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias vi='vim'
alias tailf='tail -f'
alias grep='grep --color=auto'
# ----------------------------- kiwi common commands end --------------------------------
