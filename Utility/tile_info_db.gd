extends Node

const tile_info = {
	# GRASS LAND
	Vector2(0, 0): {
		"type": "land",
		"height": "flat",
		"biome": "grassland",
		"vegetation": null,
		"movement_cost": 1.0
	},
	Vector2(0, 1): {
		"type": "land",
		"height": "flat",
		"biome": "grassland",
		"vegetation": "tall_grass",
		"movement_cost": 1.5
	},
	Vector2(0, 2): {
		"type": "land",
		"height": "flat",
		"biome": "grassland",
		"vegetation": "trees",
		"movement_cost": 2.0
	},
	Vector2(0, 3): {
		"type": "land",
		"height": "mountain",
		"biome": "grassland",
		"vegetation": null,
		"movement_cost": 4.0
	},
	Vector2(1, 0): {
		"type": "land",
		"height": "hill",
		"biome": "grassland",
		"vegetation": null,
		"movement_cost": 2.0
	},
	Vector2(1, 1): {
		"type": "land",
		"height": "hill",
		"biome": "grassland",
		"vegetation": "tall_grass",
		"movement_cost": 2.5
	},
	Vector2(1, 2): {
		"type": "land",
		"height": "hill",
		"biome": "grassland",
		"vegetation": "trees",
		"movement_cost": 3.0
	},
	
	# SAVANNA
	Vector2(2, 0): {
		"type": "land",
		"height": "flat",
		"biome": "savanna",
		"vegetation": null,
		"movement_cost": 1.0
	},
	Vector2(2, 1): {
		"type": "land",
		"height": "flat",
		"biome": "savanna",
		"vegetation": "tall_grass",
		"movement_cost": 1.5
	},
	Vector2(2, 2): {
		"type": "land",
		"height": "flat",
		"biome": "savanna",
		"vegetation": "trees",
		"movement_cost": 2.0
	},
	Vector2(2, 3): {
		"type": "land",
		"height": "mountain",
		"biome": "savanna",
		"vegetation": null,
		"movement_cost": 4.0
	},
	Vector2(3, 0): {
		"type": "land",
		"height": "hill",
		"biome": "savanna",
		"vegetation": null,
		"movement_cost": 2.0
	},
	Vector2(3, 1): {
		"type": "land",
		"height": "hill",
		"biome": "savanna",
		"vegetation": "tall_grass",
		"movement_cost": 2.5
	},
	Vector2(3, 2): {
		"type": "land",
		"height": "hill",
		"biome": "savanna",
		"vegetation": "trees",
		"movement_cost": 3.0
	},
	
	# DESERT
	Vector2(4, 0): {
		"type": "land",
		"height": "flat",
		"biome": "desert",
		"vegetation": null,
		"movement_cost": 1.0
	},
	Vector2(4, 1): {
		"type": "land",
		"height": "flat",
		"biome": "desert",
		"vegetation": "tall_grass",
		"movement_cost": 1.5
	},
	Vector2(4, 2): {
		"type": "land",
		"height": "flat",
		"biome": "desert",
		"vegetation": "trees",
		"movement_cost": 2.0
	},
	Vector2(4, 3): {
		"type": "land",
		"height": "mountain",
		"biome": "desert",
		"vegetation": null,
		"movement_cost": 4.0
	},
	Vector2(5, 0): {
		"type": "land",
		"height": "hill",
		"biome": "desert",
		"vegetation": null,
		"movement_cost": 2.0
	},
	Vector2(5, 1): {
		"type": "land",
		"height": "hill",
		"biome": "desert",
		"vegetation": "tall_grass",
		"movement_cost": 2.5
	},
	Vector2(5, 2): {
		"type": "land",
		"height": "hill",
		"biome": "desert",
		"vegetation": "trees",
		"movement_cost": 3.0
	},
	
	# WATER
	Vector2(5, 5): {
		"type": "water",
		"height": "below_sea_level",
		"biome": "sea",
		"vegetation": null,
		"movement_cost": 9999.5
	}
}
