# linux 常用命令

- 移动文件

    > mv [file_name] [target_dir]

- 统计文件

    > wc [option: -l、-c、-w] filename;
    > * -l: 统计文件行数
    > * -c: 统计文件字节数
    > * -w: 统计文件字数

- 查看进程

    > ps -A: 查看所有进程
    > ps -a: 显示终端机下的所有进程
    > ps -ef|grep java: 显示所有java进程

- 统计一个文件夹下有多少文件

    > ls -Rl|wc -l


- 安装 pip

    * yum -y install epel-release
    * yum -y install python-pip

- 安装 shadowsocks

    > pip install shadowsocks
    
- 安装 netstat

    > yum install net-tools
    
- 防火墙相关

    - 查看状态： firewall-cmd -- state
    
    - 启动： systemctl start firewalld
    
    - 开机启动: systemctl enable firewalld
    
    - 关闭: systemctl stop firewalld
    
    - 取消开机启动: systemctl disable firewalled
    
    - 命令帮助: firewall-cmd --help 
    
- 后台运行一个程序

> nohup [运行程序的命令] &

- 压缩文件夹: tar -zvcf [xxx.tar] [dict_path]
- 列出文件夹中前 10 个文件: ls -l|head -n 10

- crontab 定时任务

`*  *  *  *   *    command`
`分 时 日 月 周    命令`





