extends TileMap

var land_noise = FastNoiseLite.new()
var height_noise = FastNoiseLite.new()
var biome_noise = FastNoiseLite.new()
var grass_noise = FastNoiseLite.new()
var tree_noise = FastNoiseLite.new()

const CHUNK = 16

@onready var player = get_parent().get_child(2) #THIS IS STUPID CHANGE IT LATER
var last_generated_player_pos = Vector2(0,0)

func _ready():
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
	
	generate_chunk(player.position, Vector2(0,0))
	#generate_chunk(player.position - Vector2(pow(CHUNK, 2), 0))
	#generate_chunk(player.position - Vector2(0, pow(CHUNK, 2)))
	#generate_chunk(player.position - Vector2(pow(CHUNK, 2), pow(CHUNK, 2)))
	
func _process(delta):
	if last_generated_player_pos.x + pow(CHUNK, 2) <= player.position.x:
		generate_chunk(player.position, Vector2(0,0))
		last_generated_player_pos = player.position
	if last_generated_player_pos.x - pow(CHUNK, 2) >= player.position.x:
		generate_chunk(player.position, Vector2(0,0))
		last_generated_player_pos = player.position
	
		
		
func generate_chunk(pos, placement):
	var tile_position = local_to_map(pos) - Vector2i(CHUNK/2, CHUNK/2)
	for x in range(CHUNK):
		for y in range(CHUNK):
			set_cell(0, Vector2i(tile_position.x + x, tile_position.y + y), 0, get_land(tile_position, x, y))
			
			

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
	

