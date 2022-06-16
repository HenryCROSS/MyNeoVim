# Instructions

## configs
- configs folder contains all the plugins config file and any other config files
- configs in there means all the settings including the plugin config, it can be the default settings
- Instructions:
    - other_plugins.lua: store the plugin configs that doesn't really need an isolated file

## core
- core folder contains the functions or objects that created by the developer
- features:
    - keybinding functions
    - plugin config
    - hooks
    - basic config

## api
- api folder stores the Global object that links to the functions or list from the core folder
- interfaces:
    - a parser for receving the list of config

## Main Idea of this layer


```

     ┌────────────────────┐
     │       User         │
     └────────────────────┘
               │
               ▼
     ┌────────────────────┐ 
     │       Configs      │                             
     └────────────────────┘ 
               │            
               ▼            
     ┌────────────────────┐
     │      Api           │
     └────────────────────┘
               │   ▲
               ▼   │
     ┌────────────────────┐
     │      Core          │
     └────────────────────┘
               │           
               ▼           
     ┌────────────────────┐
     │      nvim          │
     └────────────────────┘

```

### Process of loading

```
            ┌──────────────┐
            │config files  │─┐
            └──────────────┘ │
             └───────────────┘
                   │  convert the files into lists
                   ▼
                ┌───────────────┐
    ┌────────── │  parser       │
    │           └───────────────┘
    │                  │
    │                  ▼               ┌───────────────────┐
    │           ┌───────────────┐      │plugins list       │
    │           │  lists        │─────►│group list         │
    │config is  └───────────────┘      │       etc...      │
    │required to       │               └───────────────────┘
    │load              │
    │first             ▼
    │           ┌───────────────┐
    │           │load lists     │
    │           └───────────────┘
    │                  │
    ▼                  ▼
  ┌────────────────────────────────────────────────────────────┐
  │                                                            │
  │             neovim is started                              │
  │                                                            │
  └────────────────────────────────────────────────────────────┘







```
