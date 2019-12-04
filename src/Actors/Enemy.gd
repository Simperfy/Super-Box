extends "res://src/Actors/Actor.gd"

func _ready():
	set_physics_process(false)
	velocity.x = -speed.x
	
func _on_StompCollisionDetector_body_entered(body: Player) -> void:
	#if(body.global_position.y > get_node("StompCollisionDetector").global_position.y):
		#return
	body.bounce()
	get_node("CollisionShape2D").set_deferred("disabled", true)
	queue_free()
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if(is_on_wall()):
		velocity.x *= -1.0
	
	velocity.y = move_and_slide(velocity, FLOOR_VECTOR).y
