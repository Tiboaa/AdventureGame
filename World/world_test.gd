extends Node2D

@onready var player = $%Character
@onready var chunk = $Chunk
@onready var tile_ouline = $TileOutline
@onready var pause = $%GUI/Pause
@onready var tile_info = "res://Utility/tile_info_db.gd"

var is_moving = false

func _ready():
	_on_character_character_postion(Vector2(8,8))

func _process(delta):
	if Input.is_action_just_pressed("right_click"):
		pass
	
	if Input.is_action_just_pressed("left_click") and not is_moving:
		var clicked_global = get_global_mouse_position()
		var clicked_tile = chunk.tile_map.local_to_map(clicked_global)
		#print(clicked_tile)
		tile_ouline.global_position  = chunk.tile_map.map_to_local(clicked_tile)
		if chunk.tile_map.local_to_map(player.global_position) == clicked_tile:
			print("player clicked")
			tile_ouline.visible = !tile_ouline.visible
			return
		if tile_ouline.visible == true:
			var tile_type = chunk.tile_map.check_tile_type(clicked_tile)
			player.move_there(tile_ouline.global_position, tile_type)
			await get_tree().create_timer(0.3).timeout # TEMPORARY I NEED TO MOVE IT TO THE GIVEN POINT KINDA LIKE IN CIV6
			tile_ouline.visible = false
			return

func _on_character_character_postion(character_pos):
	#print('signal emmited:', character_pos, chunk)
	chunk.is_chunk_generated(character_pos)

func _is_moving(moving):
	is_moving = moving

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc"):
		if pause.visible == false:
			pause.visible = true
			get_tree().paused = true

func _on_resume_pressed():
	pause.visible = false
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
