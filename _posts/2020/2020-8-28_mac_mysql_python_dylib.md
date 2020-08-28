---
layout: post  
title: MacOs下安装 MySQLdb 及 libmysqlclient.18.dylib 的一系列问题 
category: program  
tags: python MySQLdb libmysqlclient MacOs
---
* 目录
{:toc}  

> 因为重装系统缘故， 之前 mac 下安装使用 dmg 方式都没有任何问题， 这次用 brew 引发惨案。
### 1. mac 下 python2 连接 MySql 的方式
#### 1.1 安装 MySQLdb 即 pip install mysql-python  
    问题最多， 本文主要记录这种方式安装过程的坑  
#### 1.2 使用 mysqlclient， pip install mysqlclient 方式  
    兼容 1.1 只是连接总是有 （'2006'， ''）报错
#### 1.3 使用 PyMySQL， pip install PyMySQL, python3 基本都用这个  
    不兼容 1.1 和 1.2   

### 2. brew 安装 mysql 后安装
    使用 brew install mysql@5.6 安装 mysql 后 pip install mysql-python 会`可能`报错：
    1. EvironmentError:mysql_config not found
    2. _mysql.c:44:10: fatal error: 'my_config.h' file not found
        #include "my_config.h"
                 ^~~~~~~~~~~~~
        1 error generated.
        error: command 'cc' failed with exit status 1
    3. 等等  
* 网上的解决办法大多因为环境和版本不同等原因， 成功率很低。
### 3. 未安装 mysql 直接安装
    需要去安装    
    libmysqld-dev
    libmysqlclient-dev 等包， 而且安装完后报错基本同 2 
    
* 总之2， 3 都没能顺利解决， 不建议使用  
### 4. 下载 mysql-xxx.dmg 安装包安装 mysql 后安装  
#### 4.1 下载 [mysql-5.6.26-osx10.9-x86_64.dmg](https://mac.filehorse.com/download-mysql/5662/old-versions/) 并安装启动； 
    安装完， 会在 系统偏好设置 里有 MySQL， 点击run 就好  
    系统里可能没有 mysql 命令， 将 /usr/local/mysql/bin 添加到 ～/.zshrc 中， 并 source ～/.zshrc
    
    mysql 端口可能是 3307， 具体可以用下列方式查看：
    1. 终端 mysqladmin variables -p

    2. 进入 mysql> show global variables;
#### 4.2 安装， pip install mysql-python（基本都能安装成功）  
#### 4.3 使用中可能报错与解决：
    1 image not found  
    File "/Users/plain/venv/lib/python2.7/site-packages/MySQLdb/__init__.py", line 19, in <module>
    import _mysql
    ImportError: dlopen(/Users/plain/venv/lib/python2.7/site-packages/_mysql.so, 2): Library not loaded: libmysqlclient.18.dylib
      Referenced from: /Users/plain/venv/lib/python2.7/site-packages/_mysql.so
      Reason: image not found
    解决：
       查看 /usr/lib 与 /usr/local/mysql/lib 下有没有 libmysqlclient.18.dylib mysql版本不同的时候可能是 libmysqlclient.2x.dylib
       （/usr/lib/ 大概没有 /usr/local/mysql/lib 应该有 ）
       如果 上述路径下有一个与报错中 libmysqlclient.xx.dylib 文件一致，给 /usr/lib/ 做软连接：  
       切记是 .dylib 看清文件扩展名 不是 .lib
       
       sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib  
       
       如果不一致， 需要修改 _mysql.so 中的 libmysqlclient.xx.dylib xx与 /usr/local/mysql/lib一致：
       sudo install_name_tool -change  报错版本.dylib 目录下实际版本.dylib 报错中_mysql.so的路径python2.7/site-packages/_mysql.so  
       sudo install_name_tool -change /usr/local/mysql/lib/libmysqlclient.20.dylib /usr/local/mysql/lib/libmysqlclient.21.dylib /Users/xxx/lib/python2.7/site-packages/_mysql.so
       
#### 4.3.1 上述 建立软连接过程中可能问题：
    1 Permission denied  
    ln: /usr/bin/libmysqlclient.18.dylib: Permission denied
    Permission denied 命令前加 sudo 即可
    
    2 Read-only file system  
    ln: /usr/bin/libmysqlclient.18.dylib: Read-only file system
    Read-only file system 这种需要 关闭sip 后在终端执行 sudo mount -uw /
    3 关闭 sip
    重启MAC，按住 cmd+R 直到屏幕上出现苹果的标志和进度条，进入 Recovery 模式；
    黑果 启动时 OC 下按空格， 选择进入 Recovery 模式：
    查看SIP 状态：csrutil status
    关闭 SIP：   csrutil disabled
    打开 SIP：   csrutil enabled   
--

