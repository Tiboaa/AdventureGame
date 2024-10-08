extends Control

@onready var bg = $Background

var game_scene = "res://World/world_test.tscn"

func _ready():
	get_tree().paused = false
	
	#Background
	bg.layout_mode = PRESET_FULL_RECT
	bg.size = get_viewport_rect().size
	bg.color = Color("#007CB8")



func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	var _game_scene = get_tree().change_scene_to_file(game_scene)
	# game_start = get_tree().change_scene_to_file(game_scene) <- mi a különbség?
