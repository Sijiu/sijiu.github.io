---
layout: post  
title: Python 项目自动生成 requirement.txt 文件  
category: program  
tags: python pip requirement pipreqs  
---
* 目录
{:toc}

### 一、根据环境中的包生成  
   ```bash
    pip freeze > requirements.txt
   ```  
> 缺点显而易见, 当环境中有的包, 在项目中没有用到的时候, requirement.txt 中的包会有多余  

### 二、利用 pipreqs 包

   ```bash
   pip install pipreqs

   pipreqs /your/project/path  # /your/project/path 项目的真实地址
   Traceback (most recent call last):  

    File "c:\python37\lib\runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
    File "c:\python37\lib\runpy.py", line 85, in _run_code
    exec(code, run_globals)
    File "C:\Python37\Scripts\pipreqs.exe\__main__.py", line 9, in <module>
    File "c:\python37\lib\site-packages\pipreqs\pipreqs.py", line 470, in main
    init(args)
    File "c:\python37\lib\site-packages\pipreqs\pipreqs.py", line 409, in init
    follow_links=follow_links)
    File "c:\python37\lib\site-packages\pipreqs\pipreqs.py", line 122, in get_all_imports
    contents = f.read()
    UnicodeDecodeError: 'gbk' codec can't decode byte 0x9a in position 1129: illegal multibyte sequence
   ```
> 打开文件 `c:\python37\lib\site-packages\pipreqs\pipreqs.py` 122行 上一行中 `encoding=encoding` 修改为 `encoding="utf8"` 重试
   ```bash
   pipreqs `/your/project/path`  # /your/project/path 项目的真实地址

   INFO: Successfully saved requirements file in /your/project/path/requirements.txt
   ```  

> pipreqs 可以通过对项目目录的扫描，自动生成依赖清单到 requirements.txt, 但是也需要检查下文件确保正确;

