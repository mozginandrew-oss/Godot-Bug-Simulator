extends CharacterBody2D

@export var speed = 400
const acceleration: int = 5
const friction: int = 5

var knockback: Vector2 = Vector2.ZERO
var knockback_timer: float = 0.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
		
func _physics_process(delta):
	var _collision = move_and_collide(velocity * delta)		
	if knockback_timer > 0.0:
		velocity = knockback
		knockback_timer -= delta
		if knockback_timer <= 0.0:
			knockback = Vector2.ZERO	
	else:
		_movement(delta)
	move_and_slide()


func _movement(delta: float) -> void:
	var input = Vector2(
		Input.get_action_strength('ui_right') - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	var lerp_weight = delta * (acceleration if input else friction)
	velocity = lerp(velocity, input * speed, lerp_weight)
	
func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	knockback = direction * force
	knockback_timer = knockback_duration
