shell守护进程 

1.运行方式 sh deamon.sh  放在crontab下面 一分钟检查一次守护的进程

2.主要基于业务,守护rabbitmq的进程 代码注释脚本里大致都有写

3.消费者进程的代码写在laravel框架下的command里面,换其他方式只需要更改下面命令即可

4.处女作 不知道该咋说明 甚至有点紧张

执行步骤

1.正常启动

![image-20220118150501051](https://github.com/798047557/daemon_process/blob/main/step1.jpg)

2.带restart重启

![image-20220118150501051](https://github.com/798047557/daemon_process/blob/main/step2.jpg)

3.如果只挂掉一个进程,例如需要开三个挂掉一个就会自动补全到设置的进程数量

![image-20220118150501051](https://github.com/798047557/daemon_process/blob/main/step3.jpg)

