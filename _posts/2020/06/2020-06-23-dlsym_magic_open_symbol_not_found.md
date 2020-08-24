---
layout: post
title: symbol not found 的解决
category: program
tags: dlsym magic_open
---

* 目录
{:toc}

> 安装运行 fava 时一个错误 dlsym(RTLD_DEFAULT, magic_open):   

### 一、报错:  
   ```bash
    File "/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/ctypes/__init__.py", line 366, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))  
    AttributeError: dlsym(RTLD_DEFAULT, magic_open): symbol not found  
    
   ```  
  


### 二、解决    
 
    查找资料, 有的介绍是 Macos dlsym 此等环境 xcode 的问题, 需要安装新的 xcode 之类的解决方案, 成本太高  
    
后发现 该问题应为 Python-magic 库相关, 尝试升级解决:    

   ```bash
   pip3 install --upgrade python_magic  
Looking in indexes: http://pypi.doubanio.com/simple  
Collecting python_magic  
  Downloading http://pypi.doubanio.com/packages/59/77/c76dc35249df428ce2c38a3196e2b2e8f9d2f847a8ca1d4d7a3973c28601/python_magic-0.4.18-py2.py3-none-any.whl
Installing collected packages: python-magic    
  Found existing installation: python-magic 0.4.15  
    Uninstalling python-magic-0.4.15:  
      Successfully uninstalled python-magic-0.4.15  
Successfully installed python-magic-0.4.18  
   ```  
   
如上由 `pip3 install --upgrade python_magic` 由 0.4.15 升级到 0.4.18 该问题被修复.  
