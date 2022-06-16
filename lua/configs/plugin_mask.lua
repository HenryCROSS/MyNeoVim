--[[
    This is for masking the plugins
    type should be PROPERTY.MASK
    mask_type could be "GROUPS" or "PLUGINS"
]]

local PROPERTY = api_o_const.PROPERTY

return {
    {
        type = PROPERTY.MASK,
        mask_type = "GROUPS",
        config = {

        }
    },
    {
        type = PROPERTY.MASK,
        mask_type = "PLUGINS",
        config = {

        }
    }
}