# Linux环境配置优化工具

## 简介

本工具是一个Linux环境配置优化工具，以提高工作效率。  

## 约束

1. 本工具支持Red Hat、CentOS、Ubuntu、SUSE。  
2. 本工具仅对当前用户生效。如需支持多用户，需在每个用户下执行本工具。  

## 使用

上传此工具到环境的任意目录，执行`bash install.sh`。  

## 功能

1. 添加常用命令(重新登陆生效)。优化的配置文件：`$HOME/.bashrc`。  

   | 命令                      | 说明                                 |
   | ------------------------- | ------------------------------------ |
   | WordsToLines              | 按行输出参数，方便人眼查看过多的参数 |
   | ColorLines                | 彩色版cat命令，方便人眼区分不同的行  |
   | Tailf                     | tailf日志并用tee重定向               |
   | Find                      | 简化find用法                         |
   | Grep                      | 简化grep用法                         |
   | Du                        | 简化du用法                           |
   | Ps                        | 简化ps用法                           |
   | Netstat                   | 简化netstat用法                      |
   | NicRate                   | 查看网卡速率                         |
   | TcpConnectionStateCounter | 统计各个TCP连接状态的个数            |
   | Tcpdump                   | 简化tcpdump用法                      |
   |                           |                                      |
   | HelpLinux                 | 展示帮助信息                         |

2. 优化命令提示符和终端标题(重新登陆生效)。优化的配置文件：`$HOME/.bashrc`。  

3. 增强命令历史功能(重新登陆生效)。优化的配置文件：`$HOME/.bashrc`。  

4. 配置SSH超时时间(重新登陆生效)。优化的配置文件：`$HOME/.bashrc`。  

5. 配置sudo日志。优化的配置文件：`/etc/sudoers`。  

6. 优化vim配置。优化的配置文件：`$HOME/.vimrc`。  

7. 源码安装lrzsz。  
