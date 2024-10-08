extends CharacterBody2D

@onready var tile_info = "res://Utility/tile_info_db.gd"

const CHUNK = 16
@export var base_movement_wallet = 6

signal is_moving(moving)
signal character_postion(character_pos)


var past_position
var click_position = Vector2(0, 0)

func _ready():
	past_position = global_position
	#emit_signal("character_postion", global_position)

func _physics_process(delta):
	pass

func move_there(pos, tile_type):
	var movement_wallet = base_movement_wallet
	emit_signal("is_moving", true)
	if past_position != pos:
		var past_tile = Vector2i(past_position.x / CHUNK, past_position.y / CHUNK)
		var new_tile = Vector2i(pos.x / CHUNK, pos.y / CHUNK)
		if abs(past_tile.x - new_tile.x) + abs(past_tile.y - new_tile.y) > movement_wallet:
			emit_signal("is_moving", false)
			return
		if tile_type == Vector2i(-1, -1):
			emit_signal("character_postion", pos)
			emit_signal("is_moving", false)
			return
		if tile_type == Vector2i(5, 5):
			emit_signal("is_moving", false)
			return
			
		past_position = pos
	var anim_mov_cost = global_position-pos
	#print(movement_cost)
	if movement_wallet > 0:
		while anim_mov_cost.x < 0:
			global_position.x += 0.5
			anim_mov_cost.x += 0.5
			await get_tree().create_timer(0.01).timeout
		while anim_mov_cost.x > 0:
			global_position.x -= 0.5
			anim_mov_cost.x -= 0.5
			await get_tree().create_timer(0.01).timeout
		while anim_mov_cost.y < 0:
			global_position.y += 0.5
			anim_mov_cost.y += 0.5
			await get_tree().create_timer(0.01).timeout
		while anim_mov_cost.y > 0:
			global_position.y -= 0.5
			anim_mov_cost.y -= 0.5
			await get_tree().create_timer(0.01).timeout
	emit_signal("is_moving", false)
	#global_position = pos
	

func get_tiles_between_target(past_tile, new_tile):
	pass


