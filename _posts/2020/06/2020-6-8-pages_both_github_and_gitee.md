---
layout: post
title: git pages 在 github 和 gitee 同时发布
category: program
paginate: true
tags:
- pages
- github
- gitee
---
* 目录
{:toc}

### 1. 在两个平台分别创建 pages 服务
> 详细搭建教程参见 [参考](#参考)  
* github: https://github.com/Sijiu/sijiu.github.io.git  
* gitee: https://gitee.com/mplain/mplain.git  
> github 创建 repo 名称为 用户名.github.io 则pages地址为 用户名.github.io  
> gitee 创建 repo 名称为 用户名 , 路径同用户名, 则pages地址为 用户名.github.io  

### 2. 将任意一个平台创建的 pages 的库 clone 到本地
- 以 github 为例, `git clone https://github.com/Sijiu/sijiu.github.io.git`  
- 然后在 idea 中打开项目, 菜单栏操作: "VCS -> Git -> Remotes... " 选中 `origin`那一行, 点击
编辑(右侧铅笔形按钮), 将`origin` 改为 `github`  
- 再点击添加(右侧＋按钮), name 填 `gitee`, url 填上边创建的gitee pages 仓库地址 `https://gitee.com/mplain/mplain.git`  
- 1. 切换分支到本地 github 的 pages 分支下, commit 和 push .md 文章到远程 github 的 pages 分支;  
- 2. 然后本地新建gitee 的 pages 分支, 拉取上一步 push 到github 的 pages 分支的文章到本地 gitee pages 分支, push 到 gitee 的 pages 分支;
- 3. 至此, 2 对分支(github pages local+remote, gitee pages local+remote) 的代码一致. 2024-02-01 15:51:16[修订]
`切记是本地新建分支， 推送到对应库的远程 ` 不然会引起很多不必要的麻烦。  
3. 
> github pages 会自动编译.md 文章为静态页面, 大约5s 左右刷新.io 页面即可看到;   
> gitee page 个人版和企业免费版, 则需要推送完 在"服务, pages" 页面下手动更新(2024 编辑发现还要实名认证, 上传身份证正反面照片及本人持证正反面四张照片,简直了), 美中不足吧, 毕竟大家都要吃饭;

### 3. 拓展 gitlab, 企业 pages等
> 同时发布gitlab pages 也一样, 通上边, 先创建 pages 仓库, 然后 remote 添加即可

#### 参考
[Websites for you and your projects.](https://pages.github.com/)  
[GitHub Pages 搭建教程](https://sspai.com/post/54608)  
[码云Pages](https://gitee.com/help/articles/4136)


