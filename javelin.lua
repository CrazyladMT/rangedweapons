core.register_craftitem("rangedweapons:thrown_javelin", {
	wield_scale = {x = 2.0, y = 2.0, z = 1.0},
	inventory_image = "rangedweapons_thrown_javelin.png",
})

core.register_tool("rangedweapons:javelin", {
	description = core.colorize("#35cdff","Javelin\n") ..
		"Melee damage: 8\n" ..
		"Melee range: 4.5\n" ..
		"Full punch interval: 1.25\n" ..
		"Ranged damage: 9\n" ..
		"Accuracy: 92%\n" ..
		"knockback: 10\n" ..
		"Critical chance: 11%\n" ..
		"Critical efficiency: 2.5x\n" ..
		"Projectile gravity: 6\n" ..
		"Projectile velocity: 35\n" ..
		"Enemy penetration: 50%\n" ..
		core.colorize("#ffc000", "Right-click to throw, Left-click to stab\n") ..
		core.colorize("#ffc000", "Throwing wears the javelin out 5x faster than stabbing."),

	wield_scale = {x = 2.0, y = 2.0, z = 1.0},
	range = 4.5,
	inventory_image = "rangedweapons_javelin.png",
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level = 0,
		groupcaps = {
			stabby = {times={[1] = 0.25, [2] = 0.50, [3] = 0.75}, uses = 66.6, maxlevel = 2},
		},
		damage_groups = {fleshy = 8, knockback = 10},
	},
	RW_throw_capabilities = {
		throw_damage = {fleshy = 9, knockback = 10},
		throw_crit = 11,
		throw_critEffc = 2.5,
		throw_skill = {"throw_skill", 20},
		throw_velocity = 40,
		throw_accuracy = 92,
		throw_cooldown = 0.0,
		throw_projectiles = 1,
		throw_gravity = 6,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 50,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:thrown_javelin",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 1,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
		OnCollision = function(player, bullet, target)
			local throwDur = 40
			if bullet.wear + (65535 / throwDur) < 65535 then
				javStack = {name = "rangedweapons:javelin", wear = (bullet.wear) + (65535 / throwDur)}
				core.add_item(bullet.object:get_pos(), javStack)
			end
		end,
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
		rangedweapons_yeet(itemstack, user)
		return itemstack
	end,
})




