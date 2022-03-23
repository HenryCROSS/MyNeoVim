local M = {}

M.load = function()
    require("notify").setup({
        -- Animation style (see below for details)
        stages = "fade_in_slide_out",

        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,

        -- Function called when a window is closed
        on_close = nil,

        -- Render function for notifications. See notify-render()
        render = "default",

        -- Default timeout for notifications
        timeout = 5000,

        -- Max number of columns for messages
        max_width = 50,
        -- Max number of lines for a message
        max_height = nil,

        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
        background_colour = "#000000",

        -- Minimum width for notification windows
        minimum_width = 50,

        -- Icons for the different levels
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎"
        }
    })

    vim.notify = require("notify")

    local plugin = "My Awesome Plugin"

    vim.notify("This is an error message.\nSomething went wrong!", "error", {
      title = plugin,
      on_open = function()
        vim.notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
          title = plugin,
        })
        local timer = vim.loop.new_timer()
        timer:start(2000, 0, function()
          vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
            title = plugin,
            timeout = 3000,
            on_close = function()
              vim.notify("Problem solved", nil, { title = plugin })
              vim.notify("Error code 0x0395AF", 1, { title = plugin })
            end,
          })
        end)
      end,
    })

end

return M
