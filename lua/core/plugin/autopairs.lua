local autopairs_settings = {}
local npairs = require('nvim-autopairs')
local ts_conds = require('nvim-autopairs.ts-conds')
local Rule = require('nvim-autopairs.rule')

function autopairs_settings.load()
    npairs.setup {
        -- 启用treesitter
        check_ts = true
    }

	-- press % => %% only while inside a comment or string
    npairs.add_rules({
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({
            'string', 'comment'
        })),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
    })
end

return autopairs_settings
