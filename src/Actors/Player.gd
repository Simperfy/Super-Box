extends Actor
class_name Player

export var stomp_impulse = 1000.0

func _on_EnemyAreaDetector_area_entered(area: Area2D) -> void:
	velocity = get_stomp_velocity(velocity, stomp_impulse)

func _on_EnemyAreaDetector_body_entered(body: PhysicsBody2D):
	queue_free()
	
func _physics_process(delta: float) -> void:
	var is_jump_btn_released: = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction: = get_velocity_direction()
	velocity       = get_move_velocity(velocity, direction, speed, is_jump_btn_released)
	#print(velocity)
	velocity       = move_and_slide(velocity, FLOOR_VECTOR)
	
func get_velocity_direction() -> Vector2:
	return Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)
	
func get_move_velocity(oldVelocity: Vector2, direction: Vector2, speed: Vector2, is_jump_btn_released: bool) -> Vector2:
	var resultantVector: = oldVelocity
	resultantVector.x = speed.x * direction.x
	resultantVector.y += gravity * get_physics_process_delta_time()
	if (direction.y ==  -1.0):
		resultantVector.y += speed.y * direction.y
	
	if (is_jump_btn_released):
		resultantVector.y = 0.0
		
	return resultantVector

func get_stomp_velocity(oldVelocity: Vector2, impulse: float ) -> Vector2:	
	var resultantVector: = oldVelocity
	resultantVector.y = -impulse
	return resultantVector
