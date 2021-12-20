local _, packer = pcall(require, "packer")
local plugin_loader = { }

function plugin_loader.load(plugin_arr)
	local status_ok, _ = xpcall(function ()
		packer.startup(function (use)
			for _, plugins in ipairs(plugin_arr) do
				for _, plugin in ipairs(plugins) do
					use(plugin)
				end
			end
		end)
	end, debug.traceback)

	if not status_ok then
		print("ERROR")	
	end
end
return plugin_loader