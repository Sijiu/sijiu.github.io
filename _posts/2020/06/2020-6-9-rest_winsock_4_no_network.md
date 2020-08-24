---
layout: post
title: 重置 Winsock 解决能 ping 通却没有网络的问题
category: program
paginate: true
tags: ping Winsock DNS 网络
---
* 目录
{:toc}

> 最近, 电脑莫名其妙就没网了, `ping github.com` 却是通的, 但是浏览器却访问不到. 通讯软件也显示网络连接错误。  
> 重启电脑, 有时会恢复网络, 有时也没效果, 需要多次重启. 查看网络适配器等, 检查和插拔网线等均不能解决(原始粗暴🤦‍)  
> 后来查到 `netsh winsock reset`, 然后重启电脑就可以解决

## 一、 执行命令 `netsh winsock reset`  
- 需要管理员权限, " 开始 -> Windows 系统 -> 命令提示符" 右键 -> 更多 -> 以管理员身份运行
- netsh -> winsock -> reset
    ```bash
    Microsoft Windows [版本 10.0.18362.836]
    (c) 2019 Microsoft Corporation。保留所有权利。
    
    C:\WINDOWS\system32>netsh
    netsh>winsock
    netsh winsock>reset
    
    成功地重置 Winsock 目录。
    你必须重新启动计算机才能完成重置。
    
    netsh winsock>
    ```
> 完事重启电脑即可

### 二、关于 Winsock [[转](https://blog.csdn.net/pyufftj/article/details/51228729)]
>1. Winsock LSP全称Windows Socket Layered Service Provider(分层服务提供商)，它是Windows底层网络Socker
>通信需要经过的大门。一些流氓软件可以把自已加进去，就可以截取、访问、修改网络的数据包，可以随意添加广告，还能获取你的浏览习惯.如果加进的是木马，后果可想而知。而且因为LSP工作在底层，所以无论你用什么浏览器，都逃不了经过它。而LSP中的dll文件被删除后，就会出现无法上网的情况。
>
>2. netsh winsock reset命令，作用是重置 Winsock 目录。如果一台机器上的Winsock协议配置有问题的话将会导致网络连接等问题，就需要用netsh winsock reset命令来重置Winsock
目录借以恢复网络。这个命令可以重新初始化网络环境，以解决由于软件冲突、病毒原因造成的参数错误问题。 netsh是一个能够通过命令行操作几乎所有网络相关设置的接口，比如设置IP，DNS，网卡，无线网络等，Winsock是系统内部目录，Winsock是Windows网络编程接口，winsock工作在应用层，它提供与底层传输协议无关的高层数据传输编程接口，reset是对Winsock的重置操作。当执行完winsock的命令重启计算机后，需要重新配置IP。

