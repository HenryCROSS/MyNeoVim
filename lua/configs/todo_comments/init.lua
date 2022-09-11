local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("configs.todo_comments.configs")
        end

    },
}

