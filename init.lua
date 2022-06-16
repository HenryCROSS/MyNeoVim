-- load libs
-- require("libs")

-- -- load keymapping
-- require("core.keymapping").load()
--
-- -- -- load lsp
--  -- require("core.lsp"):load()
--
-- -- load plugins
--  require("core.plugin"):load()
--
-- -- load the general settings
-- require("core.config.settings").load_options()
--
-- -- load test plugins
-- require("test").load()

-- require("bootstrap").load()
-- require("global").load()
-- require("core").load()
-- vim.o.fillchars = "vert:┃,horiz:━,verthoriz:╋,horizup:┻,horizdown:┳,vertleft:┫,vertright:┣"
-- vim.o.laststatus = 3
-- require("test").load()
--
require("api")
require(".")

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
