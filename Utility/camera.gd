extends Camera2D



func _process(delta):
	movement()

func movement():
	if Input.is_action_pressed("up"):
		global_position.y -= 1
	if Input.is_action_pressed("down"):
		global_position.y += 1
	if Input.is_action_pressed("left"):
		global_position.x -= 1
	if Input.is_action_pressed("right"):
		global_position.x += 1
