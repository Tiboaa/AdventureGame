extends Node2D


@onready var player = $Character
@onready var chunk = $Chunk
@onready var tile_ouline = $TileOutline
var is_moving = false

func _ready():
	_on_character_character_postion(Vector2(8,8))

func _process(delta):
	if Input.is_action_just_pressed("left_click") and not is_moving:
		tile_ouline.visible = true
		var clicked_global = get_global_mouse_position()
		var clicked_tile = chunk.tile_map.local_to_map(clicked_global)
		#print(clicked_tile)
		tile_ouline.global_position  = chunk.tile_map.map_to_local(clicked_tile)
		if chunk.tile_map.local_to_map(player.global_position) == clicked_tile:
			print("player clicked")
		else:
			var tile_type = chunk.tile_map.check_tile_type(clicked_tile)
			player.move_there(tile_ouline.global_position, tile_type)
			await get_tree().create_timer(0.3).timeout # TEMPORARY I NEED TO MOVE IT TO THE GIVEN POINT KINDA LIKE IN CIV6
			#if tile_tpye == Vector2i(-1,-1):
				#_on_character_character_postion(clicked_global)
				#tile_tpye = chunk.tile_map.check_tile_type(clicked_tile)
			#if tile_tpye != Vector2i(5,5):
				#await get_tree().create_timer(0.3).timeout # TEMPORARY I NEED TO MOVE IT TO THE GIVEN POINT KINDA LIKE IN CIV6
				#player.move_there(tile_ouline.global_position, tile_tpye)
		tile_ouline.visible = false

func _on_character_character_postion(character_pos):
	#print('signal emmited:', character_pos, chunk)
	chunk.is_chunk_generated(character_pos)

func _is_moving(moving):
	is_moving = moving



