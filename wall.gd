extends StaticBody2D
@onready var terget




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace xtends CharacterBody2D

func apply_impulse(_delta) -> void:
	apply_impulse(Vector2(0, -200))

# Called every frame. 'delta' is the elapsed time since the previous frame.
