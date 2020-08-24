---
layout: post
title: 修改本地 HOSTS 文件解决 DNS 污染
category: program
paginate: true
tags:
- HOSTS
- DNS
---
* 目录
{:toc}
### 访问网站变慢可能是 DNS 污染
### 1. 如何解决 DNS 污染？
 通过修改 Hosts 解决污染问题。一般的 DNS 问题都可以通过修改 Hosts 文件来解决，GitHub 的 CDN 域名被污染问题也不例外，同样可以通过修改 Hosts 文件解决。将域名解析直接指向 IP 地址来绕过 DNS
  的解析，以此解决污染问题。  
  
### github 实践
> 1、打开IPAddress.com网站，查询下面 3 个网址对应的 IP 地址  
 
   ```text
    github.com  192.30.253.112 192.30.253.113
    assets-cdn.github.com  101.184.133
    global.ssl.fastly.net  151.101.185.194
   ```
> 2、修改本地电脑系统 HOSTS 文件（路径一般都是 C:\Windows\System32\drivers\etc），直接在最后加入以下代码  
   ```text
    192.30.253.112 github.com
    192.30.253.113 github.com
    151.101.184.133 assets-cdn.github.com
    151.101.185.194 github.global.ssl.fastly.net
   ```

> 3、用“WIN +Ｒ”快捷键打开运行窗口，输入命令：cmd 并回车进入命令行窗口，接着输入命令：`ipconfig /flushdns` 回车后执行刷新本地 DNS 缓存数据即可。  

#### [中国访问GitHub为什么很慢，如何加速访问？](https://boke112.com/post/6397.html)