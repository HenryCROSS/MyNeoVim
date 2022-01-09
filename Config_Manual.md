# NVIM配置手册

## 文件结构

```
.
├── back_up
├── lua
│   ├── bootstrap
│   ├── core
│   │   ├── config
│   │   └── plugin
│   ├── libs
│   │   └── Lib_Log
│   └── test
└── plugin
```


- back_up 用于存放备份文件
- lua		用于存放lua脚本
  - bootstrap 用于存放引导函数
  - core		用于存放核心文件
  - libs		用于存放配置需要用的函数
  - test		存放测试用的函数
- plugin		packer自己生成的文件
