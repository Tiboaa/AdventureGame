extends TileMap

@onready var tile_map = $TileMap
var generated_chunks = []

func _ready():
	is_chunk_generated(Vector2(8,8))
	
func is_chunk_generated(pos):
	#print(pos)
	var chunk = local_to_map(pos)
	if not generated_chunks.has(chunk):
		generated_chunks.append(chunk)
		#print("generate chunk: ", chunk)
		tile_map.generate_chunk(pos, chunk)
