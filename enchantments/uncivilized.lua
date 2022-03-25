local S = minetest.get_translator("selims_enchants")

--mcl_damage.register_modifier(func, priority)

mcl_enchanting.enchantments.uncivilized = {
	name = S("Uncivilized"),
	max_level = 5,
	primary = {sword = true},
	secondary = {axe = true},
	disallow = {},
	incompatible = {bane_of_arthropods = true, sharpness = true, smite = true},
	weight = 5,
	description = S("Increases damage to human-like mobs."),
	curse = false,
	requires_tool = false,
	treasure = true,
	power_range_table = {{5, 25}, {13, 33}, {21, 41}, {29, 49}, {37, 57}},
	inv_combat_tab = true,
	inv_tool_tab = false,
}