local M = {}

M.icon_preset = "diamond"
M.icons = {
    todo = {
        enabled = true,

        done = {
            enabled = true,
            icon = "",
            pattern = "^(%s*%-%s+%[%s*)x%s*%]%s+",
            whitespace_index = 1,
            highlight = "NeorgTodoItemDoneMark",
            padding_before = 0,
        },

        pending = {
            enabled = true,
            icon = "",
            pattern = "^(%s*%-%s+%[%s*)%*%s*%]%s+",
            whitespace_index = 1,
            highlight = "NeorgTodoItemPendingMark",
            padding_before = 0,
        },

        undone = {
            enabled = true,
            icon = "×",
            pattern = "^(%s*%-%s+%[)%s+]%s+",
            whitespace_index = 1,
            highlight = "TSComment",
            padding_before = 0,
        }
    },

    quote = {
        enabled = true,
        icon = "∣",
        pattern = "^(%s*)>%s+",
        whitespace_index = 1,
        highlight = "NeorgQuote",
        padding_before = 0,
    },

    heading = {
        enabled = true,

        level_1 = {
            enabled = true,
            icon = "◉",
            pattern = "^(%s*)%*%s+",
            whitespace_index = 1,
            highlight = "NeorgHeading1",
            padding_before = 0,
        },

        level_2 = {
            enabled = true,
            icon = "○",
            pattern = "^(%s*)%*%*%s+",
            whitespace_index = 1,
            highlight = "NeorgHeading2",
            padding_before = 1,
        },

        level_3 = {
            enabled = true,
            icon = "✿",
            pattern = "^(%s*)%*%*%*%s+",
            whitespace_index = 1,
            highlight = "NeorgHeading3",
            padding_before = 2,
        },

        level_4 = {
            enabled = true,
            icon = "•",
            pattern = "^(%s*)%*%*%*%*%s+",
            whitespace_index = 1,
            highlight = "NeorgHeading4",
            padding_before = 3,
        },
    },

    marker = {
        enabled = true,
        icon = "",
        pattern = "^(%s*)%|%s+",
        whitespace_index = 1,
        highlight = "NeorgMarker",
        padding_before = 0,
    },
}

return M
