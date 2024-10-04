extends Control

@onready var bg = $Background


func _ready():
	#Background
	bg.layout_mode = PRESET_FULL_RECT
	bg.size = get_viewport_rect().size
	bg.color = Color("#007CB8")

