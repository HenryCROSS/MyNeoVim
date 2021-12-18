# NVIM 学习手册

## lua-vimscript
- Nvim lua 为用户提供了一套vim的变量和函数还有编辑器命令以及选项

### vim.call({func}, {...})
- 调用需要参数的函数

### vim.cmd({func})
- 执行多于一行的Vimscript
- 用法如下：
```lua
vim.cmd('echo 42')
vim.cmd([[
	augroup My_group
		autocmd!
		autocmd FileType c setlocal cindent
	augroup END
]])
```

### vim.fn.{func}(){...}
- 用于执行函数
- 不同于vim.api.nvim_call_function，该方法的会直接返回相同类别的Vim对象或者Lua对象，例如Vim函数返回float,这个float就相当于Lua的number

### lua-vim-variables
- 这些全局表(global dictionaries)用于给Lua直接读写, 让Vimscript变量更加容易被Lua修改
- 用法如下：
```lua
vim.g.foo = 5
print(vim.g.foo)
vim.g.foo = nil
```

#### vim.g
- 全编辑器变量(Global editor variable)，没东西的时候返回nil

#### vim.b
- 缓冲区变量，只在当前缓冲区有效, 错误或者没有的时候返回nil

#### vim.w
- 窗口区变量，只在当前窗口有效，错误或者没有的时候返回nil

#### vim.t
- 标签页变量，只在当前标签页有效，错误或者没有的时候返回nil

#### vim.v
- v: variables，错误或者没有的时候返回nil

#### vim.env
- 环境变量，被定义在editor session，错误或者没有的时候返回nil

### lua-vim-options/lua-vim-opt/lua-vim-set/lua-vim-optlocal/lua-vim-setlocal
#### vim.opt
- 用于设置某些选项
- 例如设置一个用作切换的选项：
```lua
-- In vimL:
	set number
-- In Lua:
	vim.opt.number = true
```
- 例如设置一个列表:
```lua
-- In vimL:
	set wildignore=*.o,*.a,__pycache__
-- In Lua，这里有2种写法:
	vim.opt.wildignore = '*.o,*.a,___pycache__'
	vim.opt.wildignore = { '*.o', '*.a', '___pycache__' }
```
- vimL中的:set+=在Lua中是:
```lua
-- 使用+号
vim.opt.wildignore = vim.opt.wildignore + { "*.pyc", "node_modules" }

--使用:append(...)
vim.opt.wildignore:append { "*.pyc", "node_modules" }
```

- vimL中的:set^=在Lua中是:
```lua
-- 使用^号
vim.opt.wildignore = vim.opt.wildignore ^ { "new_fist_value" }

-- 使用:prepend(...)
vim.opt.wildignore:prepend { "new_fist_value" }
```
- vimL中的:set-=在Lua中是:
```lua
-- 使用-号
vim.opt.wildignore = vim.opt.wildignore - { "node_moduiles" }

-- 使用:remove(...)
vim.opt.wildignore:remove { "node_moduiles" }
```
- 设置一个表：
```lua
-- In vimL:
set lischars=space:_,tab:>~
-- In Lua:
vim.opt.listchars = { space = '-', tab = '>~' }
```
- 对于以上的例子，setlocal对应vim.opt_local, setglobal对用vim.opt_global
- vim.opt会返回一个Option类的对象：
```lua
local listchar_object = vim.opt.listchar
```
- Option类的成员函数
  - vim.opt:append()
  - vim.opt:prepend()
  - vim.opt:remove()
- 同时vim.opt还提供了更简单的方法去设置：

| lua           | command    | global_value | local_value |
| ------------- | ---------- | ------------ | ----------- |
| vim.o         | :set       | set          | set         |
| vim.bo/vim.wo | :setlocal  | -            | set         |
| vim.go        | :setglobal | set          | -           |

#### vim.o
- 对于编辑器选项进行获取或者修改：
```lua
vim.o.cmdheight = 4
print(vim.o.colums)
```
#### vim.go
- 对于一个选项进行读取或者修改
- 非法变量会造成错误
- 这是对nvim_set_option()和nvim_get_option()的封装
- 和vim.o不同的是vim.go**只会**设置全局变量
- 例子：
```lua
vim.go.cmdheight = 4
```
#### vim.bo
- 只对缓冲区进行读取或修改
- 这是对nvim_buf_set_option()和nvim_buf_get_option()的封装
- 例子：
```lua
vim.bo.buflisted = true
print(vim.bo.comments)
```

#### vim.wo

- 只对当前窗口区进行读取或修改
- 这是对nvim_win_set_option()和nvim_win_get_option()的封装
- 例子：
```lua
vim.wo.cursorcolumn = true
print(vim.wo.foldmarker)
```

## vim.api

- 这是一个用于暴露公共API的对象
- 用法如下：
```lua
vim.api.nvim_command()
```

## vim.loop

- 这是一个用于暴露了Nvim event-loop API的对象
- 他还提供了networking, filesystem还有process management的功能
- 他没法直接把vim.api的函数当回调函数使用，需要靠vim.schedule_warp()去封装一次
- 用法如下：
```lua
vim.loop.new_time()
```