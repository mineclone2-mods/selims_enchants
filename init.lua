selims_enchants = {}

local modpath = minetest.get_modpath("selims_enchants")

for _,e in pairs({"magma_walker"}) do
	dofile(modpath.."/enchantments/"..e..".lua")
end