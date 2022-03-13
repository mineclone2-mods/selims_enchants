local S = minetest.get_translator("selims_enchants")

local ipairs = ipairs
local vector = vector

mcl_enchanting.enchantments.magma_walker = {
	name = S("Magma Walker"),
	max_level = 2,
	primary = {},
	secondary = {armor_feet = true},
	disallow = {non_combat_armor = true},
	incompatible = {depth_strider = true, frost_walker = true},
	weight = 2,
	description = S("Turns lava beneath the player into magma blocks."),
	curse = false,
	on_enchant = function() end,
	requires_tool = false,
	treasure = true,
	power_range_table = {{10, 25}, {20, 35}},
	inv_combat_tab = true,
	inv_tool_tab = false,
}

mcl_enchanting.enchantments.frost_walker.incompatible.magma_walker = true

walkover.register_global(function(pos, _, player)
	local boots = player:get_inventory():get_stack("armor", 5)
	local magma_walker = mcl_enchanting.get_enchantment(boots, "magma_walker")
	if magma_walker <= 0 then
		return
	end
	local radius = magma_walker + 2
	local minp = vector.add(pos, vector.new(-radius, 0, -radius))
	local maxp = vector.add(pos, vector.new(radius, 0, radius))
	local positions = minetest.find_nodes_in_area(minp, maxp, "mcl_core:lava_source") --there is no real air in nether
	for _, p in ipairs(positions) do
		if vector.distance(pos, p) <= radius then
			minetest.set_node(p, {name = "mcl_nether:magma"})
		end
	end
end)