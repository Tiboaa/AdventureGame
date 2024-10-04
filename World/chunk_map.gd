extends TileMap



var land_noise = FastNoiseLite.new()
var height_noise = FastNoiseLite.new()
var biome_noise = FastNoiseLite.new()
var grass_noise = FastNoiseLite.new()
var tree_noise = FastNoiseLite.new()

var world = get_parent()
const SIZE = 16

var chunk_placement = Vector2(0,0)

func _ready():
	generate_noise()

func generate_noise():
	land_noise.seed = randi()
	land_noise.frequency = 0.02
	
	biome_noise.seed = randi()
	
	height_noise.seed = randi()
	height_noise.frequency = 0.006
	height_noise.fractal_type = FastNoiseLite.FRACTAL_PING_PONG
	height_noise.fractal_octaves = 2
	height_noise.fractal_gain = 0.3
	height_noise.fractal_ping_pong_strength = 4

	grass_noise.seed = randi()
	tree_noise.seed = randi()
	
func generate_chunk(pos, chunk):
	var tile_position = local_to_map(pos)
	#print(tile_position)
	if tile_position.x % 16 != 0:
		tile_position.x = round_down_to_nearest_16(tile_position.x)
		#print("pos x change: ", tile_position)
	if tile_position.y % 16 != 0:
		tile_position.y = round_down_to_nearest_16(tile_position.y)
		#print("pos y change: ", tile_position)
	for x in range(SIZE):
		for y in range(SIZE):
			set_cell(0, Vector2i(tile_position.x + x, tile_position.y + y), 0, get_land(tile_position, x, y))
			
	while check_tile_type(Vector2i(0, 0)) == Vector2i(5, 5): # STOPS WATER SPAWNS
		#print('reroll')
		generate_noise()
		generate_chunk(pos, chunk)

func get_land(tile_pos, X, Y):
	var land = land_noise.get_noise_2d(tile_pos.x + X, tile_pos.y + Y)
	var biome = biome_noise.get_noise_2d(tile_pos.x + X, tile_pos.y + Y)
	var height = height_noise.get_noise_2d(tile_pos.x + X, tile_pos.y + Y)
	var grass = grass_noise.get_noise_2d(tile_pos.x + X, tile_pos.y + Y)
	var trees = tree_noise.get_noise_2d(tile_pos.x + X, tile_pos.y + Y)
	
	var biome_index = 0 # GRASS
	var vegetation_index = 0 # NOTHING
	
	if land >= 0:
		if biome > 0: 
			biome_index = 2 # STEPPE
			if biome > 0.5:
				biome_index = 4 # DESERT
			
		if grass > 0.4:
			vegetation_index = 1 # GRASS
		if trees > 0.1:
			vegetation_index = 2 # TREES --> TREES OVERWRITE GRASS RN ITS INTENDED --> FEATURE
			
		if height > 0.8:
			return Vector2(biome_index, 3) # MOUNTAIN
		if height > 0.6:
			return Vector2(biome_index + 1, vegetation_index) # HILL
			
		return Vector2(biome_index, vegetation_index) # LAND
	return Vector2i(5,5) # WATER
	

func check_tile_type(clicked_tile):
	#var clicked_tile = map_to_local(clicked_pos)
	#print(get_cell_atlas_coords(0, clicked_tile))
	return get_cell_atlas_coords(0, clicked_tile)

func round_down_to_nearest_16(n: int) -> int:
	if n >= 0:
		return n - (n % 16)
	else:
		return n - (n % 16) if n % 16 == 0 else n - (n % 16) - 16
		
#func highlight_position(mousePos):
	#var clicked_tile = map_to_local(mousePos)
	#tile_outline.position = mousePos
	#tile_outline.visible = true
	
	
	
