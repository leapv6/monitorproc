# monitorproc
 运用crontab检测程序是否在运行，可通过检测进程或检测端口，如果程序没在运行，可调用指定的命令

* 下载原代码
<pre> #git clone https://github.com/leapv6/monitorproc </pre>
* 修改检测配置 
<pre> #cd monitorproc; vi config.cfg </pre>
* 定时检测
> 在系统定时任务中添加一条记录，每1min执行一次检测
<pre>
    #crontab -e
    记录：* * * * * cd /home/monitorproc && ./monitorproc.sh
</pre>

* 配置文件config.cfg说明
<pre>
mqtt_stat_net.php|1|cd /home/;php mqtt_stat_net.php 1>/dev/null 2>&1 &|proc
9090|1|/etc/init.d/nginx restart|port
3306|1|/etc/init.d/mysql restart|port
</pre>
 >一行对应一个检测项，中间用｜隔开，总共4项<br/>
 名称|存在个数，如果是port端口 则是1|执行命令｜类型（port端口），proc(进程)<br/>
 第一项：检测项,进程名称或端口号<br/>
 第二项：检测量,如果是端口检测时，设置为1。如果是进程检测时，为检测进程数量，如果进程检测量小于这个值时，则运行命令
 ，主要运用在一个检测项在多个进程中<br/>
 第三项: 运行的命令，如果检测端口号启动数量小于1或检测进程启动数据小于设定的值则运行该命令<br/>
 第四项：标志项，proc 为进程检测，port为端口检测

 * 检测原理
 >  检测端 #ss -tln 
 >  检测进程 检测 目录 /proc/* 下面
 
