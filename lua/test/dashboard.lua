local if_nil = vim.F.if_nil

local default_header = {
    type = "text",
    val = {
       [[ MMMMMMMMMWMMMMMMMMMMMMMMMMMMMMMWMMMMMMMMMMMMMMMWXM]],
       [[ MMMMMMMMMWWMMMMMMWWWMMMWWWNNNMMMMMMMMMMMMMMMMWWNNM]],
       [[ MMMMWWWMMMMNNWWWNNXXK00O00OxdoxOXNNNMMMMMMMMMMMMNM]],
       [[ MMMMMMMMMMMWWNNNX0xolokO000OkdoodKXXWMMMMMWNMMMMMM]],
       [[ MMMMMMMMMMMMMMNKOOOkOO0K0000K0dood0XXKOO0NNWMMMMMM]],
       [[ MMMMMMMMMMMMWWX0OKO0OK0K0O0000kdoodoO0OO0XXNWMMMMM]],
       [[ MMMMMMMMMMWMMWKO00000K0OxOK000kOdoxdKNNNKKNNNNMWMW]],
       [[ MMMMMMWMMWMWMNOONKKdloxOkKKK0oOOxddoONWMWNNNNNMMWM]],
       [[ WWWMMMWMMWWWWOkKXK0Ol:xO0KOkkkOOddodkXWMMMWNNXXXWM]],
       [[ WWWMMMMMMWWWWK00Ok000KKK0Kd;:loxOxxxxXWMMWWMWWWWWM]],
       [[ MMMMMMMMMMWNNX00xdx0KKKKKK0k0ddOkOxxk0XMMWWMMMMMMM]],
       [[ MMMMMMMMMWWWNNX0Okxdo0OOKK0koOxxKXxkkKKWMMMWMMMMMM]],
       [[ MMMMMMMMMMWMWWNXKOx:;::oddol;,cOXKOOOXXWWMMWWWMMMM]],
       [[ MMMMMMMMMMWWWWWWKxdxolodxo;',;okXXKNNNNMWMMWNWMMMM]],
       [[ MMMMMMMMNKOdd0NXxool,'.......',,dNWWNWNWWMMMMMMMMM]],
       [[ MMMMMMMXOOo,,,,'''',;;;,,'.....,:KWNWWWMMMMMMMMMMM]],
       [[ MMWMMW0OOxcooxl::coxxOkoc:'....,:kWMWNWMMMMMMMMMMM]],
       [[ MMMMW0OOkco0KXKOO000XNXK0kxo:'',;xNMMMMMMMMMMMMMMM]],
       [[ MMMWK00k:lkXXK00KK0KK000OOk0o.',,dWWMMMMMMMMMMWMMM]],
       [[ MMMKddoc;xOO0KKKKK0KKKK00Okxkd'',cXWMMMMMMMMMMWMMM]],
       [[ MMMWxooodOXO00000K0KKKK00O0xol,'',oNMMMMMMMMMMMMMM]],
       [[ MMMMMK0KNWNXO000KKKKKKKKKKKKOx''',;lNMMMMMMMMMMMMM]],
       [[ MMMMMMWNNNNNOXXKKKKK0O0KKKK0Okxl;dOKKKWMMMMMWMMMMM]],
       [[ MMMMMMMMMMMWXWWNXKKKOO0KKK00OOO0OOOKXNKMMMMMWMMMMM]],
       [[ MMMMMMMMMMMMMMWWWNXKK0000OOxkkkkxxO0KXNNWMMMMMMMMM]],
       [[ MMMMMMMMWMMMMWWWWWNKOkkkxkkkkkO00OOkO0XNNMMMMMMMMM]],
       [[ MMMMMMMMMMMMMWMMWWN0OOOOOOkkx0K000OOOXXWWMMMMMMMMM]],
       [[ MMMMMMMMMMMMMWWWWNNXK0OkOOkkkKKK000OOONWMMMMMMMMMM]],
       [[ MMMMMMMMMWNMMWNNNWWWWWWWWNXOO0KKK000OOXWMMMMMMMMMM]],
       [[ MMMMMMMMMMMMMWWWWWWWWMMMMWWWNK000000OO0WWMMMMMMMMM]],
       [[ MMWNWWMMMMMMMMWWWWWWWWWWWWWWWWN0OkkOOO0NXMMMMMMMMM]],
       [[ MMMMMMMMMMMMMMMMWWWWWWWWWWMMMMMWX0xkkOXMXWMMMMMMMM]],
       [[ MMMMMMMMMMMMMMMMWNWWWWWWNMMMMMMMWXKOKXNMNXMMMMMMMM]],
       [[ MMMMMMMMMMMMMMMMMWWWWWWWWMMMMMMMMWXXKXXNWXMMMMMMMM]],
       [[ MMMMMMMMMMMMMMMMMMMWNNKXNMMMMMMMMMXXKKXXMNWMMMMMMM]],

    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "  New file", ":ene <CR>"),
        button("SPC f f", "  Find file"),
        button("SPC f h", "  Recently opened files"),
        button("SPC f r", "  Frecency/MRU"),
        button("SPC f g", "  Find word"),
        button("SPC f m", "  Jump to bookmarks"),
        button("SPC s l", "  Open last session"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    opts = opts,
}
