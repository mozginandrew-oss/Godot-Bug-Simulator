extends CharacterBody2D
@onready var player_node: CharacterBody2D = get_tree().root.get_node("/root/Node2D/GodotPlayer")
@onready var terget = player_node
var speed: float = 250.0
var gravity = 20

var dir = 1


func _physics_process(delta: float) -> void:
	var direction = (player_node.position-player_node.position).normalized()
	var _collision = move_and_collide(velocity * delta)
	velocity = direction * speed
	look_at(terget.position)
	move_and_slide()
	if player_node:
		$Enemy.look_at(player_node.global_position)
		velocity = lerp(velocity, direction * speed, 8.5 * delta)
		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player_node:
		var knockback_direction = (body.global_position - global_position).normalized()
		body.apply_knockback(knockback_direction, 500, 150)
